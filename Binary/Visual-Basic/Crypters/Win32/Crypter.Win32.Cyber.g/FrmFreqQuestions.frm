VERSION 5.00
Begin VB.Form FrmFreqQuestions 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Frequently asked questions"
   ClientHeight    =   3855
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6615
   Icon            =   "FrmFreqQuestions.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3855
   ScaleWidth      =   6615
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox HelpCombo 
      Height          =   315
      Index           =   1
      ItemData        =   "FrmFreqQuestions.frx":030A
      Left            =   3360
      List            =   "FrmFreqQuestions.frx":0338
      TabIndex        =   1
      Text            =   "Select a Non-technical explanation"
      Top             =   480
      Width           =   3135
   End
   Begin VB.ComboBox HelpCombo 
      Height          =   315
      Index           =   0
      ItemData        =   "FrmFreqQuestions.frx":0564
      Left            =   120
      List            =   "FrmFreqQuestions.frx":0586
      TabIndex        =   0
      Text            =   "Select a technical explanation"
      Top             =   480
      Width           =   3135
   End
   Begin VB.CommandButton OKCmd 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   5520
      TabIndex        =   3
      Top             =   3360
      Width           =   975
   End
   Begin VB.Label QInfo 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   2295
      Left            =   120
      TabIndex        =   2
      Top             =   960
      Width           =   6375
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Non-Technical:"
      Height          =   195
      Left            =   3360
      TabIndex        =   5
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Technical:"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   240
      Width           =   750
   End
End
Attribute VB_Name = "FrmFreqQuestions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub HelpCombo_Change(Index As Integer)

    If Index = 0 Then
        
        If HelpCombo.Item(0).ListIndex = 0 Then QInfo.Caption = "The Offset is where the file starts in the archive. (Where the appending (Positioning) point starts for the file)"
        If HelpCombo.Item(0).ListIndex = 1 Then QInfo.Caption = "The VirusScan can only be used when you have specified the VirusScan program location. To do this enter the VirusScan options and find the program by clicking on the browse button. After that you can scan you archive for errors."
        If HelpCombo.Item(0).ListIndex = 2 Then QInfo.Caption = "QuickView is were you view or test your files, depending on what program you use to do it. You can configure the settings for QuickView in the QuickView settings. Before using this feature you must specify a program that can view most type of file(s)."
        If HelpCombo.Item(0).ListIndex = 3 Then QInfo.Caption = "If you use the encryption and decryption archive when creating a new archive then when adding files to the archive they are encrypted. If you add a password list or any text document to the archive you will not be able to read them while in the archive. You will first have to extract them."
        If HelpCombo.Item(0).ListIndex = 4 Then QInfo.Caption = "If making an non-compression archive the Size and packed propertie value should be the same. When having a compression archive the Size and Packed properties are usually different, this varies because files are compressed into the archive. The Size propertie shows what the original size of the file is outside of the archive. The Packed propertie shows the size of the file while in the archive."
        If HelpCombo.Item(0).ListIndex = 5 Then QInfo.Caption = "A Swap archive acts the same as a normal non-compression archive. But what happens is when adding a file, this type of archive splits the file up into smallier pieces and uses less memory."
        If HelpCombo.Item(0).ListIndex = 6 Then QInfo.Caption = "If you are having troubles with opening an archive created with an older version of CyberCrypt and the file isn't corrupt, it might need to be converted. To do this open the archive and wait until a message appears. If not and it doesn't this means that the archive is not valid within the newer version of CyberCrypt, but still might be able to open it in an older version. Click yes on the message box if appears then when the conversion dialog loads click convert. From then on follow the instructions. When finished conversion the archive then should open."
        If HelpCombo.Item(0).ListIndex = 7 Then QInfo.Caption = "The saved space propertie in the main window is mainly used in the compression archive. It shows how much space you have saved for each file in the archive, Ie (Size 670 KB - Packed 100 KB) Space Saved (570 KB)."
        If HelpCombo.Item(0).ListIndex = 8 Then QInfo.Caption = "The light indercators in the Saved Space propertie specify if you have saved space adding specified file or if you have lost space adding specified file. Red indercates that you have lost space, Green indercates that you have saved space and the blue light indercates you have nor lost or saved space adding the specified file."
        If HelpCombo.Item(0).ListIndex = 9 Then QInfo.Caption = "The only reason the red light might be on for ages while loading an archive is that the archive might hold a lot of files and has to find the correct data in that archive. When the archive loads and their hasn't been any errors with doing so, the red light should turn back to green."
               
    ElseIf Index = 1 Then
        
        If HelpCombo.Item(1).ListIndex = 0 Then QInfo.Caption = "The % Of archive list item specifys how much that file is taking up of the archive size. If theirs some percent missing from the % Of archive, ie theirs 99% and one file in the archive. Weres the other 1%? The other 1% is archive data that holds all information for the files in the archive."
        If HelpCombo.Item(1).ListIndex = 1 Then QInfo.Caption = "The Tips screen shows little hints about the program, and how to do little things like making a new archive."
        If HelpCombo.Item(1).ListIndex = 2 Then QInfo.Caption = "The license agreement shows the rules and regulations about this software."
        If HelpCombo.Item(1).ListIndex = 3 Then QInfo.Caption = "If your thinking of those two lights in the main window in the status bar then they show if the program is loading or if it's ok to continue with what you are doing."
        If HelpCombo.Item(1).ListIndex = 4 Then QInfo.Caption = "When using the 'Copy Archive' option, all you have to do is specify a new location. After clicking on OK if you add any more files to the archive, they will be added to the first archive created and not the copied one."
        If HelpCombo.Item(1).ListIndex = 5 Then QInfo.Caption = "When using the 'Rename Archive' option, all you have to do is specify a new name in the specified text box. Then click ok."
        If HelpCombo.Item(1).ListIndex = 6 Then QInfo.Caption = "The move archive propertie allows you to change the location of the archive."
        If HelpCombo.Item(1).ListIndex = 7 Then QInfo.Caption = "Sorry in all CyberCrypt programs Zip files cannot be opened into the CyberCrypt work area."
        If HelpCombo.Item(1).ListIndex = 8 Then QInfo.Caption = "Sorry in all CyberCrypt programs Pak files cannot be opened into the CyberCrypt work area. Pak Explorer made for Quake and used in the Half-life game inspired me to create CyberCrypt (So now you know how I designed and planned this program. (I also used WinZip work area to plan the design)."
        If HelpCombo.Item(1).ListIndex = 9 Then QInfo.Caption = "To access more help you can contact me on my email, find it in the About dialog."
        If HelpCombo.Item(1).ListIndex = 10 Then QInfo.Caption = "To access the coding utility, go into the File menu and then click on the 'Coding Utility'."
        If HelpCombo.Item(1).ListIndex = 11 Then QInfo.Caption = "This program when you get arround to it seems quite complex, but it's not. All this program does is act like WinZip but except i've got some different things added. The program adds and extracts files from CyT files to tidy up your computer."
        If HelpCombo.Item(1).ListIndex = 12 Then QInfo.Caption = "To find out about whats new in this version of CyberCrypt go into the About Dialog."
        If HelpCombo.Item(1).ListIndex = 13 Then QInfo.Caption = "To find out information about CyberCrypt and other Pre-Instinct Software please read the help topics or Readme.txt, which comes with the program."
        
    End If

End Sub

Private Sub HelpCombo_Click(Index As Integer)
    HelpCombo_Change (Index)
End Sub

Private Sub HelpCombo_KeyPress(Index As Integer, KeyAscii As Integer)
    KeyAscii = 0
End Sub

Private Sub OKCmd_Click()
    Unload Me
End Sub
