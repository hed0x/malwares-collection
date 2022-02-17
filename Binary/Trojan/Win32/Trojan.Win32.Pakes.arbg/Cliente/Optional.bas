Attribute VB_Name = "Optional"
Public Function FileExist(Filename As String) As Boolean

  On Error GoTo NotExist
  
  Call FileLen(Filename)
  FileExist = True
  Exit Function
  
NotExist:
  
End Function
