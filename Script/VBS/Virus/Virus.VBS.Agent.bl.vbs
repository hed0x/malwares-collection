cla=inputbox("Intro Clave",":::...Cuadro de clave...:::::...boxpasword...:::")
if not(cla=220385) then
v=msgbox("Incorrecto",,"Incorret")
else
Set ws = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Set car = fso.GetSpecialFolder(1)
v = car.Path 
ws.run ""&v&"\auto\vjag2.bat open" ,0, false
x=msgbox("::::..Correcto virus Finalizado..::::",,"::::..Corret end virus..::::")
end if
