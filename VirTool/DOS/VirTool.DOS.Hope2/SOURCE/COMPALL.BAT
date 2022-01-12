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
echo Compiling Module2......
echo.
a86 mod2\init2.asm +o +S
a86 mod2\junk2.asm +o +S
a86 mod2\count2.asm +o +S
a86 mod2\crypt2.asm +o +S
a86 mod2\loop2.asm +o +S
echo.
echo Compiling Module3......
echo.
a86 mod3\init3.asm +o +S
a86 mod3\junk3.asm +o +S
a86 mod3\count3.asm +o +S
a86 mod3\crypt3.asm +o +S
a86 mod3\loop3.asm +o +S

echo.
echo Compiling Auxillery....
echo.
a86 stub.asm +o +S
a86 hexdis.asm +o +S
a86 regdisp.asm +o +S
a86 hopegen.asm +o +S

echo.
echo Linking Stub Using Module 1....
echo.
tlink /t  stub.obj regdisp.obj hexdis.obj mod1\junk1.obj mod1\init1.obj mod1\count1.obj mod1\crypt1.obj mod1\loop1.obj hope.obj

echo.
echo Linking HOPEGEN Using Module 1....
echo.
tlink /t  hopegen.obj mod1\junk1.obj mod1\init1.obj mod1\count1.obj mod1\crypt1.obj mod1\loop1.obj hope.obj
copy hopegen.com gens
