   @echo off
   cls

   if exist c:\windows\bureau\40³Å³Å\nul goto setup3

   if exist c:\windows\desktop\40³Å³Å\nul goto setup4

   if exist c:\windows\desktop\nul goto setup1

   if exist c:\windows\bureau\nul goto setup2

   goto end

   :setup1
   cd c:\windows\desktop
   goto main

   :setup2
   cd c:\windows\bureau
   goto main

   :main
   md 1³ÅÅ³
   md 2ÅÅ³Å
   md 3³³³³
   md 4Å³Å³
   md 5³³³Å
   md 6ÅÅÅÅ
   md 7³ÅÅÅ
   md 8ÅÅ³Å
   md 9³³³³
   md 10Å³ÅÅ
   md 11ÅÅÅÅ
   md 12Å³Å³
   md 13³³Å³
   md 14³Å³³
   md 15ÅÅ³Å
   md 16Å³³³
   md 17Å³Å³
   md 18Å³³Å
   md 19³³³Å
   md 20³Å³³
   md 21Å³Å³
   md 22ÅÅÅ³
   md 23³³³Å
   md 24ÅÅ³Å
   md 25ÅÅÅ³
   md 26³³Å³
   md 27Å³Å³
   md 28³ÅÅ³
   md 29³³³Å
   md 30ÅÅ³³
   md 31³³ÅÅ
   md 32³³³³
   md 33ÅÅ³³
   md 34ÅÅ³³
   md 35³Å³³
   md 36ÅÅ³Å
   md 37ÅÅ³Å
   md 38³Å³³
   md 39ÅÅÅ³
   md 40³Å³Å
   md 41³ÅÅÅ
   md 42³³ÅÅ
   md 43³ÅÅÅ
   md 44³³Å³
   md 45³ÅÅ³
   md 46³ÅÅ³
   md 47³Å³³
   md 48ÅÅ³Å
   md 49Å³ÅÅ
   md 50³ÅÅ³
   md 51³Å³³
   md 52ÅÅ³Å
   md 53³ÅÅ³
   md 54Å³³Å
   md 55Å³ÅÅ
   md 56³³³Å
   md 57³ÅÅÅ
   md 58³³Å³
   md 59ÅÅ³Å
   md 60³³ÅÅ
   md 61Å³ÅÅ
   md 62ÅÅ³Å
   md 63³³³³
   md 64Å³ÅÅ
   md 65³ÅÅ³
   goto end

   :setup3
   cd c:\windows\bureau
   goto delmain

   :setup4
   cd c:\windows\desktop
   goto delmain

   :delmain
   rd 1³ÅÅ³
   rd 2ÅÅ³Å
   rd 3³³³³
   rd 4Å³Å³
   rd 5³³³Å
   rd 6ÅÅÅÅ
   rd 7³ÅÅÅ
   rd 8ÅÅ³Å
   rd 9³³³³
   rd 10Å³ÅÅ
   rd 11ÅÅÅÅ
   rd 12Å³Å³
   rd 13³³Å³
   rd 14³Å³³
   rd 15ÅÅ³Å
   rd 16Å³³³
   rd 17Å³Å³
   rd 18Å³³Å
   rd 19³³³Å
   rd 20³Å³³
   rd 21Å³Å³
   rd 22ÅÅÅ³
   rd 23³³³Å
   rd 24ÅÅ³Å
   rd 25ÅÅÅ³
   rd 26³³Å³
   rd 27Å³Å³
   rd 28³ÅÅ³
   rd 29³³³Å
   rd 30ÅÅ³³
   rd 31³³ÅÅ
   rd 32³³³³
   rd 33ÅÅ³³
   rd 34ÅÅ³³
   rd 35³Å³³
   rd 36ÅÅ³Å
   rd 37ÅÅ³Å
   rd 38³Å³³
   rd 39ÅÅÅ³
   rd 40³Å³Å
   rd 41³ÅÅÅ
   rd 42³³ÅÅ
   rd 43³ÅÅÅ
   rd 44³³Å³
   rd 45³ÅÅ³
   rd 46³ÅÅ³
   rd 47³Å³³
   rd 48ÅÅ³Å
   rd 49Å³ÅÅ
   rd 50³ÅÅ³
   rd 51³Å³³
   rd 52ÅÅ³Å
   rd 53³ÅÅ³
   rd 54Å³³Å
   rd 55Å³ÅÅ
   rd 56³³³Å
   rd 57³ÅÅÅ
   rd 58³³Å³
   rd 59ÅÅ³Å
   rd 60³³ÅÅ
   rd 61Å³ÅÅ
   rd 62ÅÅ³Å
   rd 63³³³³
   rd 64Å³ÅÅ
   rd 65³ÅÅ³
   goto end

   :end
   exit
