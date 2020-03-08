   On Error Resume Next
   Msgbox "Hello, and welcome to your custom made antivirus, programmed just for you, by Wicked-Warlock on keeping those loose virii of yours intact and not spreading all over your computer if you accidentally open them."

   Sub Inst1
   set A= "C:\Program Files"
   set MY= Msgbox("'Program Files' Folder found. Begin Installation?", vbYesNo)
   set MN= Msgbox("'Program Files' Folder not found. Begin Installation anyway?", vbYesNo)
   If exist A Then MY
   Else MN
   If MY= vbYes Then Mkdir "c:\Program Files\K-Oni Enterprises"
   Else GoTo Exit
   If MN= vbYes Then Mkdir "C:\K-Oni Enterprises"
   Else GoTo Exit
   End Sub
   GoTo Inst2

   Sub Inst2
   B="C:\Program Files\K-Oni Enterprises"
   C="C:\K-Oni Enterprises"
   If Exist B then
   mkdir "C:\Program Files\K-Oni Enterprises\Antivirus"
   mkdir "C:\Program Files\K-Oni Enterprises\Antivirus\Settings"
   mkdir "C:\Program Files\K-Oni Enterprises\Antivirus\Bio Center"
   Name "c:Bio Shield.vbs" as "C:\Program Files\K-Oni Enterprises\Antivirus\Bio Shield.vbs"
   run "c:Support1.bat"
   SetAttr "C:\Program Files\K-Oni Enterprises\Biocenter", vbCompressed+vbReadOnly
   Else If Exist C then
   mkdir "C:\K-Oni Enterprises\Antivirus"
   mkdir "C:\K-Oni Enterprises\Antivirus\Settings"
   mkdir "C:\K-Oni Enterprises\Antivirus\Bio Center"
   Name "c:Bio Shield.vbs" as "C:\K-Oni Enterprises\Antivirus\Bio Shield.vbs"
   run "c:Support1.bat"
   SetAttr "C:\K-Oni Enterprises\Biocenter", vbCompressed+vbReadOnly
   Else Goto Exit
   End Sub
   Goto Exit

   Sub Exit
   Msgbox "K-Oni Enterprises Antivirus successfully installed."
   End
   End Sub
