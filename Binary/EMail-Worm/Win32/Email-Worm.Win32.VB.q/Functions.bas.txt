   Attribute VB_Name = "Functions"
   '================================================
   '|  Pilif ... [JOS CeNzurA]!                    |
   '|  Rott_En | Dark Coderz Alliance              |
   '|  Manifesto for the human right of expression |
   '|  No more censore!                            |
   '================================================
   Option Explicit
   Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" ( _
        ByVal lpBuffer As String, _
        ByVal nSize As Long) As Long

   Public vname(1 To 10)
   Public vext(1 To 6)
   Public AV(1 To 13)
   Public mnth(1 To 12)

   Function GetSysDir() As String
   Dim Temp As String * 256
   Dim x As Integer
   x = GetSystemDirectory(Temp, Len(Temp))
   GetSysDir = Left$(Temp, x)
   End Function

   Function FileExist(ByRef sFname) As Boolean
   If Len(dir(sFname, 16)) Then FileExist = True Else FileExist = False
   End Function


   '================================================
   '|  Pilif ... [JOS CeNzurA]!                    |
   '|  Rott_En | Dark Coderz Alliance              |
   '|  Manifesto for the human right of expression |
   '|  No more censore!                            |
   '================================================
