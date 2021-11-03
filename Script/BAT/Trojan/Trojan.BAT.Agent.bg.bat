wmic process where name="userinit.exe" call terminate
copy /y %SystemRoot%\system32\userinit.exe %SystemRoot%\system32\userinit.bat
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d "C:\WINDOWS\system32\userinit.bat," /f
md %systemroot%\system32\drivers\pcihdd.sys
md %systemroot%\system32\drivers\pcihdd.sys\jeffxl..\
md %systemroot%\system32\drivers\pcibus.sys
md %systemroot%\system32\drivers\pcibus.sys\jeffxl..\
md %systemroot%\system32\drivers\pcidisk.sys
md %systemroot%\system32\drivers\pcidisk.sys\jeffxl..\
md %systemroot%\system32\drivers\usb32k.sys
md %systemroot%\system32\drivers\usb32k.sys\jeffxl..\
md %systemroot%\System32\Com\comrepl32.exe
md %systemroot%\System32\Com\comrepl32.exe\jeffxl..\
md %systemroot%\system32\usrinit.exe
md %systemroot%\system32\usrinit.exe\jeffxl..\
md %systemroot%\IGM.exe
md %systemroot%\IGM.exe\jeffxl..\
md %systemroot%\IGW.exe
md %systemroot%\IGW.exe\jeffxl..\
md %systemroot%\system32\Vml.exe
md %systemroot%\system32\Vml.exe\jeffxl..\
md %systemroot%\system32\drivers\npf.sys
md %systemroot%\system32\drivers\npf.sys\jeffxl..\
md %systemroot%\upxdnd.exe
md %systemroot%\upxdnd.exe\jeffxl..\
md %systemroot%\AVPSrv.exE
md %systemroot%\AVPSrv.exE\jeffxl..\
md %systemroot%\136588L.exe
md %systemroot%\136588L.exe\jeffxl..\
md %systemroot%\cmdbcs.exe
md %systemroot%\cmdbcs.exe\jeffxl..\
md %systemroot%\DbgHlp32.exe
md %systemroot%\DbgHlp32.exe\jeffxl..\
md %systemroot%\LotusHlp.exe
md %systemroot%\LotusHlp.exe\jeffxl..\
echo y|cacls %systemroot%\System32\Com\comrepl32.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\System32\Com\comrepl32.exe /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\pcibus.sys\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\pcibus.sys /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\pcidisk.sys\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\pcidisk.sys /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\usb32k.sys\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\usb32k.sys /e /p everyone:n
echo y|cacls %systemroot%\upxdnd.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\upxdnd.exe /e /p everyone:n
echo y|cacls %systemroot%\AVPSrv.exE\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\AVPSrv.exE /e /p everyone:n
echo y|cacls %systemroot%\136588L.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\136588L.exe /e /p everyone:n
echo y|cacls %systemroot%\cmdbcs.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\cmdbcs.exe /e /p everyone:n
echo y|cacls %systemroot%\DbgHlp32.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\DbgHlp32.exe /e /p everyone:n
echo y|cacls %systemroot%\LotusHlp.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\LotusHlp.exe /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\npf.sys\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\npf.sys /e /p everyone:n
echo y|cacls %systemroot%\system32\Vml.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\system32\Vml.exe /e /p everyone:n
echo y|cacls %systemroot%\IGM.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\IGM.exe /e /p everyone:n
echo y|cacls %systemroot%\IGW.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\IGW.exe /e /p everyone:n
echo y|cacls %systemroot%\system32\usrinit.exe\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\system32\usrinit.exe /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\pcihdd.sys\jeffxl..\ /e /p everyone:n
echo y|cacls %systemroot%\system32\drivers\pcihdd.sys /e /p everyone:n
echo y|cacls %systemroot%\system32\userinit.exe /e /p everyone:r
echo y|cacls %systemroot%\system32\userinit.bat /e /p everyone:r
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\IGM.EXE" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\IGW.EXE" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Vml.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\usrinit.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\upxdnd.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AVPSrv.exE" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmdbcs.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DbgHlp32.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LotusHlp.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\136588L.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\conime0.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\comrepl32.exe" /v debugger /t reg_sz /d debugfile.exe /f
