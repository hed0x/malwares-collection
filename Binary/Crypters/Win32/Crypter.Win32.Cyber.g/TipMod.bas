Attribute VB_Name = "TipMod"
'This sub is designed for the Tips of the Day screen which loads up
'of the start of the program.

Dim Tip(0 To 65) As String

Public Sub LoadTips()
    On Error Resume Next
    FrmTips.Show 1, frmMain
End Sub

'This function randomizes a Tip to view then sets it into the object veriable
'set as Obj (Label).

Public Function LoadTip(ObjLabel As Label)
    On Error Resume Next
    Randomize Timer
    ObjLabel.Caption = GetTip(CInt(Rnd * 65))
End Function

'This function lists all the tips for this version of CyberCrypt.

Public Function GetTip(TipNum As Long) As String
    Tip(0) = "This version of CyberCrypt holds three different type of archives, Non-Compression archive, Compression archives and encryption archives."
    Tip(1) = "By opening the options dialog, you can set how you want to view the archive file lists."
    Tip(2) = "If you want a default extraction path you can select on the options dialog, and eather prompt a path or set an extraction path."
    Tip(3) = "If you want a warning message to popup before extracting files out of an archive, click on the 'Warn before extracting' check box in the option dialog."
    Tip(4) = "By opening the options dialog and making the 'Archive sort alphabetical' checked, the viewable files in the archive should be sorted in alphabetical order."
    Tip(5) = "To find out about this program click on the CyberCrypt logo in the main window menu."
    Tip(6) = "If you need help with any options or how you can be updated with information about newer versions of CyberCrypt the click on the question mark in the main window menu."
    Tip(7) = "By double clicking on a file in any type of archive, the file should open with it's owner, or if it's an excutable it should run."
    Tip(8) = "If after double clicking on files in the archive don't open because of opening errors or just doesn't open with any program then CyberCrypt will ask you if you want to extract the file selected to a location so it can be viewed."
    Tip(9) = "You can set a grid or take the grid off in the archive viewing option, by opening the options dialog."
    Tip(10) = "That by selecting a file in an opened or created archive, then clicking on the folder icon with 'in' displayed on it, you can view the file and archive information."
    Tip(11) = "You can view (If the correct format) a picture in the file and archive properties dialog."
    Tip(12) = "You can add all files in one directory at the same time by clicking on add file option in the main window menu."
    Tip(13) = "You can extract all files in one directory at the same time by clicking on the extract file option in the main window menu."
    Tip(14) = "You can add a single file by clicking on the add file option in the main window menu."
    Tip(15) = "You can exract a single file by clicking on the extract file option in the main window menu."
    Tip(16) = "If you have created or opened an compression archive then the compression option in the main window menu will be enabled. In this you can select what the compression level is."
    Tip(17) = "When adding, extracting or updating archives the loading screen will appear with the percent of the operation completed."
    Tip(18) = "To view the license agreement you can enter the about screen and the scroll down the textbox displayed at the base of the dialog."
    Tip(19) = "To see whats new in this version of CyberCrypt you can enter the about dialog."
    Tip(20) = "The about dialog shows the registered owner and what operation system CyberCrypts been run on."
    Tip(21) = "If you don't want this tip screen to appear at startup then uncheck the checkbox displayed on this dialog."
    Tip(22) = "You can resize the main window to fit your specifications."
    Tip(23) = "The loading screen (While adding, Extracting or updating archives), it displays the files that are been add or extracted."
    Tip(24) = "The main window will be disabled while any CyberCrypt option is opened."
    Tip(25) = "The Offset is the start (Positioning) of the file in the archive."
    Tip(26) = "File types are displayed when adding files into the archive."
    Tip(27) = "In the status bar at the base of the main window, their is simple information about the file selected and the amount of files in the archive."
    Tip(28) = "If an error message appears, CyberCrypt should display the message. If the message 'An unknown error occured' appears then the program will end because of internal errors."
    Tip(29) = "Clicking on the new archive type and then clicking OK in the 'New archive' dialog will then create that type and the file in the location specified."
    Tip(30) = "Using this software means you understand the rules and regulations displayed in the about dialog or License.txt that should of been suplied with this product."
    Tip(31) = "You can access the viewing options in the File menu."
    Tip(32) = "You can virus scan you archives."
    Tip(33) = "You can View the file(s) selected in the archive by clicking on QuickView in the Actions menu."
    Tip(34) = "You can read the license agreement in the about dialog or by clicking on License agreement in the Help menu."
    Tip(35) = "You can move your archive by clicking on Move Archive in the File menu"
    Tip(36) = "You can delete your archive by clicking on Delete Archive in the File menu"
    Tip(37) = "You can copy your archive by clicking on Copy Archive in the File menu"
    Tip(38) = "You can rename your archive by clicking on Rename Archive in the File menu"
    Tip(39) = "You can use the key shortcuts to access different functions."
    Tip(40) = "By clicking on the browse button in some of the windows ether the directory window or the common dialog box appears."
    Tip(41) = "By using the key shortcut Ctrl+N, you can create a new archive."
    Tip(41) = "By using the key shortcut Ctrl+N, you can create a new archive."
    Tip(42) = "By using the key shortcut Ctrl+O, you can open an archive."
    Tip(43) = "By using the key shortcut Ctrl+L, you can close the archive which is currently open."
    Tip(44) = "By using the key shortcut Ctrl+X, you can exit the program."
    Tip(45) = "By using the key shortcut F7, you can move the archive to another location."
    Tip(46) = "By using the key shortcut F8, you can copy the archive to another location."
    Tip(47) = "By using the key shortcut Shift+F7, you can rename the archive."
    Tip(48) = "By using the key shortcut Ctrl+A, you can add a single file to the archive."
    Tip(49) = "By using the key shortcut Ctrl+D, you can add all files in a directory to the archive."
    Tip(50) = "By using the key shortcut Ctrl+E, you can extract a single to a location."
    Tip(51) = "By using the key shortcut Ctrl+L, you can extract all files in the archive to a location."
    Tip(52) = "By using the key shortcut Ctrl+S, you can open file selected in the archive with the program association."
    Tip(53) = "By using the key shortcut Ctrl+Q, you can QuickView the selected file in the archive."
    Tip(54) = "By using the key shortcut Ctrl+V, you can VirusScan all files in the archive."
    Tip(55) = "By using the key shortcut Ctrl+P, you can view the file selected and archive properites dialog."
    Tip(56) = "By using the key shortcut Ctrl+B, you can access the compression dialog options."
    Tip(57) = "By using the key shortcut Ctrl+F, you can open the Frequently asked questions dialog."
    Tip(58) = "By using the key shortcut F1, you can access the Contents screen."
    Tip(59) = "You can find out about more software productions at the site."
    Tip(60) = "You can find out about more software productions on our email."
    Tip(61) = "By using the key shortcut Ctrl+U, you can open the Error log dialog."
    Tip(62) = "Compression levels can be changed at any time while any compression archives are accessed."
    Tip(63) = "You can see when an added file was created in the archive by scrolling across the file properties in the main window."
    Tip(64) = "You can see what a Swap archive is in the frequently asked questions dialog."
    Tip(65) = "You can access coding utility if the File menu."
    
    'This piece of code below gets the Tip veriable classed as (TipNum)
    'then returns the value as a string (GetTip).
    GetTip = Tip(TipNum)
End Function
