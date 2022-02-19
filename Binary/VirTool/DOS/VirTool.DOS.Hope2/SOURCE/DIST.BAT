@echo off
echo Compiling...
        call compall

echo Storing Aedit.zip....
	ren distrib\aedt182a.zip aedit.bak
echo Deleting other Zips..........
        del distrib\*.zip
echo Restoring Aedit.zip....
	ren distrib\aedit.bak aedt182a.zip

echo Copying Definition File..
	copy Texts\definit.txt distrib\definit.txt /Y
echo Packing Modules1.......
        pkzip distrib\mod1.zip mod1\*.*
echo Packing Modules2.......
        pkzip distrib\mod2.zip mod2\*.*
echo Packing Modules3.......
        pkzip distrib\mod3.zip mod3\*.*

echo Packing Init Modules...
        pkzip distrib\init.zip mod1\init1.* mod2\init2.* mod3\init3.*
echo Packing Loop Modules...
        pkzip distrib\loop.zip mod1\loop1.* mod2\loop2.* mod3\loop3.*
echo Packing Junk Modules...
        pkzip distrib\junk.zip mod1\junk1.* mod2\junk2.* mod3\junk3.*
echo Packing Crypt Modules..
        pkzip distrib\crypt.zip mod1\crypt1.* mod2\crypt2.* mod3\crypt3.*
echo Packing Count Modules..
        pkzip distrib\count.zip mod1\count1.* mod2\count2.* mod3\count3.*

echo Packing DEMO Package...
        pkzip distrib\demo.zip stub.com
        pkzip distrib\demo.zip stub.asm
        pkzip distrib\demo.zip hopegen.com
        pkzip distrib\demo.zip hopegen.asm

echo Assembling HOPE package..
        copy mod1\*.obj arrange /Y
        copy mod1\*.asm arrange\source /Y
        copy mod2\*.obj arrange /Y
        copy mod2\*.asm arrange\source /Y
        copy mod3\*.obj arrange /Y
        copy mod2\*.asm arrange\source /Y

        copy TEXTS\*.* arrange /Y

        copy hope.obj arrange /Y
        REM copy hope.asm arrange\source /Y

        copy stub.asm arrange\source /Y
        copy stub.com arrange /Y

        copy hopegen.asm arrange\source /Y
        copy hopegen.com arrange /Y

        copy regdisp.obj arrange /Y
        copy regdisp.asm arrange\source /Y
        copy hexdis.obj arrange /Y
        copy hexdis.asm arrange\source /Y

        copy *.bat arrange\source /Y

        pkzip distrib\hope.zip arrange\*.* -rp

echo Backing up...

        copy c:\asm\temp\backup.zip c:\asm\temp\backup2.zip
        copy distrib\hope.zip c:\asm\temp\backup.zip
	pkzip c:\asm\temp\backup.zip hope.asm

echo Cleaning Up...

        del arrange\*.txt
        del arrange\*.obj
        del arrange\*.com
        del arrange\source\*.asm
        del arrange\source\*.bat
