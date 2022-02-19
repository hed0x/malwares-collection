@echo off
echo Compiling Engine.......
echo.
a86 hope.asm +o +S

echo.
echo Compiling Module1......
echo.
a86 mod1\init1.asm +o +S
a86 mod1\junk1.asm +o +S
a86 mod1\count1.asm +o +S
a86 mod1\crypt1.asm +o +S
a86 mod1\loop1.asm +o +S

echo.
echo Compiling Auxillery....
echo.
a86 stub.asm +o +S
a86 hexdis.asm +o +S
a86 regdisp.asm +o +S

echo.
echo Linking Stub Using Module 1....
echo.
tlink /t  stub.obj regdisp.obj hexdis.obj mod1\junk1.obj mod1\init1.obj mod1\count1.obj mod1\crypt1.obj mod1\loop1.obj hope.obj
